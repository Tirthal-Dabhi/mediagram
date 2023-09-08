// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:mediagram/auth/auth.dart';
import 'package:mediagram/auth/forgot_password.dart';
import 'package:mediagram/auth/signup.dart';
import 'package:mediagram/manager/manage.dart';
import 'package:mediagram/service/Firebase/auth.dart';
import 'package:mediagram/widget/snackbar.dart';

// void main() {
//   runApp(
//     const MaterialApp(
//       home: Login(),
//     ),
//   );
// }

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool loginStatus = false;
  bool passwordValuechange = false;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  login() async {
    KeepUser.saveUser(
      email: email.text,
      password: password.text,
    );
    loginStatus = await FirebaseAuthenticationService.signIn(
      email: email.text,
      password: KeepUser.encryptPassword(password.text).base64,
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.deepOrange,
                  Colors.amber,
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Welcome Again!",
                  style: style().copyWith(
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                  textScaleFactor: 2.5,
                ),
                Text(
                  'Welcome back you have been missed !',
                  style: style().copyWith(
                    color: Colors.white,
                  ),
                  textScaleFactor: 1.75,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 16.0,
                ),
                TextFormField(
                  style: style(),
                  controller: email,
                  decoration: const InputDecoration(
                    filled: true,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey,),
                    ),
                    labelText: 'E-mail',
                    labelStyle: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                    hintText: 'Enter Your Email',
                    hintStyle: TextStyle(color: Colors.white,),
                    prefixIcon: Icon(Icons.email,color: Colors.white,),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                TextFormField(
                  style: style(),
                  controller: password,
                  obscureText: passwordValuechange,
                  decoration: InputDecoration(
                    filled: true,
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    labelText: 'Password',
                    labelStyle: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                    hintText: 'Enter Your Password',
                    hintStyle: const TextStyle(color: Colors.white,),
                    prefixIcon: const Icon(Icons.password,color: Colors.white,),
                    suffixIcon: IconButton(
                      color: Colors.white,
                      onPressed: () {
                        setState(() {
                          passwordValuechange = !passwordValuechange;
                        });
                      },
                      icon: Icon(passwordValuechange
                          ? Icons.visibility_off
                          : Icons.visibility),
                    ),
                  ),
                  keyboardType: TextInputType.visiblePassword,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ForgotPassword(),
                          ),
                        );
                      },
                      child: Text(
                        'Forgot Password',
                        style: style().copyWith(
                          color: Colors.blue,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    fixedSize: const Size(
                      150,
                      50,
                    ),
                  ),
                  onPressed: () async {
                    if (email.text.isNotEmpty && password.text.isNotEmpty) {
                      await login();
                      if (loginStatus) {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => const PageManager(),
                          ),
                        );
                      }
                    } else {
                      popSnackbar(
                        context: context,
                        text: 'Incorrect Credential, Something Went Wrong',
                      );
                    }
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontFamily: 'Ubuntu',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  'Or Continue With',
                  style: style().copyWith(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Wrap(
                  alignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Text(
                      'Not a Member ? ',
                      style: style().copyWith(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const SignUp(),
                          ),
                        );
                      },
                      child: Text(
                        'Sign Up Now',
                        style: style().copyWith(
                          color: Colors.blue,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ]
                  .map((e) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: e,
                      ))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }

  TextStyle style() {
    return const TextStyle(
      fontFamily: "Ubuntu",
      color: Colors.white,
    );
  }
}
