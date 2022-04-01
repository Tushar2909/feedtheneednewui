// import 'package:flutter/material.dart';
// import 'package:myapp/pages/favourite_page.dart';
// import 'package:myapp/pages/home_page.dart';
// import 'package:myapp/pages/logout_page.dart';
// import 'package:myapp/pages/notification_page.dart';
// import 'package:myapp/pages/profile/profile_page.dart';

// class ButtomBar extends StatefulWidget {
//   @override
//   _ButtomBarState createState() => _ButtomBarState();
// }

// class _ButtomBarState extends State<ButtomBar> {
//   int currentIndex = 0;
//   final Screens = [
//     HomePage(),
//     FavouritePage(),
//     ProfilePage(),
//     NotificationPage(),
//     LogOutPage(),
//   ];
//   @override
//   Widget build(BuildContext context) => Scaffold(
//         body: Screens[currentIndex],
//         bottomNavigationBar: BottomNavigationBar(
//           type: BottomNavigationBarType.fixed,
//           backgroundColor: Colors.deepPurple,
//           selectedItemColor: Colors.white,
//           unselectedItemColor: Colors.white70,
//           //showSelectedLabels: false,
//           //showUnselectedLabels: false,
//           currentIndex: currentIndex,
//           onTap: (index) => setState(() => currentIndex = index),
//           items: [
//             BottomNavigationBarItem(
//               icon: Icon(Icons.home),
//               label: 'Home',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.favorite),
//               label: 'Favourite',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.person),
//               label: 'Profile',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.notifications),
//               label: 'Notification',
              
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.logout_sharp),
//               label: 'Log Out',
//             ),
//           ],
//         ),
//       );
// }
import 'package:flutter/material.dart';
import 'package:myapp/pages/favourite_page.dart';
import 'package:myapp/pages/home_page.dart';
import 'package:myapp/pages/logout_page.dart';
import 'package:myapp/pages/notification_page.dart';
import 'package:myapp/pages/profile/components/body.dart';
import 'package:myapp/pages/profile/profile_page.dart';

class ButtomBar extends StatefulWidget {
  @override
  _ButtomBarState createState() => _ButtomBarState();
}

class _ButtomBarState extends State<ButtomBar> {
  int currentIndex = 0;
  final Screens = [
    HomePage(),
    FavouritePage(),
    LogOutPage(),
    Body(),
  ];
  @override
  Widget build(BuildContext context) => Scaffold(
        body: Screens[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.deepPurple,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white70,
          //showSelectedLabels: false,
          //showUnselectedLabels: false,
          currentIndex: currentIndex,
          onTap: (index) => setState(() => currentIndex = index),
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.handshake),
              label: 'Donate',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: 'Notification',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
              //onclick: () {
                          //Navigator.pushNamed(context, MyRoutes.ForgotRoute);
                       // }
            ),
            
          ],
        ),
      );
}