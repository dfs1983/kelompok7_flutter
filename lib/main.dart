import 'package:flutter/material.dart';
import 'package:flutter1/NavBar.dart';
import 'package:flutter1/artikel_layout.dart';
import 'package:flutter1/musik.dart';

//Kelompok 7
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Galeri Musik',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Galeri Musik'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.black,
      ),
      body: ListView.builder(
        itemCount: dataMusik.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ArtikelLayout(
                      musik: dataMusik[index],
                    )));
            },
            child: Card(
              child: Row(
                children: [
                  Padding(
                      padding: EdgeInsets.all(10),
                      child: Image.asset(dataMusik[index].gambar,
                          width: 100, height: 100,),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(dataMusik[index].nama),
                      ),
                      Padding(padding: EdgeInsets.fromLTRB(10, 1, 1, 1),
                        child: Text(dataMusik[index].album)),
                    ],
                  ),],
              ),
            ),
          );
        },
      ),
    );
  }
}