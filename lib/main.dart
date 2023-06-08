import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:signin_and_login_design/signin_and_login_screens/login_screen.dart';
import 'package:signin_and_login_design/signin_and_login_screens/signin_screen.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  final user = FirebaseAuth.instance.currentUser;

  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'signin or login design',
        theme: ThemeData(
          primarySwatch: Colors.purple,
        ),
        home: user != null ? login_screen() : signin_screen());
  }
}
