import 'package:flutter/material.dart';
import 'package:Buddies/widgets/appBar.dart';
import 'package:Buddies/widgets/progressWidget.dart';

import 'package:Buddies/widgets/videoPage/topToolbar.dart';
import 'package:Buddies/widgets/videoPage/videoDescription.dart';
import 'package:Buddies/widgets/videoPage/actionsToolbar.dart';
import 'package:Buddies/widgets/videoPage/bottomToolbar.dart';

class VideoPage extends StatefulWidget {
  @override
  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  @override
  Widget build(context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: <Widget>[
          //Top Section
          TopToolbar(),
          //Middle Section
          Expanded(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                VideoDescription(),
                ActionsToolbar(),
              ],
            ),
          ),
          //Bottom Section
          // BottomToolbar()
          Container(
            height: 72.0,
          )
        ],
      ),
    );
  }
}
