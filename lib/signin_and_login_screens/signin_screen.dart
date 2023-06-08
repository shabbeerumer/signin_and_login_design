import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'login_screen.dart';

class signin_screen extends StatefulWidget {
  const signin_screen({Key? key}) : super(key: key);

  @override
  State<signin_screen> createState() => _signin_screenState();
}

class _signin_screenState extends State<signin_screen> {
  @override
  TextEditingController Emailcontroller = TextEditingController();
  TextEditingController Passwordcontroller = TextEditingController();
  TextEditingController Usernamecontroller = TextEditingController();
  final auth = FirebaseAuth.instance;
  final DatabaseReference ref = FirebaseDatabase.instance.ref('Users');

  void Signin() {
    auth
        .createUserWithEmailAndPassword(
            email: Emailcontroller.text.toString(),
            password: Passwordcontroller.text.toString())
        .then((value) {
      ref.child(value.user!.uid.toString()).set({
        'Uid': value.user!.uid.toString(),
        'username': Usernamecontroller.text,
        'email': value.user!.email.toString(),
        'password': Passwordcontroller.text
      }).then((value) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => login_screen()));
      }).onError((error, stackTrace) {
        debugPrint(error.toString());
      });
    }).onError((error, stackTrace) {
      debugPrint(error.toString());
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Signin'),
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
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: TextFormField(
                controller: Usernamecontroller,
                decoration: InputDecoration(hintText: 'Username'),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                Signin();
              },
              child: Container(
                height: 50,
                width: 250,
                child: Center(child: Text('Signin')),
                decoration: BoxDecoration(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(30)),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Already have an account  '),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => login_screen()));
                  },
                  child: Text(
                    'login',
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
