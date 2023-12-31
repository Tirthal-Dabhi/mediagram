// getSoluions

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mediagram/model/solution.dart';
import 'package:mediagram/search/users_builder.dart';
import 'package:mediagram/service/Firebase/user_service.dart';
import 'package:mediagram/widget/style.dart';


class SolutionBuilder extends StatelessWidget {
  final Stream<QuerySnapshot<Object?>> querySnapshot;
  const SolutionBuilder({
    Key? key,
    required this.querySnapshot,
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
          if (snapshot.hasData) {
            if (snapshot.connectionState == ConnectionState.active) {
              List<Map<String, dynamic>> rawPosts = [];
              List<Solution> solutions = [];
              if ((snapshot.data as QuerySnapshot).docs.isNotEmpty) {
                for (var element in (snapshot.data as QuerySnapshot).docs) {
                  rawPosts.add(element.data() as Map<String, dynamic>);
                }
                solutions = rawPosts.map((e) => Solution.fromJson(e)).toList();
              }

              return UsersBuilder(
                querySnapshot: UsersServices.getOtherUsers(
                  solutions.map((e) => e.uid).toList(),
                ),
                builder: (users) {
                  return ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: solutions.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: const CircleAvatar(),
                        tileColor: Colors.transparent,
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              solutions[index].solution,
                              style: style(),
                            ),
                            Text(
                              getMessageTime(solutions[index].time.toDate()),
                              style: style().copyWith(fontSize: 12),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              );
              /* Card(
                    child: ListTile(
                      tileColor: Colors.transparent,
                      title: Text(
                        solutions[index].solution,
                        style: style(),
                      ),
                      trailing: Wrap(
                        children: [
                          Text(
                            getMessageTime(solutions[index].time.toDate()),
                            style: style(),
                          ),
                        ],
                      ),
                    ),
                  ); */

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

  String getMessageTime(DateTime dateTime) {
    final DateFormat formatter = DateFormat('dd-MMM-yyyy h:m');
    return formatter.format(dateTime);
  }
}
