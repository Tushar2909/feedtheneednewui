import 'package:flutter/material.dart';

import '../utils/routes.dart';

class SenderPage extends StatefulWidget {
  @override
  _SenderPage createState() => _SenderPage();
}

class _SenderPage extends State<SenderPage> {
  int counter = 0;
  late String email;
  final ButtonStyle style =
      ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));
  @override
  Widget build(BuildContext context) {
    return Material(
        color: Color.fromARGB(255, 255, 255, 255),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 5, 10, 15),
                      child: TextFormField(
                        decoration: InputDecoration(
                          icon: Icon(Icons.local_phone),
                          hintText: "Enter Phone Number",
                          labelText: "Phone Number",
                        ),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return ("Phone number cannot be empty!");
                          } else if (value.length < 10) {
                            return ("Number length should be at east 10!");
                          }

                          return null;
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 5, 10, 15),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    icon: Icon(Icons.email_sharp),
                    hintText: "Enter Email",
                    labelText: "Email",
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'This field cannot be empty';
                    }
                    if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                        .hasMatch(value)) {
                      return 'Please enter valid Email';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    email = value!;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 5, 10, 15),
                child: TextFormField(
                  minLines: 1,
                  maxLines: 5,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    icon: Icon(Icons.restaurant_menu_sharp),
                    hintText: "Enter Food Details",
                    labelText: "Enter Details",
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return ("This field cannot be empty cannot be empty!");
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 5, 10, 15),
                child: TextFormField(
                  minLines: 1,
                  maxLines: 5,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    icon: Icon(Icons.delivery_dining_sharp),
                    hintText: "Enter Food Pickup location",
                    labelText: "Enter location",
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return ("This field cannot be empty cannot be empty!");
                    }
                    return null;
                  },
                ),
              ),
              ElevatedButton(
                style: style,
                onPressed: () {
                  Navigator.pushNamed(context, MyRoutes.MapsRoute);
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        ));
  }
}
