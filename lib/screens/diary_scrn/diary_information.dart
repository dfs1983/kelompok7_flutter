import 'package:flutter/material.dart';
import 'package:galerimusik_klpk7/models/diary_model.dart';
import 'package:galerimusik_klpk7/remote_data_source/firestore_helper.dart';

class DiaryInformation extends StatefulWidget {
  final DiaryModel diary;
  const DiaryInformation({Key? key, required this.diary}) : super(key: key);

  @override
  State<DiaryInformation> createState() => _DiaryInformationState();
}

class _DiaryInformationState extends State<DiaryInformation> {
  TextEditingController? _titlesongController;
  TextEditingController? _authorController;
  TextEditingController? _lyricController;

  @override
  void initState() {
    _titlesongController = TextEditingController(text: widget.diary.titlesong);
    _authorController = TextEditingController(text: widget.diary.author);
    _lyricController = TextEditingController(text: widget.diary.lyric);
    super.initState();
  }

  @override
  void dispose(){
    _titlesongController!.dispose();
    _authorController!.dispose();
    _lyricController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('Diary'),
          ),
          body: SingleChildScrollView(
            padding: EdgeInsets.all(8),
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
                    FirestoreHelper.update(DiaryModel(
                      id: widget.diary.id,
                      titlesong: _titlesongController!.text,
                      author: _authorController!.text,
                      lyric: _lyricController!.text,
                    ),).then((value) {
                      Navigator.pop(context);
                    });
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
                          "Update",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }
}
