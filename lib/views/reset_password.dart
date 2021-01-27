import 'package:alprep/views/firstScreen.dart';
import 'package:flutter/material.dart';

class PasswordReset extends StatefulWidget {
  @override
  _PasswordResetState createState() => _PasswordResetState();
}

class _PasswordResetState extends State<PasswordReset> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _email;
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
                padding: const EdgeInsets.only(top: 120.0, bottom: 150.0),
                child: Image.asset(
                  'images/alprep-logo.png',
                  scale: 2.5,
                ),
              ),
              Text(
                'Lost your password ?',
                style: TextStyle(
                    fontSize: 25.0,
                    // letterSpacing: 2.0,
                    color: Color(0xff000000),
                    fontWeight: FontWeight.bold),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 50.0,
                    width: 200.0,
                    child: Text(
                      'Please enter your email id or mobile number. You will receive a temporary password to create a new password.',
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Color(0xff888888),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Padding(
                padding:
                    const EdgeInsets.only(left: 25.0, right: 25.0, top: 10.0),
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
                      }
                    },
                    onSaved: (String email) {
                      _email = email;
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
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
                  child: new Text("Submit",
                      style: TextStyle(color: Color(0xffffffff))),
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FirstScreen()));
                    }
                  },
                  // shape: new RoundedRectangleBorder(
                  //     side: BorderSide(
                  //         color: Theme.of(context).primaryColor),
                  //     borderRadius: new BorderRadius.circular(10.0))
                ),
              ),
              SizedBox(height: 40.0),
              Text(
                'Student registration is free',
                style: TextStyle(
                  fontSize: 12.0,
                  color: Color(0xff888888),
                ),
              ),
              SizedBox(height: 40.0),
            ],
          ),
        ),
      ),
    ));
  }
}
