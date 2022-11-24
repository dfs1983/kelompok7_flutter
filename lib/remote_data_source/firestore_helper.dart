import 'package:galerimusik_klpk7/models/diary_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreHelper{

  static Future create(DiaryModel diary) async {
    final diaryCollection = FirebaseFirestore.instance.collection('musics');

    final uid = diaryCollection.doc().id;
    final docRef = diaryCollection.doc(uid);

    final newDiary = DiaryModel(
      id: uid,
      titlesong: diary.titlesong,
      author: diary.author,
      lyric: diary.lyric,
    ).toJson();

    try {
      await docRef.set(newDiary);
    }catch(e){
      print("some error $e");
    }
  }

  static Stream<List<DiaryModel>> read() {
    final diaryCollection = FirebaseFirestore.instance.collection("musics");
    return diaryCollection.snapshots().map((querySnapshot) => querySnapshot.docs.map((e) => DiaryModel.fromSnapshot(e)).toList());
  }

  static Future update(DiaryModel diary) async {
    final diaryCollection = FirebaseFirestore.instance.collection('musics');

    final docRef = diaryCollection.doc(diary.id);

    final newDiary = DiaryModel(
      id: diary.id,
      titlesong: diary.titlesong,
      author: diary.author,
      lyric: diary.lyric,
    ).toJson();

    try {
      await docRef.update(newDiary);
    } catch(e){
      print("some error $e");
    }
  }

  static Future delete(DiaryModel diary) async {
    final diaryCollection = FirebaseFirestore.instance.collection("musics");
    final docRef = diaryCollection.doc(diary.id).delete();
  }
}