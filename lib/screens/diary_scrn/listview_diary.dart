import 'package:flutter/material.dart';
import 'package:galerimusik_klpk7/models/diary_model.dart';
import 'package:galerimusik_klpk7/remote_data_source/firestore_helper.dart';
import 'diary_scrn.dart';
import 'diary_information.dart';

class ListviewDiary extends StatefulWidget {
  const ListviewDiary({Key? key}) : super(key: key);

  @override
  State<ListviewDiary> createState() => _ListviewDiaryState();
}

class _ListviewDiaryState extends State<ListviewDiary> {
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Diary Musik"),
      ),
      body: Padding(
        padding: EdgeInsets.all(5),
        child: Column(
          children: [
            StreamBuilder<List<DiaryModel>>(
                stream: FirestoreHelper.read(),
                builder: (context, snapshot){
                  if (snapshot.connectionState == ConnectionState.waiting){
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (snapshot.hasError) {
                    return Center(
                      child: Text("some error"),
                    );
                  }
                  if (snapshot.hasData){
                    final diaryData = snapshot.data;
                    return Expanded(
                        child: ListView.builder(
                            itemCount: diaryData!.length,
                            itemBuilder: (context, index){
                              final singleDiary = diaryData[index];
                              return Container(
                                margin: EdgeInsets.symmetric(vertical: 5),
                                child: ListTile(
                                  onLongPress: (){
                                    showDialog(context: context, builder: (context){
                                      return AlertDialog(
                                        title: Text("Delete"),
                                        content: Text("Apakah Anda yakin hapus diary ini?"),
                                        actions: [
                                          ElevatedButton(onPressed: (){
                                            FirestoreHelper.delete(singleDiary).then((value) {
                                              Navigator.pop(context);
                                            });
                                          }, child: Text('Delete'))
                                        ],
                                      );
                                    });
                                  },
                                  title: Text("${singleDiary.titlesong}"),
                                  subtitle: Text("${singleDiary.author}"),
                                  trailing: InkWell(onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => DiaryInformation(diary: singleDiary,/*titlesong: singleDiary.titlesong, author: singleDiary.author*/)));
                                  }, child: Icon(Icons.edit)),
                                ),
                              );
                            }),
                    );
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                })
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Colors.black87,
        onPressed: (){
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => DiaryScreen()));
        },
      ),
    );
  }
}
