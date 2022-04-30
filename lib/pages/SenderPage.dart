import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:myapp/pages/current_location_screen.dart';
import 'package:myapp/utils/httpclient.dart';

import '../utils/routes.dart';

class SenderPage extends StatefulWidget {
  @override
  _SenderPage createState() => _SenderPage();
}

class _SenderPage extends State<SenderPage> {
  String _locationMessage = "";
  double lat = 0.00;
  double lng = 0.00;

  void _getCurrentLocation() async {
    print("Called");
    final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    print(position);
    lat = position.latitude;
    lng = position.longitude;

    setState(() {
      _locationMessage = "${position.latitude}, ${position.longitude}";
      lat = position.latitude;
      lng = position.longitude;
    });
  }

  //  final bool value = false;
  // int val = -1;
  // String name = "";
  String email = "";
  String mobileno = "";
  String foodDetail = "";
  String address = "";
  String userlocation = "";
  bool changeButton = false;
  var position;

  moveToHome(BuildContext context) async {
    if (_formkey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.HomeRoute);
      setState(() {
        changeButton = false;
      });
    }
  }

  final _formkey = GlobalKey<FormState>();

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
              Padding(
                padding: const EdgeInsets.only(top: 50),
              ),
              Text(
                "Donate Food details",
                style: TextStyle(
                  color: Colors.deepPurpleAccent,
                  fontSize: 25,
                  fontStyle: FontStyle.normal,
                ),
              ),

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
                padding: const EdgeInsets.only(top: 20),
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
                        onChanged: (value) {
                          mobileno = value;
                          setState(() {});
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 15),
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
                  onChanged: (value) {
                    email = value;
                    setState(() {});
                  },
                  onSaved: (value) {
                    email = value!;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 15),
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
                  onChanged: (value) {
                    foodDetail = value;
                    setState(() {});
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 15),
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
                  onChanged: (value) {
                    address = value;
                    setState(() {});
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 5, 10, 15),
                child: InkWell(
                  onTap: () {
                    _getCurrentLocation();
                    // this.position = CurrentLocationScreen()
                  },
                  child: TextFormField(
                    minLines: 1,
                    maxLines: 5,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      icon: Icon(Icons.delivery_dining_sharp),
                      labelText: "Enter location",
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return ("This field cannot be empty cannot be empty!");
                      }
                      return null;
                    },
                    onChanged: (value) {
                      userlocation = value;
                      setState(() {});
                    },
                  ),
                ),
              ),
              // IconButton(
              //     onPressed: _getCurrentLocation,
              //     icon: const Icon(Icons.location_on)),
              // Material(
              //   color: Colors.deepPurpleAccent,
              //   child: InkWell(
              //       onTap: () async {
              //         var response = await client.post(
              //           '/donors',
              //           data: {
              // "email": email,
              // "mobileno": mobileno,
              // "foodDetails": foodDetail,
              // "address": address,
              // "userlocation": userlocation
              //           },
              //         );
              //         print(response.data);
              //         // moveToHome(context);
              //       },
              //       child: Text(
              //         "Submit",
              //                         style: TextStyle(
              //                           color: Colors.white,

              //                           fontSize: 25,
              //                           fontStyle: FontStyle.normal,
              //                           // fontWeight: FontWeight.bold,
              //                         ),
              //       )),
              // ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.deepPurpleAccent, // background
                  onPrimary: Colors.white, // foreground
                ),
                onPressed: () async {
                  _getCurrentLocation();
                  var response = await client.post(
                    '/donors',
                    data: {
                      "email": email,
                      "mobileno": mobileno,
                      "foodDetail": foodDetail,
                      "address": address,
                      "userlocation": userlocation,
                      "latitude": this.lat,
                      "longitude": this.lng
                    },
                  );
                  print(response.data);
                  // moveToHome(context);
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
