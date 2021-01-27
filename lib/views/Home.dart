import 'dart:developer';

import 'package:alprep/api_manager/api_manager.dart';
import 'package:alprep/models/login_model.dart';
import 'package:alprep/views/firstScreen.dart';
import 'package:alprep/views/registration_page.dart';
import 'package:alprep/views/reset_password.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _email, _password;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Login loginModel;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loginModel = Login();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.white,
              gradient: new LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xffffffff), Color(0xffDEF2FC)],
              ),
            ),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 100.0, bottom: 100.0),
                    child: Image.asset(
                      'images/alprep-logo.png',
                      scale: 2.5,
                    ),
                  ),
                  Text(
                    'Welcome',
                    style: TextStyle(
                        fontSize: 33.0,
                        letterSpacing: 2.0,
                        color: Color(0xff000000),
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Login to your Alprep account',
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Color(0xff888888),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 25.0, right: 25.0, top: 10.0),
                    child: Container(
                      width: 320.0,
                      height: 60.0,
                      decoration: BoxDecoration(
                        // color: Colors.white,
                        borderRadius: new BorderRadius.circular(10.0),
                      ),
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          // errorBorder: InputBorder.none,
                          focusedBorder: OutlineInputBorder(
                            gapPadding: 6.0,
                            borderRadius: new BorderRadius.circular(10.0),
                            borderSide: new BorderSide(),
                          ),
                          contentPadding: EdgeInsets.all(30.0),
                          fillColor: Colors.grey,
                          focusColor: Colors.grey,
                          hintText: 'Email',
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(10.0),
                            borderSide: new BorderSide(),
                          ),
                          prefixIcon: Image.asset(
                            'images/user.png',
                            scale: 2.0,
                          ),
                        ),
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'Please enter Email';
                          }
                          if (!RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(value)) {
                            return 'Please enter valid email';
                          } else {
                            setState(() {
                              loginModel.emailId = value;
                            });
                          }
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 25.0, right: 25.0, top: 10.0),
                    child: Container(
                      width: 320.0,
                      height: 60.0,
                      decoration: BoxDecoration(
                        // color: Colors.white,
                        borderRadius: new BorderRadius.circular(10.0),
                      ),
                      child: TextFormField(
                        obscureText: false,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            // border: InputBorder.none,
                            contentPadding: EdgeInsets.all(20),
                            fillColor: Colors.green,
                            focusColor: Colors.grey,
                            focusedBorder: OutlineInputBorder(
                              // gapPadding: 6.0,
                              borderRadius: new BorderRadius.circular(10.0),
                              borderSide: new BorderSide(),
                            ),
                            border: new OutlineInputBorder(
                              gapPadding: 6.0,
                              borderRadius: new BorderRadius.circular(10.0),
                              borderSide: new BorderSide(),
                            ),
                            hintText: 'Password',
                            prefixIcon: Image.asset(
                              'images/password.png',
                              scale: 2.0,
                            ),
                            suffixIcon: Image.asset(
                              'images/visible.png',
                              scale: 1.5,
                            )),
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'Please enter password';
                          }
                          if (value.length < 8) {
                            return 'Password must contain more then 4 charecture';
                          } else {
                            setState(() {
                              loginModel.password = value;
                            });
                          }
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Container(
                    width: 320.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                      borderRadius: new BorderRadius.circular(10.0),
                      gradient: new LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [Color(0xff002D48), Color(0xff015181)],
                      ),
                    ),
                    child: FlatButton(
                        child: new Text("Login",
                            style: TextStyle(color: Color(0xffffffff))),
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            print(loginModel.toMap());
                            ApiService()
                                .login(loginModel.emailId, loginModel.password);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => FirstScreen()));
                          }
                        }

                        // shape: new RoundedRectangleBorder(
                        //     side: BorderSide(
                        //         color: Theme.of(context).primaryColor),
                        //     borderRadius: new BorderRadius.circular(10.0))
                        ),
                  ),
                  FlatButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PasswordReset()));
                    },
                    child: Text(
                      'Forgot Password ?',
                      style: TextStyle(color: Color(0xff91AE28)),
                    ),
                  ),
                  SizedBox(height: 3.0),
                  Text(
                    'Student registration is free',
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Color(0xff888888),
                    ),
                  ),
                  SizedBox(height: 5.0),
                  Container(
                    width: 320.0,
                    height: 40.0,
                    child: FlatButton(
                        shape: new RoundedRectangleBorder(
                            side: BorderSide(color: Color(0xff11616C)),
                            borderRadius: new BorderRadius.circular(10.0)),
                        child: new Text("Register Now",
                            style: TextStyle(color: Color(0xff11616C))),
                        onPressed: () async {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RegistrationPage()));
                        }),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
