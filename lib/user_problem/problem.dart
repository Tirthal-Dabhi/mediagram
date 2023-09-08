import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mediagram/bloc/post/post_bloc.dart';
import 'package:mediagram/model/post.dart';
import 'package:mediagram/service/Firebase/auth.dart';
import 'package:mediagram/user_problem/image_slider.dart';
import 'package:mediagram/widget/snackbar.dart';
import 'package:mediagram/widget/style.dart';
import 'package:mediagram/widget/textformfield.dart';

class IssueScreen extends StatefulWidget {
  const IssueScreen({Key? key}) : super(key: key);

  @override
  State<IssueScreen> createState() => _IssueScreenState();
}

class _IssueScreenState extends State<IssueScreen>
    with SingleTickerProviderStateMixin {
  bool isLoading = false;
  int importance = 0;
  TextEditingController question = TextEditingController();
  TextEditingController description = TextEditingController();
  Uint8List? issueImage;
  final issues = [];

  @override
  void initState() {
    super.initState();
  }

  Future<void> pickImage() async {
    ImagePicker imagePicker = ImagePicker();
    final file = await imagePicker.pickImage(source: ImageSource.gallery);
    if (file != null) {
      final image = await file.readAsBytes();
      issueImage = image;
      setState(() {});
    } else {
      popSnackbar(
        context: (context),
        text: 'Something went wrong , pick again',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<PostBloc, PostState>(listener: (context, state) {
      if (state is SavedState) {
        isLoading = !isLoading;
        question.clear();
        description.clear();
        issueImage = null;
        importance = 0;
        popSnackbar(
          context: context,
          text: 'Post Uploaded Successfully',
        );
        setState(() {});
      }
    }, child: BlocBuilder<PostBloc, PostState>(
      builder: (context, state) {
        return Scaffold(
          body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [Colors.deepOrangeAccent,Colors.amberAccent,Colors.redAccent,Colors.orangeAccent],),
            ),
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  expandedHeight: 75.0,
                  leading: IconButton(
                    onPressed: () {},
                    color: Colors.black,
                    icon: const Icon(
                      Icons.arrow_back_ios,
                    ),
                  ),
                  flexibleSpace: const FlexibleSpaceBar(
                    title: Text(
                      'Issue',
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
                      Text(
                        'Add your Question',
                        style: style(),
                        textAlign: TextAlign.center,
                        textScaleFactor: 1.75,
                      ),
                      Text(
                        '   Add Images',
                        style: style().copyWith(color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,),
                        textAlign: TextAlign.left,
                        textScaleFactor: 1.25,

                      ),
                      issueImage != null
                          ? ImageSlider(images: issueImage!)
                          : InkWell(
                        onTap: () async {
                          await pickImage();
                        },
                        child: Card(
                          elevation: 7,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceAround,
                            children: [
                              const Icon(
                                Icons.image,
                                size: 150,
                              ),
                              Text(
                                'Add Images',
                                style: style(),
                                textAlign: TextAlign.center,
                                textScaleFactor: 1.75,
                              ),
                              SizedBox(
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width *
                                    0.1,
                              )
                            ],
                          ),
                        ),
                      ),
                      // Text(
                      //   'Question',
                      //   style: style(),
                      //   textScaleFactor: 1.25,
                      // ),
                      // InputField(
                      //   controller: question,
                      // ),
                      Text(
                        '   Description',
                        style: style().copyWith(color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,),
                        textScaleFactor: 1.25,
                      ),
                      InputField(
                        title: 'Add your description',
                        controller: description,
                        textArea: 12,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 7, right: 7),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '   Importance',
                              style: style().copyWith(fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                              textScaleFactor: 1.25,
                            ),
                            Text(
                              '$importance %    ',
                              style: style().copyWith(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15,),
                              textScaleFactor: 1.25,
                            ),
                          ],
                        ),
                      ),
                      Slider(
                        activeColor: Colors.greenAccent,
                        thumbColor: Colors.greenAccent,
                        inactiveColor: Colors.greenAccent,
                        label: "Importance",
                        value: importance.toDouble(),
                        onChanged: (value) {
                          setState(() {
                            importance = value.toInt();
                          });
                        },
                        min: 0,
                        max: 100,
                      ),
                      state is UploadingState
                          ? Column(
                        children: [
                          const CircularProgressIndicator(
                            color: Colors.greenAccent,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Please wait ',
                            style: style(),
                            textScaleFactor: 1.25,
                          ),
                        ],
                      )
                          : ElevatedButton(
                        onPressed: onPost,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.greenAccent,
                          shape: const StadiumBorder(),
                        ),
                        child: Text('Post', style: style()),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    ));
  }

  onPost() {
    if (description.text.isNotEmpty) {
      BlocProvider.of<PostBloc>(context).add(
        CreatePostEvent(
          post: Post(
            id: '',
            title: '',
            body: description.text,
            importance: importance,
            views: 0,
            favourites: [],
            uid: FirebaseAuthenticationService.user.uid,
            time: Timestamp.now(),
            status: "Running",
            solutions: [],
            images: "",
          ),
          postImage: issueImage,
        ),
      );
    } else {
      popSnackbar(context: context, text: "Please fill the post");
    }
    /* isLoading = !isLoading;
    setState(() {});
    FirebaseDatabaseCollection.createPostDatabase(
      {
        "title": question.text,
        "body": description.text,
        "importance": importance,
        "views": 1,
        "time": DateTime.now(),
        "uid": FirebaseAuthenticationService.user.uid,
        "status": "Running",
        "solutions": [],
      },
      issueImage,
    ).then(
      (value) {
        isLoading = !isLoading;
        question.clear();
        description.clear();
        issueImage = null;
        importance = 0;
        popSnackbar(context: context, text: 'Post Uploaded Succecfully');
        setState(() {});
      },
    ); */
  }
}