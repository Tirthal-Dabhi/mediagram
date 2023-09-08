import 'package:flutter/material.dart';
import 'package:mediagram/auth/login.dart';
import 'package:mediagram/auth/signup.dart';
import 'package:mediagram/widget/style.dart';

// void main() {
//   runApp(const MaterialApp(
//     home: Splash(),
//   ));
// }

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.deepOrange,
              Colors.amber,
            ],
          ),
        ),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: const LinearGradient(
                      colors: [Colors.greenAccent, Colors.lightBlue],
                    ),
                  ),
                  child: Text(
                    "Mediagram",
                    style: style().copyWith(
                      color: Colors.black,
                    ),
                    textScaleFactor: 3.5,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Discover Your Solution Here",
                    style: style().copyWith(
                      color: Colors.white,
                    ),
                    textScaleFactor: 2.9,
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    "Explore all the most existing solutions roles \n"
                    "based on your situation and compatibility",
                    style: style().copyWith(
                      color: Colors.white,
                    ),
                    textScaleFactor: 1.25,
                    textAlign: TextAlign.center,
                  ),
                  Wrap(
                    spacing: 10,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shadowColor: Colors.orange,
                          shape: const StadiumBorder(),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: ((context) {
                                return const Login();
                              }),
                            ),
                          );
                        },
                        child: const Text(
                          'Log in',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Ubuntu',
                          ),
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shadowColor: Colors.orange,
                          shape: const StadiumBorder(),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: ((context) {
                                return const SignUp();
                              }),
                            ),
                          );
                        },
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Ubuntu',
                          ),
                        ),
                      ),
                    ],
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
