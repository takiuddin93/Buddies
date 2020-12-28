import 'package:flutter/material.dart';
import 'package:Buddies/widgets/appBar.dart';
import 'package:Buddies/widgets/progressWidget.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar(
        context,
        isappbarTitle: false,
        appbarTitle: "Search",
        disablebackButton: false,
      ),
      body: circularProgress(context),
    );
  }
}
