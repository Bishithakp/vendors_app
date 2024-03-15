// import 'package:flutter/material.dart';

// import '../repo/auth_helper.dart';
// import '../widget/custom_button.dart';

// import 'home_page.dart';

// class SignUp extends StatelessWidget {
//   const SignUp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     TextEditingController emailEditingController = TextEditingController();
//     TextEditingController passwordEditingController = TextEditingController();
//     TextEditingController confirmpasswordController = TextEditingController();

//     return Scaffold(
//         body: Column(children: [
//       Container(
//         padding: const EdgeInsets.all(10),
//         height: MediaQuery.of(context).size.height / 3,
//         width: MediaQuery.of(context).size.width / .9,
//         child: Image.asset('assets/images/image2.jpeg'),
//       ),
//       Padding(
//         padding: const EdgeInsets.all(10.0),
//         child: Column(children: [
//           const Text(
//             'SignUp',
//             style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//           ),
//           fitBox(),
//           inputField(
//               hintText: 'email',
//               errorMessage: 'errorMessage',
//               isPassword: false,
//               textEditingController: emailEditingController),
//           fitBox(),
//           inputField(
//               hintText: 'password',
//               errorMessage: 'errorMessage',
//               isPassword: true,
//               textEditingController: passwordEditingController),
//           fitBox(),
//           inputField(
//               hintText: 'Confirmpassword',
//               errorMessage: 'errorMessage',
//               isPassword: true,
//               textEditingController: confirmpasswordController),
//           fitBox(),
//           CustomButton(
//             label: 'Sign Up',
//             onTap: () {
//               if (confirmpasswordController.text ==
//                   passwordEditingController.text) {
//                 AuthenticationHelper()
//                     .signUp(
//                         email: emailEditingController.text,
//                         password: passwordEditingController.text)
//                     .then((result) {
//                   if (result == null) {
//                     print(result);
//                     Navigator.pushReplacement(context,
//                         MaterialPageRoute(builder: (context) => HomePage()));
//                   } else {
//                     var snackBar = SnackBar(content: Text(result));
//                     ScaffoldMessenger.of(context).showSnackBar(snackBar);
//                   }
//                 });
//               } else {
//                 var snackBar = SnackBar(content: Text('Incorrect Password'));
//                 ScaffoldMessenger.of(context).showSnackBar(snackBar);
//               }
//             },
//           )
//         ]),
//       )
//     ]));
//   }

//   SizedBox fitBox() => const SizedBox(
//         height: 10,
//       );
// }

// TextFormField inputField(
//     {required String hintText,
//     required String errorMessage,
//     required bool isPassword,
//     required TextEditingController textEditingController}) {
//   return TextFormField(
//     decoration: InputDecoration(
//       enabledBorder: inputBorder(color: const Color(0xFF000000)),
//       focusedBorder: inputBorder(
//         color: const Color(0xFF000000),
//       ),
//       errorBorder: inputBorder(
//         color: const Color(0xFFF44336),
//       ),
//       focusedErrorBorder: inputBorder(
//         color: const Color(0xFFF44336),
//       ),
//       hintText: hintText,
//       hintStyle: const TextStyle(
//         color: Colors.black,
//         fontSize: 18,
//         fontWeight: FontWeight.w500,
//       ),
//     ),
//     controller: textEditingController,
//     validator: (value) {
//       if (value == null || value.isEmpty) {
//         return errorMessage;
//       }
//       return null;
//     },
//     obscureText: isPassword,
//   );
// }

// OutlineInputBorder inputBorder({required Color color}) {
//   return OutlineInputBorder(
//     borderSide: BorderSide(color: color, width: 2),
//   );
// }
