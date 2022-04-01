import "package:flutter/material.dart";

import '../utils/routes.dart';

class FogotPass extends StatelessWidget {
  const FogotPass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              //    Image.asset(
              //     "assets/image/fg.jpg",
              //     fit: BoxFit.cover,
              //  ),
              SizedBox(
                height: 20,
              ),
              // Text(
              //   "Welcome ",
              //   style: TextStyle(
              //     fontSize: 25,
              //     fontWeight: FontWeight.bold,
              //   ),
              // ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Enter Username",
                        labelText: "Username",
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return ("Username cannot be empty!");
                        }
                        return null;
                      },
                      // onChanged: (value) {
                      //   name = value;
                      //   setState(() {});
                      // }
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Enter OTP",
                        labelText: "OTP",
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return ("Password cannot be empty!");
                        } else if (value.length < 4) {
                          return ("Password length should be at least 4 !");
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                        child: Text("Validate",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            )),
                        style: TextButton.styleFrom(minimumSize: Size(130, 40)),
                        onPressed: () {
                          Navigator.pushNamed(context, MyRoutes.ButtomBarRoute);
                        })
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
