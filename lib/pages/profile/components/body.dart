import 'package:flutter/material.dart';
import 'package:myapp/pages/profile/components/profile_pic.dart';
import 'package:myapp/pages/profile/components/profile_menu.dart';
import '../../../utils/routes.dart';
import 'profile_pic.dart';
import 'profile_menu.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          ProfilePic(),
          SizedBox(height: 20),
          ProfileMenu(
            text: "My Account",
            icon: "assets/icons/User Icon.svg",
            press: () =>
                {Navigator.pushNamed(context, MyRoutes.MyAccountRoute)},
          ),
          ProfileMenu(
            text: "Notifications",
            icon: "assets/icons/Bell.svg",
            press: () =>
                {Navigator.pushNamed(context, MyRoutes.NotificationtRoute)},
          ),
          ProfileMenu(
            text: "Settings",
            icon: "assets/icons/Settings.svg",
            press: () {
              Navigator.pushNamed(context, MyRoutes.SettingsRoute);
            },
          ),
          ProfileMenu(
            text: "Help Center",
            icon: "assets/icons/Question mark.svg",
            press: () {},
          ),
          ProfileMenu(
              text: "Log Out",
              icon: "assets/icons/Log out.svg",
              press: () {
                Navigator.pushNamed(context, MyRoutes.RegisterRoute);
              }),
        ],
      ),
    );
  }
}
