import 'package:flutter/material.dart';

import 'package:myapp/pages/home_screen.dart';

class Maps extends StatelessWidget {
  const Maps({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Google Maps',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}
