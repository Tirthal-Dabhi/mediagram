import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mediagram/auth/init_app.dart';
import 'package:mediagram/bloc/chat/chat_bloc.dart';
import 'package:mediagram/bloc/messages/messages_bloc.dart';
import 'package:mediagram/bloc/post/post_bloc.dart';
import 'package:mediagram/bloc/profile/profile_bloc.dart';
import 'package:mediagram/firebase_options.dart';
import 'package:mediagram/push_notification/service.dart';
import 'package:mediagram/service/cloud_messages/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
   );
  await FirebaseMessagesService.getToken();
  await FirebaseMessagesService.requestMessageService();
  FirebaseMessagesService.listenFirebaseMessages();
  NotificationService.initState();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProfileBloc(),
          lazy: true,
        ),
        BlocProvider(
          create: (context) => PostBloc(),
          lazy: true,
        ),
        BlocProvider(
          create: (context) => ChatBloc(),
          lazy: true,
        ),
        BlocProvider(
          create: (context) => MessageSizeBloc(),
          lazy: true,
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.lightBlue,
          fontFamily: "Ubuntu",
        ),
        debugShowCheckedModeBanner: false,
        home: const InitApp(),
      ),
    );
  }
}
