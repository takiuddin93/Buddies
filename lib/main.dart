import 'package:Buddies/screens/loginPage.dart';
import 'package:flutter/material.dart';
import 'package:Buddies/screens/homePage.dart';

bool isLoggedIn = false;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Buddies',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        dialogBackgroundColor: Colors.black,
        primarySwatch: Colors.grey,
        cardColor: Colors.white70,
        accentColor: Colors.black,
      ),
      home: Navigator(
        pages: [
          MaterialPage(child: Login()),
        ],
        onPopPage: (route, result) {
          if (!route.didPop(result)) {
            return false;
          } else {
            return true;
          }
        },
      ),
    );
  }
}
