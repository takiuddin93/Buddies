import 'package:flutter/material.dart';
import 'package:Buddies/widgets/appBar.dart';
import 'package:Buddies/widgets/progressWidget.dart';

class TimeLinePage extends StatefulWidget {
  @override
  _TimeLinePageState createState() => _TimeLinePageState();
}

class _TimeLinePageState extends State<TimeLinePage> {
  @override
  Widget build(context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar(
        context,
        isappbarTitle: false,
        appbarTitle: "Timeline",
        disablebackButton: false,
      ),
      body: circularProgress(context),
    );
  }
}
