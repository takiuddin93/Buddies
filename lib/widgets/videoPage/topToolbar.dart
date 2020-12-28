import 'package:flutter/material.dart';

class TopToolbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size media = MediaQuery.of(context).size;
    return Container(
      height: 72.0,
      width: media.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text('Following'),
          Container(
            width: 16.0,
          ),
          Text(
            'For you',
            style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
