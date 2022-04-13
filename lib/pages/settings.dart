import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool status = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        title: Text("Setting"),
      ),
      body: Center(
        child: Container(
          child: FlutterSwitch(
            // toggleColor: Colors.deepPurple,
            // activeToggleColor: Color.fromARGB(2, 200, 37, 222),
            // inactiveToggleColor: Color.fromARGB(2, 79, 3, 89),
            // activeToggleColor: Colors.deepPurple,
            width: 55.0,
            activeColor: Colors.deepPurple,
            height: 25.0,
            valueFontSize: 12.0,
            toggleSize: 20.0,
            value: status,
            borderRadius: 20.0,
            padding: 4.0,
            showOnOff: true,
            onToggle: (val) {
              setState(() {
                status = val;
              });
            },
          ),
        ),
      ),
    );
  }
}
