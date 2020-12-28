import 'package:Buddies/screens/videoTest.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:Buddies/screens/loginPage.dart';
import 'package:Buddies/screens/dashboardPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:Buddies/resources/authentication_methods.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

bool isLoggedIn = false;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Main());
}

class Main extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<Main> {
  final AuthenticationMethods _authenticationMethods = AuthenticationMethods();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Buddies',
      theme: ThemeData(brightness: Brightness.dark),
      // home: VideoTest(),
      home: FutureBuilder(
        future: _authenticationMethods.getCurrentUser(),
        builder: (context, AsyncSnapshot<User> snapshot) {
          print("SNAPSHOT DATA: " + snapshot.hasData.toString());
          if (snapshot.hasData != false) {
            return Dashboard();
          } else {
            return Login();
          }
        },
      ),
    );
  }
}
