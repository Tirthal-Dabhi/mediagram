import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mediagram/auth/auth.dart';
import 'package:mediagram/auth/splash.dart';
import 'package:mediagram/manager/manage.dart';
import 'package:mediagram/widget/snackbar.dart';
import 'package:mediagram/widget/style.dart';

// void main() {
//   runApp(const MaterialApp(
//     home: InitApp(),
//   ));
// }

class InitApp extends StatefulWidget {
  const InitApp({super.key});

  @override
  State<InitApp> createState() => _InitAppState();
}

class _InitAppState extends State<InitApp> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      checkIfUserAvailable().then((value) {
        if (value) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: ((context) => const PageManager()),
            ),
          );
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: ((context) => const Splash()),
            ),
            );
          popSnackbar(context: context, text: 'Welcome');
        }
      });
    });
  }

  Future<bool> checkIfUserAvailable() async {
    await KeepUser.initKeepService();
    return await KeepUser.checkUser();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.amber,
              Colors.deepOrange,
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Lottie.asset(
              'asset/animation_lkmvcscf.json',
              alignment: Alignment.center,
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Welcome to ',
                    style: style().copyWith(
                      color: Colors.white,
                      fontSize: 35,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  TextSpan(
                    text: 'Mediagram',
                    style: style().copyWith(
                      color: const Color.fromARGB(255, 155, 243, 200),
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}