import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:myapp/pages/login_page.dart';
import 'package:myapp/utils/httpclient.dart';
import '../utils/routes.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String name = "";
  String email = "";
  String mobile = "";
  String _locationMessage = "";
  double lat = 0.00;
  double lng = 0.00;

  Future<void> _getCurrentLocation() async {
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

  bool changeButton = false;
  //TextController to read text entered in text field
  // TextEditingController password = TextEditingController();
  // TextEditingController confirmpassword = TextEditingController();
  moveToHome(BuildContext context) async {
    if (_formkey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(const Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.loginRoute);
      setState(() {
        changeButton = false;
      });
    }
  }

  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                child: Text(
                  "Sign Up",
                  style: TextStyle(
                    fontSize: 35,
                    color: Colors.deepPurpleAccent,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                child: Text(
                  "Feed The Need Welcomes You",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.deepPurpleAccent,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 5, 10, 15),
                      child: TextFormField(
                          decoration: InputDecoration(
                            icon: Icon(Icons.person),
                            hintText: "Enter Username",
                            labelText: "Username",
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return ("Username cannot be empty!");
                            }
                            return null;
                          },
                          onChanged: (value) {
                            name = value;
                            setState(() {});
                          }),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.fromLTRB(15, 5, 10, 15),
                    //   child: TextFormField(
                    //     obscureText: _isObscure,
                    //     controller: password,
                    //     keyboardType: TextInputType.text,
                    //     decoration: InputDecoration(
                    //       icon: Icon(Icons.lock),
                    //       hintText: "Enter Email",
                    //       labelText: "Email",
                    // suffixIcon: IconButton(
                    //   icon: Icon(
                    //     _isObscure
                    //         ? Icons.visibility
                    //         : Icons.visibility_off,
                    //   ),
                    //   onPressed: () {
                    //     setState(() {
                    //       _isObscure = !_isObscure;
                    //     });
                    //   },
                    // ),
                    //     ),
                    //     validator: (value) {
                    //       if (value!.isEmpty) {
                    //         return ("Please Enter Email");
                    //       } else if (value.length < 8) {
                    //         return ("Number length should be at east 10!");
                    //       }
                    //       return null;
                    //     },
                    //   ),
                    // ),
                    // Padding(
                    //   padding: const EdgeInsets.fromLTRB(15, 5, 10, 15),
                    //   child: TextFormField(
                    //     obscureText: _isObscure,
                    //     controller: confirmpassword,
                    //     // obscureText: true,
                    //     keyboardType: TextInputType.text,
                    //     decoration: InputDecoration(
                    //       icon: Icon(Icons.lock),
                    //       hintText: "Enter Confirmed Password",
                    //       labelText: "Confirmed Password",
                    //       suffixIcon: IconButton(
                    //         icon: Icon(
                    //           _isObscure
                    //               ? Icons.visibility
                    //               : Icons.visibility_off,
                    //         ),
                    //         onPressed: () {
                    //           setState(() {
                    //             _isObscure = !_isObscure;
                    //           });
                    //         },
                    //       ),
                    //     ),

                    //     validator: (value) {
                    //       if (value!.isEmpty) {
                    //         return 'Please re-enter password';
                    //       }
                    //       print(password.text);
                    //       print(confirmpassword.text);
                    //       if (password.text != confirmpassword.text) {
                    //         return "Re-enter Password does not match";
                    //       }
                    //       return null;
                    //     },
                    //   ),
                    // ),

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
                            return 'Please Enter Email';
                          }
                          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                              .hasMatch(value)) {
                            return 'Please enter valid Email';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          email = value;
                        },
                      ),
                    ),

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
                        onChanged: (value) {
                          mobile = value;
                          setState(() {});
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Material(
                      color: Colors.deepPurpleAccent,
                      borderRadius:
                          BorderRadius.circular(changeButton ? 50 : 8),
                      child: InkWell(
                        onTap: () async {
                          var validResponse = await client
                              .post('/isValid', data: {'mobileno': mobile});
                          if (validResponse.data) {
                            // Show already registered dialog
                          } else {
                            await _getCurrentLocation();
                            final fcmToken =
                                await FirebaseMessaging.instance.getToken();
                            print("fcm: - ${fcmToken}");
                            var registerResponse = await client.post(
                              '/users',
                              data: {
                                "username": name,
                                "email": email,
                                "number": mobile,
                                "latitude": this.lat,
                                "longitude": this.lng,
                                "Token": fcmToken,
                              },
                            );
                            print(registerResponse.data);
                          }
                          moveToHome(context);
                        },
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 180),
                          width: changeButton ? 50 : 150,
                          height: 45,
                          alignment: Alignment.center,
                          child: changeButton
                              ? Icon(
                                  Icons.done,
                                  color: Colors.white,
                                )
                              : Text(
                                  "Sign Up",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22,
                                  ),
                                ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Already have an account ?",
                          style: TextStyle(
                            fontStyle: FontStyle.normal,
                            fontSize: 19,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, MyRoutes.loginRoute);
                          },
                          child: Text(
                            " Login",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 22,
                                color: Colors.deepPurpleAccent),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  buildInputDecoration(IconData email, String s) {}
}

// Column(
//   children: <Widget>[
//     inputFile(label: "Username"),
//     inputFile(label: "Email"),
//     inputFile(label: "Password", obscureText: true),
//     inputFile(label: "Confirm Password ", obscureText: true),
//     inputFile(label: "Phone Number "),
//   ],
// ),
// Container(
//   padding: EdgeInsets.only(top: 3, left: 3),
//   decoration: BoxDecoration(
//       borderRadius: BorderRadius.circular(50),
//       border: Border(
//         bottom: BorderSide(color: Colors.black),
//         top: BorderSide(color: Colors.black),
//         left: BorderSide(color: Colors.black),
//         right: BorderSide(color: Colors.black),
//       )),
//   child: MaterialButton(
//     minWidth: double.infinity,
//     height: 60,
//     onPressed: () {},
//     color: Color(0xff0095FF),
//     elevation: 0,
//     shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(35)),
//     child: Text(
//       "Sign up",
//       style: TextStyle(
//         fontStyle: FontStyle.normal,
//         fontWeight: FontWeight.w800,
//         fontSize: 20,
//         color: Colors.white,
//       ),
//     ),
//   ),
// ),

// SizedBox(
//   height: 5,
// ),

Widget inputFile({label, obscureText = false}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        label,
        style: TextStyle(
            fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black87),
      ),
      SizedBox(
        height: 5,
      ),
      TextField(
        obscureText: obscureText,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            border:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.grey))),
      ),
      SizedBox(
        height: 10,
      )
    ],
  );
}
