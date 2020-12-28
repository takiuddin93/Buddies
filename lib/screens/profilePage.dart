import 'package:flutter/material.dart';
import 'package:Buddies/widgets/appBar.dart';
import 'package:Buddies/widgets/progressWidget.dart';
import 'package:Buddies/main.dart';
import 'package:Buddies/resources/authentication_methods.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final AuthenticationMethods _authenticationMethods = AuthenticationMethods();
  @override
  Widget build(context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar(
        context,
        isappbarTitle: false,
        appbarTitle: "Profile",
        disablebackButton: false,
      ),
      // body: circularProgress(context),
      body: Stack(
        children: <Widget>[
          Text(
            "Profile Page goes here.",
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w800,
                letterSpacing: 1.6,
                color: Colors.black),
          ),
          RaisedButton(onPressed: () {
            _authenticationMethods.signOut();
            Navigator.pop(context);
            Navigator.of(context).push(
                MaterialPageRoute(builder: (BuildContext context) => Main()));
          })
        ],
      ),
    );
  }
}
