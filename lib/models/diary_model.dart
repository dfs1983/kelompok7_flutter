import 'package:cloud_firestore/cloud_firestore.dart';

class DiaryModel{

  final String? id;
  final String? titlesong;
  final String? author;
  final String? lyric;

  DiaryModel({this.titlesong, this.author, this.lyric, this.id});

  factory DiaryModel.fromSnapshot(DocumentSnapshot snap){
    var snapshot = snap.data() as Map<String, dynamic>;

    return DiaryModel(
      titlesong: snapshot['titlesong'],
      author: snapshot['author'],
      lyric: snapshot['lyric'],
      id: snapshot['id'],
    );
  }

  Map<String, dynamic> toJson() => {
    "titlesong": titlesong,
    "author": author,
    "lyric": lyric,
    "id": id,
  };
}