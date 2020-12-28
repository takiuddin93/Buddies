import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:Buddies/screens/dashboardPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:Buddies/resources/authentication_methods.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isLoggedIn = false;
  final AuthenticationMethods _authenticationMethods = AuthenticationMethods();

  Scaffold loginScreen() {
    print("Login Screen: " + isLoggedIn.toString());
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            top: MediaQuery.of(context).size.height * 0.64,
            left: MediaQuery.of(context).size.width * 0.20,
            right: MediaQuery.of(context).size.width * 0.20,
            child: FlatButton(
              color: Colors.blue,
              padding: EdgeInsets.all(1),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(2.0)),
                          color: Colors.white,
                        ),
                        child: SvgPicture.asset('assets/google_icon.svg')),
                  ),
                  Expanded(
                    flex: 8,
                    child: Text(
                      "Sign-In with Gooogle",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 1.6,
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
              onPressed: () => _googleLogin(),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(2.0))),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return loginScreen();
  }

  _googleLogin() {
    _authenticationMethods.signInWithGoogle().then((User user) {
      if (user != null) {
        authenticateUser(user);
      } else {
        print("There was an error");
      }
    });
  }

  void authenticateUser(User user) {
    _authenticationMethods.authenticateUser(user).then((isNewUser) {
      if (isNewUser) {
        _authenticationMethods.addDataToDb(user).then((value) {
          Navigator.pop(context);
          Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => Dashboard()));
        });
      } else {
        Navigator.pop(context);
        Navigator.of(context).push(
            MaterialPageRoute(builder: (BuildContext context) => Dashboard()));
      }
    });
  }
}
