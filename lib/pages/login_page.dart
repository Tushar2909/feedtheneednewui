import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:magic_sdk/magic_sdk.dart';
import 'package:myapp/pages/home_page.dart';
import 'package:myapp/utils/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Magic magic = Magic.instance;

  final textController = TextEditingController(text: '+91');
  // final TextEditingController _otpController =
  //     TextEditingController(text: '+91');

  String name = "";
  bool changeButton = false;

  moveToHome(BuildContext context) async {
    if (_formkey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.ButtomBarRoute);
      setState(() {
        changeButton = false;
      });
    }
  }

  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color.fromARGB(255, 255, 255, 255),
      child: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              Image.asset(
                "assets/image/login_1image.jpg",
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Welcome $name",
                style: TextStyle(
                  fontSize: 25,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold,
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
                    //   child: Center(
                    //     child: TextFormField(
                    //       obscureText: _isObscure,
                    //       decoration: InputDecoration(
                    //         icon: Icon(Icons.lock),
                    //         hintText: "Enter Password",
                    //         labelText: "Password",
                    //         suffixIcon: IconButton(
                    //           icon: Icon(
                    //             _isObscure
                    //                 ? Icons.visibility
                    //                 : Icons.visibility_off,
                    //           ),
                    //           onPressed: () {
                    //             setState(() {
                    //               _isObscure = !_isObscure;
                    //             });
                    //           },
                    //         ),
                    //       ),
                    //       validator: (value) {
                    //         if (value!.isEmpty) {
                    //           return ("Please Enter Password");
                    //         } else if (value.length < 8) {
                    //           return ("Number length should be at east 10!");
                    //         }
                    //         return null;
                    //       },
                    //     ),
                    //   ),
                    // ),

                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 5, 10, 15),
                      child: TextFormField(
                        controller: textController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          icon: Icon(Icons.phone),
                          hintText: "Enter Phone number",
                          labelText: "Number",
                        ),
                        // validator: (value) {
                        //   if (value!.isEmpty) {
                        //     return ("Please Enter Your number");
                        //   } else if (value.length < 10 || value.length > 10) {
                        //     return ("Phone Number Length Should be 10 Digit");
                        //   }
                        //   return null;
                        // },
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    // TextButton(
                    //   style: ButtonStyle(
                    //     foregroundColor:
                    //         MaterialStateProperty.all<Color>(Colors.blue),
                    //   ),
                    //   onPressed: () async {
                    //     var token = await magic.auth
                    //         .loginWithSMS(phoneNumber: textController.text);
                    //     debugPrint('token, $token');

                    //     if (token.isNotEmpty) {
                    //       // Navigate to your home page
                    //       //  onPressed: () {
                    //       //   Navigator.pushNamed(context, MyRoutes.HomeRoute);

                    //       // };
                    //       moveToHome(context);
                    //     }
                    //   },
                    //   child: const Text('Login With Phone Number'),
                    // ),

                    Material(
                      color: Colors.blue,
                      borderRadius:
                          BorderRadius.circular(changeButton ? 50 : 8),
                      child: InkWell(
                        onTap: () async {
                          var token = await magic.auth
                              .loginWithSMS(phoneNumber: textController.text);
                          debugPrint('token, $token');

                          if (token.isNotEmpty) {
                            // Navigate to your home page
                            //  onPressed: () {
                            //   Navigator.pushNamed(context, MyRoutes.HomeRoute);

                            // };
                            moveToHome(context);
                          }
                        },
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 180),
                          width: changeButton ? 50 : 150,
                          height: 50,
                          alignment: Alignment.center,
                          child: changeButton
                              ? Icon(
                                  Icons.done,
                                  color: Colors.white,
                                )
                              : Text(
                                  "LOGIN",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),

                          // decoration: BoxDecoration(
                          //  color: Colors.deepPurpleAccent,
                          // shape: changeButton?BoxShape.circle:BoxShape.rectangle,

                          // ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),

                    // ElevatedButton(
                    //     child: Text(
                    //       "Forget Password?",
                    //     ),
                    //     style: TextButton.styleFrom(
                    //       minimumSize: Size(
                    //         150,
                    //         50,
                    //       ),
                    //     ),
                    //     onPressed: () {
                    //       Navigator.pushNamed(context, MyRoutes.ForgotRoute);
                    //     }),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "New Here? ",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontStyle: FontStyle.normal,
                              fontSize: 18,
                            ),
                            // textAlign: TextAlign.left,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, MyRoutes.RegisterRoute);
                            },
                            child: Text(
                              " Register Now",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                  color: Colors.blue),
                              //  textAlign: TextAlign.left,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
