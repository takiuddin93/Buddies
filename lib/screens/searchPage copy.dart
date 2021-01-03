// import 'package:Buddies/models/users.dart';
// import 'package:Buddies/resources/authentication_methods.dart';
// import 'package:Buddies/resources/friends_methods.dart';
// import 'package:Buddies/utils/universal_variables.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:Buddies/widgets/appBar.dart';
// import 'package:Buddies/widgets/progressWidget.dart';
// import 'package:Buddies/widgets/custom_tile.dart';
// import 'package:Buddies/provider/user_provider.dart';
// // import 'package:provider/provider.dart';

// class SearchPage extends StatefulWidget {
//   @override
//   _SearchPageState createState() => _SearchPageState();
// }

// class _SearchPageState extends State<SearchPage> {
//   final AuthenticationMethods _authenticationMethods = AuthenticationMethods();

//   final ContactMethods _contactMethods = ContactMethods();

//   List<Users> userList;
//   String query = "";
//   TextEditingController searchController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();

//     _authenticationMethods.getCurrentUser().then((User user) {
//       _authenticationMethods.fetchAllUsers(user).then((List<Users> list) {
//         setState(() {
//           userList = list;
//         });
//       });
//     });
//   }

//   searchAppBar() {
//     return Container(
//       height: 64,
//       color: Theme.of(context).accentColor,
//       child: Padding(
//         padding: EdgeInsets.all(0.0),
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: <Widget>[
//             Expanded(
//               flex: 1,
//               child: Align(
//                 alignment: Alignment.center,
//                 child: IconButton(
//                   icon: Icon(
//                     Icons.arrow_back,
//                     color: UniversalVariables.whiteColor,
//                   ),
//                   onPressed: () {},
//                 ),
//               ),
//             ),
//             Expanded(
//               flex: 9,
//               child: Align(
//                 alignment: Alignment.centerLeft,
//                 child: Padding(
//                   padding: EdgeInsets.only(left: 16),
//                   child: TextField(
//                     controller: searchController,
//                     onChanged: (val) {
//                       setState(() {
//                         query = val;
//                       });
//                     },
//                     cursorColor: UniversalVariables.blackColor,
//                     autofocus: true,
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       color: UniversalVariables.whiteColor,
//                       fontSize: 24,
//                     ),
//                     decoration: InputDecoration(
//                       suffixIcon: IconButton(
//                         icon: Icon(
//                           Icons.close,
//                           color: UniversalVariables.whiteColor,
//                         ),
//                         onPressed: () {
//                           WidgetsBinding.instance.addPostFrameCallback(
//                               (_) => searchController.clear());
//                         },
//                       ),
//                       border: InputBorder.none,
//                       hintText: "Search to add to contact",
//                       hintStyle: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 24,
//                         color: Color(0x88ffffff),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   buildSuggestions(UserProvider userProvider, String query) {
//     final List<Users> suggestionList = query.isEmpty
//         ? []
//         : userList != null
//             ? userList.where((Users users) {
//                 String _getUsername = users.username.toLowerCase();
//                 String _query = query.toLowerCase();
//                 String _getName = users.name.toLowerCase();
//                 bool matchesUsername = _getUsername.contains(_query);
//                 bool matchesName = _getName.contains(_query);

//                 return (matchesUsername || matchesName);
//               }).toList()
//             : [];

//     return ListView.builder(
//       itemCount: suggestionList.length,
//       itemBuilder: ((context, index) {
//         Users searchedUser = Users(
//           uid: suggestionList[index].uid,
//           profilePhoto: suggestionList[index].profilePhoto,
//           name: suggestionList[index].name,
//           username: suggestionList[index].username,
//         );
//         return CustomTile(
//           mini: false,
//           onTap: () => {},
//           title: Padding(
//             padding: EdgeInsets.only(left: 8, top: 0, right: 0, bottom: 0),
//             child: Text(
//               searchedUser.name,
//               style: TextStyle(
//                 color: UniversalVariables.textColor,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//           subtitle: Padding(
//             padding: EdgeInsets.only(left: 8, top: 0, right: 0, bottom: 0),
//             child: Text(
//               searchedUser.username,
//               style: TextStyle(color: UniversalVariables.subtextColor),
//             ),
//           ),
//           leading: CircleAvatar(
//             backgroundImage: NetworkImage(searchedUser.profilePhoto),
//             backgroundColor: UniversalVariables.greyColor,
//           ),
//           trailing: Container(
//               decoration: BoxDecoration(
//                   color: UniversalVariables.blueColor,
//                   borderRadius: BorderRadius.all(Radius.circular(4))),
//               // color: UniversalVariables.blueColor,
//               child: FlatButton(
//                   onPressed: () => _contactMethods.addContactToDb(
//                       userProvider.getUser, searchedUser),
//                   child: Text(
//                     "Add Contact",
//                     style: TextStyle(
//                       color: UniversalVariables.whiteColor,
//                     ),
//                   ))),
//         );
//       }),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final UserProvider userProvider = UserProvider();
//     return Scaffold(
//       backgroundColor: UniversalVariables.whiteColor,
//       appBar: PreferredSize(
//         preferredSize: const Size.fromHeight(kToolbarHeight),
//         child: searchAppBar(),
//       ),
//       body: Container(
//         padding: EdgeInsets.symmetric(horizontal: 20),
//         child: buildSuggestions(userProvider, query),
//       ),
//     );
//   }
// }
