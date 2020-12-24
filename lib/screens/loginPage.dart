import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:Buddies/screens/homePage.dart';
import 'package:google_sign_in/google_sign_in.dart';

final GoogleSignIn _googleSignIn = GoogleSignIn();

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isLoggedIn = false;

  void initState() {
    super.initState();
    _googleSignIn.onCurrentUserChanged.listen((googleSignInAccount) {
      _googleLoginControl(googleSignInAccount);
    }, onError: (gError) {
      print("Error Message: " + gError);
    });
    _googleSignIn
        .signInSilently(suppressErrors: false)
        .then((googleSignInAccount) {
      _googleLoginControl(googleSignInAccount);
    }).catchError((gError) {
      print("Error Message: " + gError);
    });
  }

  _googleLoginControl(GoogleSignInAccount googleSignInAccount) async {
    if (googleSignInAccount != null) {
      setState(() {
        isLoggedIn = true;
      });
    } else {
      setState(() {
        isLoggedIn = false;
      });
    }
  }

  _googleLogin() {
    _googleSignIn.signIn();
  }

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
    if (isLoggedIn) {
      return Navigator(
        pages: [
          MaterialPage(child: Home()),
        ],
        onPopPage: (route, result) {
          if (!route.didPop(result)) {
            return false;
          } else {
            return true;
          }
        },
      );
    } else {
      return loginScreen();
    }
  }
}
