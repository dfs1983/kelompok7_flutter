import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
        backgroundColor: Colors.black,
      ),
      body: Container(
        child: Text("Ini deskripsi tentang galeri musik"),
      ),
    );
  }
}