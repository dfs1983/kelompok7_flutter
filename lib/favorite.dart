import 'package:flutter/material.dart';

class Favorite extends StatelessWidget {
  const Favorite({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite'),
        backgroundColor: Colors.black,
      ),
      body: Container(
        child: Text("Ini deskripsi tentang galeri musik"),
      ),
    );
  }
}