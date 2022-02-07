import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:weight_tracker/firebase/firebase_auth.dart';
import 'package:weight_tracker/pages/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late FirebaseAuth auth;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Login Page'),
        ),
        body: Column(
          children: [
            Expanded(flex: 40, child: Container()),
            ElevatedButton(
                onPressed: () {
                  signAnonymously();
                },
                child: const Text('Sign In')),
            Expanded(flex: 40, child: Container()),
          ],
        ));
  }

  Future<void> signAnonymously() async {
    AppAuth().signInUser().then((value) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(),
          ));
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Logged In')));
    });
  }
}
