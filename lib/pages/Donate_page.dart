import 'package:flutter/material.dart';

import '../utils/routes.dart';

class DonatePage extends StatefulWidget {
  const DonatePage({Key? key}) : super(key: key);

  @override
  State<DonatePage> createState() => _DonatePageState();
}

class _DonatePageState extends State<DonatePage> {
  @override
  
  Widget build(BuildContext context) {
    final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));
        // Color c = Color.fromARGB(255, 161, 105, 21);

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ElevatedButton(
            child: Text('Donate'),
            onPressed: () {
              Navigator.pushNamed(context, MyRoutes.SenderRoute);
            },
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.deepPurple),
                padding: MaterialStateProperty.all(EdgeInsets.all(10)),
                textStyle: MaterialStateProperty.all(TextStyle(fontSize: 20))),
             ),
SizedBox(
                height: 20,
              ),
           ElevatedButton(
            child: Text('Recieve'),
            onPressed: () {},
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.deepPurple),
                padding: MaterialStateProperty.all(EdgeInsets.all(10)),
                textStyle: MaterialStateProperty.all(TextStyle(fontSize: 20))),
             ),
        ],
      ),
    );
  }
}
