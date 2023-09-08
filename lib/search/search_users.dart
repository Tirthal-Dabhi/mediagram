import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mediagram/bloc/profile/profile_bloc.dart';
import 'package:mediagram/search/users_builder.dart';
import 'package:mediagram/service/Firebase/user_service.dart';
import 'package:mediagram/widget/textformfield.dart';


class SearchUsers extends StatefulWidget {
  const SearchUsers({Key? key}) : super(key: key);

  @override
  State<SearchUsers> createState() => _SearchUsersState();
}

class _SearchUsersState extends State<SearchUsers> {
  TextEditingController search = TextEditingController();
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ProfileBloc>(context).add(
      GetUserProfileEvent(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [Colors.deepOrangeAccent,Colors.amberAccent,Colors.redAccent,Colors.orangeAccent],),
        ),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              expandedHeight: 75.0,
              leading: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.arrow_back_ios,
                ),
              ),
              flexibleSpace: const FlexibleSpaceBar(
                title: Text(
                  'Search',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Ubuntu',
                    decorationStyle: TextDecorationStyle.solid,
                    decorationThickness: 1,
                  ),
                ),
                centerTitle: true,
              ),
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              actions: [
                IconButton(
                  onPressed: () {},
                  color: Colors.green,
                  icon: const Icon(
                    Icons.notifications,
                  ),
                ),
              ],
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  InputField(
                    title: "Search",
                    controller: search,
                    search: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.search,
                      ),
                    ),
                  ),
                  UsersBuilder(
                    querySnapshot: UsersServices.getUsers(),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}