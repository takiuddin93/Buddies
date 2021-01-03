import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Buddies/screens/loginPage.dart';
import 'package:Buddies/screens/videoPage.dart';
import 'package:Buddies/screens/timelinePage.dart';
import 'package:Buddies/screens/searchPage.dart';
import 'package:Buddies/screens/profilePage.dart';
import 'package:google_sign_in/google_sign_in.dart';

final GoogleSignIn _googleSignIn = GoogleSignIn();

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  bool isLoggedIn = true;
  PageController _pageController;
  int _getPageIndex = 0;

  void initState() {
    super.initState();
    _pageController = PageController();
  }

  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  _whenPageChanges(int _pageIndex) {
    setState(() {
      this._getPageIndex = _pageIndex;
    });
  }

  _onTapChangePage(int _pageIndex) {
    _pageController.animateToPage(
      _pageIndex,
      duration: Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  Scaffold dashboardScreen() {
    print("Dashboard Screen: " + isLoggedIn.toString());
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          PageView(
            children: <Widget>[
              VideoPage(),
              TimeLinePage(),
              SearchPage(),
              ProfilePage(),
            ],
            controller: _pageController,
            onPageChanged: _whenPageChanges,
            physics: NeverScrollableScrollPhysics(),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 16.0, top: 0.0, right: 16.0, bottom: 16.0),
              child: Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  child: BottomNavigationBar(
                    type: BottomNavigationBarType.fixed,
                    currentIndex: _getPageIndex,
                    onTap: _onTapChangePage,
                    backgroundColor: Colors.transparent,
                    selectedItemColor: Colors.pink,
                    unselectedItemColor: Colors.blueGrey,
                    items: [
                      BottomNavigationBarItem(
                        label: '',
                        icon: Icon(
                          Icons.home,
                          color: Theme.of(context).accentColor,
                        ),
                      ),
                      BottomNavigationBarItem(
                        label: '',
                        icon: Icon(
                          Icons.timeline,
                          color: Theme.of(context).accentColor,
                        ),
                      ),
                      BottomNavigationBarItem(
                        label: '',
                        icon: Icon(
                          Icons.search,
                          color: Theme.of(context).accentColor,
                        ),
                      ),
                      BottomNavigationBarItem(
                        label: '',
                        icon: Icon(
                          Icons.person,
                          color: Theme.of(context).accentColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return dashboardScreen();
  }
}
