import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:signin_and_login_design/signin_and_login_screens/signin_screen.dart';
import '../home_screen/home_screen.dart';

class login_screen extends StatefulWidget {
  const login_screen({Key? key}) : super(key: key);

  @override
  State<login_screen> createState() => _login_screenState();
}

class _login_screenState extends State<login_screen> {
  @override
  TextEditingController Emailcontroller = TextEditingController();
  TextEditingController Passwordcontroller = TextEditingController();
  final auth = FirebaseAuth.instance;
  final DatabaseReference ref = FirebaseDatabase.instance.ref('Users');

  void Login() {
    auth
        .signInWithEmailAndPassword(
            email: Emailcontroller.text.toString(),
            password: Passwordcontroller.text.toString())
        .then((value) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => home_screen()));
    }).onError((error, stackTrace) {
      debugPrint(error.toString());
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Login'),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: TextFormField(
                controller: Emailcontroller,
                decoration: InputDecoration(hintText: 'Email'),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: TextFormField(
                controller: Passwordcontroller,
                decoration: InputDecoration(hintText: 'Password'),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                Login();
              },
              child: Container(
                height: 50,
                width: 250,
                child: Center(child: Text('Login')),
                decoration: BoxDecoration(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(30)),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account  "),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => signin_screen()));
                  },
                  child: Text(
                    'signin',
                    style: TextStyle(color: Colors.teal),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
