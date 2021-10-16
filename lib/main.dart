import 'package:flutter/material.dart';
import 'mycustomwidget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final String _title = 'Weight On Planet X';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          backgroundColor: Colors.blueGrey[900],
          title: Text(
            _title,
          ),
        ),
        body: MyCustomView(),
      ),
    );
  }
}
