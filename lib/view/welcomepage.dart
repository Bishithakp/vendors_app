import 'package:flutter/material.dart';

import '../widget/custom_button.dart';

import 'login_page.dart';
import 'sign.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
              Container(
                height: MediaQuery.of(context).size.height/2,
                child: const Center(
                  child: Text(
                    'Welcome\nto\nStationary App',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              CustomButton(
                label: 'LogIn',
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const LoginPage()));
                },
              ),
              // CustomButton(
              //     onTap: () {
              //       Navigator.push(context,
              //           MaterialPageRoute(builder: (context) => const SignUp()));
              //     },
              //     label: 'SignUp')
            ])));
  }
}