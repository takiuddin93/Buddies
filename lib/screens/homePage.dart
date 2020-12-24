import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Buddies/screens/loginPage.dart';
import 'package:Buddies/screens/timeline.dart';
import 'package:Buddies/screens/searchPage.dart';
import 'package:Buddies/screens/profilePage.dart';
import 'package:google_sign_in/google_sign_in.dart';

final GoogleSignIn _googleSignIn = GoogleSignIn();

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isLoggedIn = true;
  PageController _pageController;
  int _getPageIndex = 0;

  void initState() {
    super.initState();
    _pageController = PageController();

    _googleSignIn.onCurrentUserChanged.listen((googleSignInAccount) {
      _googleLoginControl(googleSignInAccount);
    }, onError: (gError) {
      print("Error Message: " + gError);
    });
    _googleSignIn
        .signInSilently(suppressErrors: false)
        .then((googleSignInAccount) {
      _googleLoginControl(googleSignInAccount);
    }).catchError((gError) {
      print("Error Message: " + gError);
    });
  }

  _googleLoginControl(GoogleSignInAccount googleSignInAccount) async {
    if (googleSignInAccount != null) {
      setState(() {
        isLoggedIn = true;
      });
    } else {
      setState(() {
        isLoggedIn = false;
      });
    }
  }

  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  _whenPageChanges(int _pageIndex) {
    this._getPageIndex = _pageIndex;
  }

  _onTapChangePage(int _pageIndex) {
    _pageController.animateToPage(
      _pageIndex,
      duration: Duration(milliseconds: 400),
      curve: Curves.bounceInOut,
    );
  }

  Scaffold homeScreen() {
    print("Home Screen: " + isLoggedIn.toString());
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView(
        children: <Widget>[
          TimeLinePage(),
          SearchPage(),
          ProfilePage(),
        ],
        controller: _pageController,
        onPageChanged: _whenPageChanges,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: CupertinoTabBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home)),
          BottomNavigationBarItem(icon: Icon(Icons.search)),
          BottomNavigationBarItem(icon: Icon(Icons.person)),
        ],
        currentIndex: _getPageIndex,
        onTap: _onTapChangePage,
        backgroundColor: Theme.of(context).accentColor,
        activeColor: Colors.white,
        inactiveColor: Colors.blueGrey,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (isLoggedIn) {
      return homeScreen();
    } else {
      return Navigator(
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
      );
    }
  }

  _googleLogout() {
    _googleSignIn.signOut();
  }
}
