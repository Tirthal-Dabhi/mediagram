import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mediagram/feed/feed.dart';
import 'package:mediagram/profile/user_profile.dart';
import 'package:mediagram/search/search_users.dart';
import 'package:mediagram/user_problem/problem.dart';

class PageManager extends StatefulWidget {
  const PageManager({super.key});


  @override
  State<PageManager> createState() => _PageManagerState();
}

class _PageManagerState extends State<PageManager> {
  PageController pageController = PageController();

  @override
  void dispose(){
    super.dispose();
    SystemChannels.platform.invokeMethod('SystemNavigator.pop');
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children: const [
        ShowFeed(),
        IssueScreen(),
        SearchUsers(),
        ShowProfile(),
      ],
    );
  }
}
