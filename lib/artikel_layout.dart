import 'package:flutter/material.dart';
import 'package:flutter1/musik.dart';

class ArtikelLayout extends StatelessWidget {
  final Musik musik;

  const ArtikelLayout({Key? key, required this.musik}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(musik.nama),
        backgroundColor: Colors.black,

      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: Image.asset(musik.gambar, height: 200, width: 200,),
          ),
          Padding(padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
          child: Text(musik.nama,
            style: const TextStyle(
              fontWeight: FontWeight.bold, fontSize: 24),),
          ), 
          Padding(padding: EdgeInsets.fromLTRB(15, 10, 15, 15),
            child: Text(musik.deskripsi,
            style: const TextStyle(fontSize: 13), softWrap: true,),
          )
        ],
      ),
    );
  }
}
