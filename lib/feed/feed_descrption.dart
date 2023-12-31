import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mediagram/feed/description.dart';
import 'package:mediagram/feed/solution_builder.dart';
import 'package:mediagram/model/post.dart';
import 'package:mediagram/model/user.dart';
import 'package:mediagram/service/Firebase/curd_user_database.dart';
import 'package:mediagram/service/Firebase/user_service.dart';
import 'package:mediagram/widget/style.dart';


class DescriptiveFeed extends StatefulWidget {
  final Post post;
  const DescriptiveFeed({Key? key, required this.post}) : super(key: key);

  @override
  State<DescriptiveFeed> createState() => _DescriptiveFeedState();
}

class _DescriptiveFeedState extends State<DescriptiveFeed> {
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          StreamBuilder(
            stream: FirebaseDatabaseCollection.usersCollectionReference
                .doc(widget.post.uid)
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text(
                  'Something went wrong',
                  style: style(),
                  textAlign: TextAlign.center,
                  textScaleFactor: 2,
                );
              } else {
                if (snapshot.hasData) {
                  if (snapshot.connectionState == ConnectionState.active) {
                    DocumentSnapshot doc = snapshot.data as DocumentSnapshot;
                    AppUser user =
                        AppUser.fromJson(doc.data() as Map<String, dynamic>);
                    return ListView(
                      controller: scrollController,
                      padding: const EdgeInsets.only(
                        left: 5,
                        right: 5,
                      ),
                      physics: const BouncingScrollPhysics(),
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.35,
                          child: Stack(
                            clipBehavior: Clip.none,
                            alignment: Alignment.bottomCenter,
                            children: [
                              Card(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Hero(
                                  tag: widget.post.title,
                                  child: Container(
                                    color: widget.post.images.isEmpty
                                        ? Colors.greenAccent
                                        : null,
                                    decoration: widget.post.images.isEmpty
                                        ? null
                                        : BoxDecoration(
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                  widget.post.images,
                                                  scale: 1),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: -50,
                                child: Hero(
                                  tag: widget.post.id,
                                  child: CircleAvatar(
                                    backgroundImage: user.image.isEmpty
                                        ? null
                                        : NetworkImage(
                                            user.image,
                                          ),
                                    radius: 75,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 75,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [],
                          ),
                        ),
                        Text(
                          user.username,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontFamily: 'Ubuntu',
                          ),
                          textScaleFactor: 2,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FeedText(
                                fontWeight: FontWeight.w500,
                                scale: 1.25,
                                text: "Question"),
                            FeedText(
                                fontWeight: FontWeight.w500,
                                scale: 1,
                                text: widget.post.title),
                            FeedText(
                                fontWeight: FontWeight.w500,
                                scale: 1.25,
                                text: "Description"),
                            FeedText(
                                fontWeight: FontWeight.w500,
                                scale: 1,
                                text: widget.post.body)
                          ]
                              .map(
                                (e) => Text(
                                  e.text,
                                  style: style()
                                      .copyWith(fontWeight: e.fontWeight),
                                  textScaleFactor: e.scale,
                                ),
                              )
                              .toList(),
                        ),
                        Text(
                          "Answers",
                          style: style(),
                          textScaleFactor: 1.3,
                        ),
                        widget.post.solutions.isEmpty
                            ? const Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Text(
                                  "No answer found \n"
                                  "I think you are smart , can you solve this",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              )
                            : SolutionBuilder(
                                querySnapshot: UsersServices.getSoluions(
                                  widget.post.id,
                                ),
                              ),
                        const SizedBox(
                          height: 450,
                        )
                      ],
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
          ),
          Description(
            scrollController: scrollController,
            postID: widget.post.id,
          ),
        ],
      ),
    );
  }
}

class FeedText {
  String text;
  double scale;
  FontWeight fontWeight;
  FeedText({required this.text, required this.fontWeight, required this.scale});
}
