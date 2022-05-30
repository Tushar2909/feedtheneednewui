import 'package:flutter/material.dart';
import 'package:myapp/pages/Maps.dart';
import 'package:myapp/pages/SenderPage.dart';
import 'package:myapp/pages/buttom_bar.dart';

import 'package:myapp/pages/home_page.dart';
import 'package:myapp/pages/myaccount.dart';
import 'package:myapp/pages/notification_page.dart';
import 'package:myapp/pages/profile/components/body.dart';
import 'package:myapp/pages/login_page.dart';
import 'package:magic_sdk/magic_sdk.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/pages/profile/components/body.dart';
import 'package:myapp/pages/profile/profile_page.dart';
import 'package:myapp/pages/registerpage.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'firebase_options.dart';
import 'package:myapp/pages/settings.dart';
import 'package:myapp/utils/routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      // options: DefaultFirebaseOptions.currentPlatform,
      );
  runApp(MyApp());
  Magic.instance = Magic("pk_live_F3A69882D37F8E12");
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Stack(
        children: [
          MaterialApp(
            theme: ThemeData(fontFamily: 'Roboto'),
            title: 'OTP',
            debugShowCheckedModeBanner: false,
            routes: {
              "/": (context) => ButtomBar(),
              MyRoutes.loginRoute: (context) => LoginPage(),
              MyRoutes.RegisterRoute: (context) => RegisterPage(),
              MyRoutes.HomeRoute: (context) => HomePage(),
              MyRoutes.ButtomBarRoute: (context) => ButtomBar(),
              MyRoutes.SenderRoute: (context) => SenderPage(),
              MyRoutes.MapsRoute: (context) => Maps(),
              MyRoutes.BodyRoute: (context) => Body(),
              MyRoutes.MyAccountRoute: (context) => MyAccount(),
              MyRoutes.NotificationtRoute: (context) => NotificationPage(),
              MyRoutes.SettingsRoute: (context) => SettingsPage(),
            },
          ),
          Magic.instance.relayer,
        ],
      ),
    );
  }
}
