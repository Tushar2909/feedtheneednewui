import 'package:flutter/material.dart';

import '../utils/routes.dart';

class SenderPage extends StatefulWidget {
  @override
  _SenderPage createState() => _SenderPage();
}

class _SenderPage extends State<SenderPage> {
  //  final bool value = false;
  // int val = -1;
  late String email;
  final ButtonStyle style =
      ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));
  @override
  Widget build(BuildContext context) {
    return Material(
         color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // ListTile(
              //   title: const Text("Male"),
              //   leading: Radio(
              //     value: 1,
              //     groupValue: val,
              //     onChanged: (value) {
              //       setState(() {
              //         val =int(value) ;
              //       });
              //     },
              //     activeColor: Colors.green,
              //   ),
              // ),
              // ListTile(
              //   title: const Text("Female"),
              //   leading: Radio(
              //     value: 2,
              //     groupValue: val,
              //     onChanged: (value) {
              //       setState(() {
              //         val = value;
              //       });
              //     },
              //     activeColor: Colors.green,
              //   ),
              // ),
           
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 5, 10, 15),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          icon: Icon(Icons.local_phone),
                          hintText: "Enter Phone Number",
                          labelText: "Phone Number",
                        ),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return ("Phone number cannot be empty!");
                          } else if (value.length == 10) {
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
                    hintText: "Enter Pickup location",
                    labelText: "Enter Address",
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
  style: ElevatedButton.styleFrom(
    primary: Colors.deepPurpleAccent, // background
    onPrimary: Colors.white, // foreground
  ),
                

              onPressed: () {
                  Navigator.pushNamed(context, MyRoutes.MapsRoute);
                },
                child: const Text(
                  "Submit",
                  style: TextStyle(
                    color: Colors.white,
                    
                    
                    fontSize: 25,
                    fontStyle: FontStyle.normal,
                    // fontWeight: FontWeight.bold,
                  ),
                ),
              ),
  
            ],
          ),
        ));
  }
}
