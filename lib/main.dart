import 'dart:async';

import 'package:alprep/views/Home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: SplashScreen()));
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    loadData();
  }

  bool _visible = true;

  @override
  Widget build(BuildContext context) {
    // print('container build');
    return Column(
      children: [
        AnimatedOpacity(
          // If the widget is visible, animate to 0.0 (invisible).
          // If the widget is hidden, animate to 1.0 (fully visible).
          opacity: _visible ? 1.0 : 0.0,
          duration: Duration(milliseconds: 5000),
          // The green box must be a child of the AnimatedOpacity widget.
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
              child: Center(
                child: Image.asset(
                  'images/alprep-logo.png',
                  scale: 2.5,
                ),
              )),
        ),
      ],
    );
  }

  Future<Timer> loadData() async {
    return Timer(Duration(seconds: 2), onDoneLoading);
  }

  onDoneLoading() async {
    setState(() {
      _visible = !_visible;
    });
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => MyApp()));
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.indigo[700],
        secondaryHeaderColor: Colors.black,
        // iconTheme: IconThemeData(color: Colors.yellow[700],size:12.0)
      ),
      initialRoute: 'home',
      routes: {
        'home': (context) => Home(),
      },
    );
  }
}
