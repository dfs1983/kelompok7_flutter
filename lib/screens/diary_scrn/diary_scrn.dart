import 'package:flutter/material.dart';
import 'package:galerimusik_klpk7/models/diary_model.dart';
import 'package:galerimusik_klpk7/remote_data_source/firestore_helper.dart';

class DiaryScreen extends StatefulWidget {
  const DiaryScreen({Key? key}) : super(key: key);

  @override
  State<DiaryScreen> createState() => _DiaryScreenState();
}

class _DiaryScreenState extends State<DiaryScreen> {
  TextEditingController _titlesongController = TextEditingController();
  TextEditingController _authorController = TextEditingController();
  TextEditingController _lyricController = TextEditingController();

  @override
  void dispose() {
    _titlesongController.dispose();
    _authorController.dispose();
    _lyricController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Tambah Diary Musik"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            SizedBox(height: 10,),
            TextFormField(
              controller: _titlesongController,
              decoration: InputDecoration(border: OutlineInputBorder(), hintText: "Judul"),
            ),
            SizedBox(height: 10,),
            TextFormField(
              controller: _authorController,
              decoration: InputDecoration(border: OutlineInputBorder(), hintText: "Penulis"),
            ),
            SizedBox(height: 10,),
            TextFormField(
              controller: _lyricController,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), 
                  hintText: "Lirik",
                  ),
            ),
            SizedBox(height: 15,),
            InkWell(
              onTap: (){
                FirestoreHelper.create(DiaryModel(
                  titlesong: _titlesongController.text,
                  author: _authorController.text,
                  lyric: _lyricController.text,
                ));
              },
              child: Container(
                width: 130,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius:  BorderRadius.circular(5),
                  color: Colors.black87,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Simpan",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

