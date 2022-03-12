import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';

final GoogleSignIn googleSignIn = GoogleSignIn();

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

bool isAuth = false;

class _HomeState extends State<Home> {
  @override
  void initState() {
    googleSignIn.onCurrentUserChanged.listen((account) {
      if (account != null) {
        print('User SignIn: $account');
        setState(() {
          isAuth = true;
        });
      } else {
        setState(() {
          isAuth = false;
        });
      }
    });
    super.initState();
  }

  void login() {
    googleSignIn.signIn();
  }

  Scaffold buildAuthScreen() {
    return Scaffold(
      body: Container(
        child: Text('AuthScreen'),
      ),
    );
  }

  Scaffold buildunAuthScreen() {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.deepPurple,
              Colors.teal,
            ],
          ),
        ),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Social App',
              style: TextStyle(
                fontSize: 90,
                fontFamily: 'Signatra',
                color: Colors.white,
              ),
            ),
            GestureDetector(
              onTap: () => login,
              child: Container(
                height: 60,
                width: 320,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image:
                          AssetImage('assets/images/google_signin_button.png'),
                      fit: BoxFit.cover),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return isAuth ? buildAuthScreen() : buildunAuthScreen();
  }
}
