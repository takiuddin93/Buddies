import 'package:flutter/material.dart';

class VideoDescription extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 64.0,
        padding: EdgeInsets.only(left: 16.0),
        child: Stack(
          // mainAxisSize: MainAxisSize.min,
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Positioned(
                child: Text('@firstjonny',
                    style: TextStyle(fontWeight: FontWeight.bold))),
            Positioned(
              top: 20.0,
              child: Text('Video title and some other stuff',
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            Positioned(
              top: 40.0,
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.music_note,
                    size: 16.0,
                    color: Colors.white,
                  ),
                  Text('Artist name - Album name -song',
                      style: TextStyle(fontSize: 12.0)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
