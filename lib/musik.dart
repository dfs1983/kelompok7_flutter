class Musik {
  String gambar, nama, deskripsi, album;

  Musik({
    required this.gambar,
    required this.nama,
    required this.deskripsi,
    required this.album,
  });
}

List<Musik> dataMusik = [
  Musik(
      gambar: "assets/oasis_cover.jpg",
      nama: "Oasis - Wonder Wall",
      deskripsi: "Today is gonna be the day "
"That they're gonna throw it back to you"
"By now, you should've somehow"
"Realized what you gotta do"
"I don't believe that anybody"
"Feels the way I do about you now"
"Backbeat, the word was on the street"
"That the fire in your heart is out"
"I'm sure you've heard it all before"
"But you never really had a doubt"
"I don't believe that anybody"
"Feels the way I do about you now"
"And all the roads we have to walk are winding"
"And all the lights that lead us there are blinding"
"There are many things that"
"I would like to say to you, but I don't know how"
"Because maybe"
"You're gonna be the one that saves me"
"And after all"
"You're my wonderwall"
"Today was gonna be the day"
"But they'll never throw it back to you"
"By now, you should've somehow"
"Realized what you're not to do"
"I don't believe that anybody"
"Feels the way I do about you now"
"And all the roads that lead you there were winding"
"And all the lights that light the way are blinding"
"There are many things that"
"I would like to say to you, but I don't know how"
"I said maybe"
"You're gonna be the one that saves me"
"And after all"
"You're my wonderwall"
"I said maybe (I said maybe)"
"You're gonna be the one that saves me"
"And after all"
"You're my wonderwall"
          "I said maybe (I said maybe)"
          "You're gonna be the one that saves me (saves me)"
          "You're gonna be the one that saves me (that saves me)"
          "You're gonna be the one that saves me (saves me)",
      album: "(What's The Story) Morning Glory?",
  ),
  Musik(
      gambar: "assets/lynyrdskynyrd_cover.jpg",
      nama: "Lynyrd Skynyrd - Free Bird",
      deskripsi: "Ini deskripsi",
      album: "(pronounced 'leh-'nrd 'skin-'nrd)"),
  Musik(
      gambar: "",
      nama: "",
      deskripsi: "",
      album: ""),
];