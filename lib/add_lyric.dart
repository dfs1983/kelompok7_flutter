import 'package:flutter/material.dart';

class AddLyric extends StatelessWidget {
  const AddLyric({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Lirik'),
        backgroundColor: Colors.black,
      ),
      body: Container(
        child: ElevatedButton(
          child: const Text("Simpan"),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}