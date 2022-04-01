import 'package:flutter/material.dart';

class LogOutPage extends StatefulWidget {
  @override
  _LogOutPage createState() => _LogOutPage();
}

class _LogOutPage extends State<LogOutPage> {
  int counter = 0;
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: Text('Log Out'),
        ),
        body: Center(child: Text('Log Out', style: TextStyle(fontSize: 60))),
      );
}
