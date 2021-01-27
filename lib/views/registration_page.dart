import 'package:alprep/api_manager/api_manager.dart';
import 'package:alprep/models/register_model.dart';
import 'package:alprep/views/Home.dart';
import 'package:alprep/views/firstScreen.dart';
import 'package:flutter/material.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  String _email, _name, _lastName, _mobileNumber;
  TextEditingController _password = TextEditingController();
  TextEditingController _confirmPassword = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Registration regModel;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    regModel = Registration();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            SizedBox(height: 40.0),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                Text(
                  'Registration',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                )
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Container(
                    width: 150.0,
                    height: 70.0,
                    decoration: BoxDecoration(
                      // color: Colors.white,
                      borderRadius: new BorderRadius.circular(10.0),
                    ),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        // errorBorder: InputBorder.none,
                        contentPadding: EdgeInsets.all(10),
                        fillColor: Colors.grey,
                        focusColor: Colors.grey,
                        hintText: 'First Name',
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(10.0),
                          borderSide: new BorderSide(),
                        ),
                      ),
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Please enter Name';
                        } else {
                          setState(() {
                            regModel.firstName = value;
                          });
                        }
                      },
                    ),
                  ),
                ),
                // SizedBox(width: 10.0),
                Padding(
                  padding: const EdgeInsets.only(left: 0.0, right: 20.0),
                  child: Container(
                    width: 150.0,
                    height: 70.0,
                    decoration: BoxDecoration(
                      // color: Colors.white,
                      borderRadius: new BorderRadius.circular(10.0),
                    ),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        // errorBorder: InputBorder.none,
                        contentPadding: EdgeInsets.all(10),
                        fillColor: Colors.grey,
                        focusColor: Colors.grey,
                        hintText: 'Last Name',
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(10.0),
                          borderSide: new BorderSide(),
                        ),
                      ),
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Please enter last Name';
                        } else {
                          setState(() {
                            regModel.lastName = value;
                          });
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Container(
                    width: 320.0,
                    height: 70.0,
                    decoration: BoxDecoration(
                      // color: Colors.white,
                      borderRadius: new BorderRadius.circular(10.0),
                    ),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        // errorBorder: InputBorder.none,
                        contentPadding: EdgeInsets.all(10),
                        fillColor: Colors.grey,
                        focusColor: Colors.grey,
                        hintText: 'Email',
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(10.0),
                          borderSide: new BorderSide(),
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
                            regModel.emailId = value;
                          });
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Container(
                    width: 320.0,
                    height: 70.0,
                    decoration: BoxDecoration(
                      // color: Colors.white,
                      borderRadius: new BorderRadius.circular(10.0),
                    ),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        // errorBorder: InputBorder.none,
                        contentPadding: EdgeInsets.all(10),
                        fillColor: Colors.grey,
                        focusColor: Colors.grey,
                        hintText: 'Mobile Number',
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(10.0),
                          borderSide: new BorderSide(),
                        ),
                      ),
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Please enter mobile number';
                        }
                        if (value.isNotEmpty) {
                          if (!RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)')
                              .hasMatch(value)) {
                            return 'Enter valid mobile number';
                          } else {
                            setState(() {
                              regModel.mobileNo = value;
                              print(regModel.mobileNo);
                            });
                          }
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Container(
                    width: 320.0,
                    height: 70.0,
                    decoration: BoxDecoration(
                      // color: Colors.white,
                      borderRadius: new BorderRadius.circular(10.0),
                    ),
                    child: TextFormField(
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Please enter password';
                        }
                      },
                      controller: _password,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        // errorBorder: InputBorder.none,
                        contentPadding: EdgeInsets.all(10),
                        fillColor: Colors.grey,
                        focusColor: Colors.grey,
                        hintText: 'Password',
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(10.0),
                          borderSide: new BorderSide(),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Container(
                    width: 320.0,
                    height: 70.0,
                    decoration: BoxDecoration(
                      // color: Colors.white,
                      borderRadius: new BorderRadius.circular(10.0),
                    ),
                    child: TextFormField(
                      controller: _confirmPassword,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        // errorBorder: InputBorder.none,
                        contentPadding: EdgeInsets.all(10),
                        fillColor: Colors.grey,
                        focusColor: Colors.grey,
                        hintText: 'Confirm Password',
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(10.0),
                          borderSide: new BorderSide(),
                        ),
                      ),
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Please enter password';
                        }
                        if (_password.text != _confirmPassword.text) {
                          return "Password do not match";
                        } else {
                          setState(() {
                            regModel.password = _confirmPassword.text;
                          });
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Container(
                    width: 320.0,
                    height: 70.0,
                    decoration: BoxDecoration(
                      // color: Colors.white,
                      borderRadius: new BorderRadius.circular(10.0),
                    ),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        // errorBorder: InputBorder.none,
                        contentPadding: EdgeInsets.all(10),
                        fillColor: Colors.grey,
                        focusColor: Colors.grey,
                        hintText: 'Refferal Code',
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(10.0),
                          borderSide: new BorderSide(),
                        ),
                      ),
                      validator: (value) {
                        setState(() {
                          regModel.referralCode = value;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Image.asset(
                    'images/checkBox_clicked.png',
                    scale: 1.0,
                  ),
                ),
                Expanded(
                    child: Text(
                        'By Signing Up you agree to our Terms and Conditions and Return Policies.')),
                // Expanded(child: Text('')),
                // Expanded(child: Text('')),
                // Expanded(child: Text(''))
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                  child: Container(
                    width: 300.0,
                    height: 40.0,
                    decoration: BoxDecoration(
                      borderRadius: new BorderRadius.circular(10.0),
                      gradient: new LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [Color(0xff002D48), Color(0xff015181)],
                      ),
                    ),
                    child: FlatButton(
                      child: new Text("Get Started",
                          style: TextStyle(color: Color(0xffffffff))),
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          ApiService().Register(
                              regModel.emailId,
                              regModel.password,
                              regModel.firstName,
                              regModel.lastName,
                              regModel.mobileNo,
                              regModel.referralCode);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FirstScreen()));
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text('Already have an account?')],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                  child: Container(
                    width: 300.0,
                    height: 40.0,
                    child: FlatButton(
                        shape: new RoundedRectangleBorder(
                            side: BorderSide(color: Color(0xff11616C)),
                            borderRadius: new BorderRadius.circular(10.0)),
                        child: new Text("Back To Login",
                            style: TextStyle(color: Color(0xff11616C))),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Home()));
                        }),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    ));
  }
}
