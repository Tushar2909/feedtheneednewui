// import 'package:flutter/material.dart';
// import 'package:flutter_switch/flutter_switch.dart';

// class SettingsPage extends StatefulWidget {
//   @override
//   _SettingsPageState createState() => _SettingsPageState();
// }

// class _SettingsPageState extends State<SettingsPage> {
//   bool status = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         backgroundColor: Colors.deepPurple,
//         title: Text("Setting"),
//       ),
//       body: Center(
//         child: Container(
//           child: FlutterSwitch(
//             // toggleColor: Colors.deepPurple,
//             // activeToggleColor: Color.fromARGB(2, 200, 37, 222),
//             // inactiveToggleColor: Color.fromARGB(2, 79, 3, 89),
//             // activeToggleColor: Colors.deepPurple,
//             width: 55.0,
//             activeColor: Colors.deepPurple,
//             height: 25.0,
//             valueFontSize: 12.0,
//             toggleSize: 20.0,
//             value: status,
//             borderRadius: 20.0,
//             padding: 4.0,
//             showOnOff: true,
//             onToggle: (val) {
//               setState(() {
//                 status = val;
//               });
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';

// void main() => runApp(const SettingsPage());

// class SettingsPage extends StatelessWidget {
//   const SettingsPage({Key? key}) : super(key: key);

//   static const String _title = 'Settings';

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: _title,
//       home: Scaffold(
//         appBar: AppBar(title: const Text(_title)),
//         body: const Center(
//           child: MyStatefulWidget(),
//         ),
//       ),
//     );
//   }
// }

// class MyStatefulWidget extends StatefulWidget {
//   const MyStatefulWidget({Key? key}) : super(key: key);

//   @override
//   State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
// }

// class _MyStatefulWidgetState extends State<MyStatefulWidget> {
//   bool _lights = false;

//   @override
//   Widget build(BuildContext context) {
//     return SwitchListTile(
//       title: const Text('Notifications'),
//       value: _lights,
//       onChanged: (bool value) {
//         setState(() {
//           _lights = value;
//         });
//       },
//       secondary: const Icon(Icons.lightbulb_outline),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'dart:math' as math;

void main() {
  runApp(SettingsPage());
}

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _notification = true;
  // bool _italicsMode = false;
  // bool _greenMode = false;
  // bool _birdMode = false;
  // bool _selectAll = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Settings"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SwitchListTile(
              title: Text(
                'Notifications',
              ),
              onChanged: (bool value) => setState(() => _notification = value),
              value: _notification,
              secondary:
                  Icon(_notification ? Icons.notifications_on : Icons.notifications_off),
            ),
            
            // SwitchListTile(
            //   title: Text(
            //     'Italics Mode',
            //     style: TextStyle(
            //         fontStyle:
            //             _italicsMode ? FontStyle.italic : FontStyle.normal),
            //   ),
            //   onChanged: (bool value) => setState(() => _italicsMode = value),
            //   value: _italicsMode,
            //   secondary: Icon(_notification
            //       ? Icons.sentiment_very_dissatisfied
            //       : Icons.sentiment_very_satisfied),
            //   activeColor:
            //       _greenMode ? Colors.green : Theme.of(context).accentColor,
            // ),
            // SwitchListTile(
            //   title: Text(
            //     'Green Mode',
            //     style: TextStyle(
            //         fontStyle:
            //             _italicsMode ? FontStyle.italic : FontStyle.normal),
            //   ),
            //   onChanged: (bool value) => setState(() => _greenMode = value),
            //   value: _greenMode,
            //   secondary: Transform(
            //     transform: Matrix4.rotationY(_greenMode ? math.pi : 0),
            //     alignment: Alignment.center,
            //     child: Icon(Icons.invert_colors),
            //   ),
            //   activeColor:
            //       _greenMode ? Colors.green : Theme.of(context).accentColor,
            // ),
            // SwitchListTile(
            //   title: Text(
            //     'Bird Mode',
            //     style: TextStyle(
            //         fontStyle:
            //             _italicsMode ? FontStyle.italic : FontStyle.normal),
            //   ),
            //   onChanged: (bool value) => setState(() => _birdMode = value),
            //   value: _birdMode,
            //   secondary: Text(
            //     "🐦",
            //     style: TextStyle(fontSize: 24.0),
            //   ),
            //   activeThumbImage: _birdMode
            //       ? NetworkImage("https://flutter.dev/images/favicon.png")
            //       : null,
            //   inactiveThumbImage: _birdMode
            //       ? NetworkImage("https://flutter.dev/images/favicon.png")
            //       : null,
            // ),
            // SizedBox(height: 50.0),
            // SwitchListTile(
            //   title: Text("Select All"),
            //   onChanged: (bool value) => setState(() {
            //     _selectAll = value;
            //     _notification = value;
            //     _italicsMode = value;
            //     _greenMode = value;
            //     _birdMode = value;
            //   }),
            //   value: _selectAll,
            // ),
          ],
        ),
      ),
    );
  }
}
