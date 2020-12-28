import 'package:flutter/material.dart';

AppBar appBar(context,
    {bool isappbarTitle, String appbarTitle, bool disablebackButton}) {
  return AppBar(
    iconTheme: IconThemeData(
      color: Colors.blueGrey,
    ),
    automaticallyImplyLeading: disablebackButton ? false : true,
    title: Text(
      isappbarTitle ? "Buddies" : appbarTitle,
      style: TextStyle(
        color: Colors.white,
        fontSize: isappbarTitle ? 32.0 : 24.0,
      ),
      overflow: TextOverflow.ellipsis,
    ),
    centerTitle: true,
    backgroundColor: Theme.of(context).accentColor,
  );
}
