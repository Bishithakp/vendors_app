import 'dart:io';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:vendors_app/repo/sharedpreferencehelper.dart';
import 'package:vendors_app/view/home_page.dart';

import 'firebase_options.dart';
import 'view/welcomepage.dart';
import 'view_model/stationery_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String status = '';

  statusValue() async {
    status = await SharedPreferncesHelper().getUserValue();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    statusValue();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => StationeryController()),
        ],
        child: MaterialApp(
            home: status == '' ? WelcomePage() : HomePage(value: status)));
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
