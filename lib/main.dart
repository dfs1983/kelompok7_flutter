import 'package:flutter/material.dart';

void main() {
  runApp(
      MaterialApp(
          title: "Hello World Flutter",
          home: Scaffold(
            appBar: AppBar(title: Text('Hello World Flutter'),),
            body: Material(
              color: Colors.white,
              child: Center(
                child: Text(
                  "Hello World",
                  textDirection: TextDirection.ltr,
                  style: TextStyle(color: Colors.black, fontSize: 40.0),
                ),
              ),
            ),
          )
      )
  );
}