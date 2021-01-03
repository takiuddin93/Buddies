import 'package:Buddies/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ActionsToolbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.0,
      child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
        _getFollowAction(),
        _getSocialAction(
            iconData: Icons.favorite, title: '3.2m', isShare: false),
        _getSocialAction(
            iconData: Icons.chat_bubble, title: '16.4k', isShare: false),
        _getSocialAction(iconData: Icons.share, title: 'Share', isShare: false),
      ]),
    );
  }

  Widget _getFollowAction() {
    return Container(
      width: 60.0,
      height: 60.0,
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: Stack(
        children: <Widget>[_getProfilePicture(), _getAddIcon()],
      ),
    );
  }

  Widget _getProfilePicture() {
    return Positioned(
      left: 5.0,
      child: Container(
        height: 50.0,
        width: 50.0,
        padding: EdgeInsets.all(1.0),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(25.0)),
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          imageBuilder: (context, imageProvider) => Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.fill,
              ),
            ),
          ),
          placeholder: (context, url) => new CircularProgressIndicator(),
          errorWidget: (context, url, error) => new Icon(Icons.error),
        ),
      ),
    );
  }

  Widget _getAddIcon() {
    return Positioned(
      bottom: 0.0,
      left: 5.0,
      child: Container(
        width: 20.0,
        height: 20.0,
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 255, 43, 84),
            borderRadius: BorderRadius.circular(16.0)),
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 20.0,
        ),
      ),
    );
  }

  Widget _getSocialAction({IconData iconData, String title, bool isShare}) {
    return Container(
      width: 60.0,
      height: 60.0,
      margin: EdgeInsets.only(top: 10.0),
      child: Column(
        children: <Widget>[
          Icon(
            iconData,
            size: isShare ? 30.0 : 32.0,
            color: Colors.grey[200],
          ),
          Padding(
            padding: EdgeInsets.only(top: isShare ? 4.0 : 2.0),
            child: Text(
              title,
              style: TextStyle(fontSize: isShare ? 10.0 : 12.0),
            ),
          )
        ],
      ),
    );
  }
}
