import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mediagram/feed/single_feed_widget.dart';
import 'package:mediagram/model/post.dart';
import 'package:mediagram/widget/style.dart';

class PostsBuilder extends StatelessWidget {
  final Stream<QuerySnapshot> querySnapshot;
  final bool isUserPost;

  const PostsBuilder({
    Key? key,
    required this.querySnapshot,
    required this.isUserPost,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: querySnapshot,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text(
            'Something went wrong',
            style: style(),
            textAlign: TextAlign.center,
            textScaleFactor: 2,
          );
        } else {
          if (snapshot.hasData && snapshot.data != null) {
            if (snapshot.connectionState == ConnectionState.active) {
              List<Map<String, dynamic>> rawPosts = [];
              for (var element in (snapshot.data as QuerySnapshot).docs) {
                if (element.data() != null) {
                  rawPosts.add(element.data() as Map<String, dynamic>);
                }
              }
              List<Post> posts = rawPosts.map((e) => Post.fromJson(e)).toList();

              return ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  return IndividualFeed(
                    post: posts[index],
                    deleteOption: isUserPost,
                  );
                },
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          } else {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.greenAccent,
              ),
            );
          }
        }
      },
    );
  }
}
