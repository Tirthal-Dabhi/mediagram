import 'package:flutter/material.dart';
import 'package:mediagram/widget/buttons.dart';
import 'package:mediagram/widget/textformfield.dart';

// void main() {
//   runApp(const MaterialApp(
//     home: ForgotPassword(),
//   ));
// }

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController forgotpassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.amber,
        backgroundColor: Colors.deepOrangeAccent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 40,
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.deepOrange,
              Colors.amber,
            ],
          ),
        ),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Forgot Password',
                style: TextStyle(
                  fontFamily: 'Ubuntu',
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              const Text(
                'Please enter your email address so We will send a link to create a new password via email',
                style: TextStyle(
                  fontFamily: 'Ubuntu',
                  fontSize: 18,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 10.0,
              ),
              InputField(
                controller: forgotpassword,
                title: 'Email',
              ),
              const SizedBox(
                height: 25,
              ),
              AppsButton(
                title: 'Send',
                onPressed: () {},
                width: MediaQuery.of(context).size.width * 0.75,
                height: 45,
                fontSize: 20,
                borderRadius: 25,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.4,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
