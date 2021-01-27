import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alprep'),
      ),
      body: Center(
        child: Text('Welcome to Alprep'),
      ),
    );
  }
}
