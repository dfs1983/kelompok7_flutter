import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:galerimusik_klpk7/models/songs_data.dart';
import 'package:galerimusik_klpk7/models/song_search_result.dart';
import 'package:galerimusik_klpk7/repositories/saved_songs_repo.dart';
import 'package:galerimusik_klpk7/screens/search_scrn/song_list_item_widget.dart';
import 'package:galerimusik_klpk7/screens/song_scrn/song_scrn.dart';
import 'package:galerimusik_klpk7/service_locator.dart';
import 'package:galerimusik_klpk7/utils/navigation.dart';

class SavedSongsScreen extends StatefulWidget {
  @override
  _SavedSongsScreenState createState() => _SavedSongsScreenState();
}

class _SavedSongsScreenState extends State<SavedSongsScreen> {
  late List<SongData> songs;

  @override
  void initState() {
    super.initState();
    updateSongs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Lagu Disukai: ${songs.length}"),
      ),
      body: Center(
        child: Builder(
          builder: (context) {
            if (songs.isEmpty) {
              return _buildNoSavedSongsWidget();
            }
            return _buildSavedSongsWidget();
          },
        ),
      ),
    );
  }

  Widget _buildNoSavedSongsWidget() {
    return Column(
      children: [
        Spacer(),
        Container(
          height: MediaQuery.of(context).size.height / 3,
          child: FlareActor(
            "assets/flare_animations/sad_face.flr",
            alignment: Alignment.center,
            fit: BoxFit.contain,
            animation: "idle",
          ),
        ),
        Opacity(
          opacity: 0.8,
          child: Text(
            "No Saved Songs",
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
        Spacer(),
      ],
    );
  }

  Widget _buildSavedSongsWidget() {
    return ListView.builder(
        itemCount: songs.length,
        itemBuilder: (context, index) {
          var song = songs[index];
          return InkWell(
            onTap: () {
              onSongClicked(song);
            },
            child: getItemWidget(song, context),
          );
        });
  }

  void updateSongs() {
    var savedSongsRepo = serviceLocator.get<SavedSongsRepository>();
    songs = savedSongsRepo.getSavedSongs();
  }

  Widget getItemWidget(SongData songData, BuildContext context) {
    return SongListItemWidget(SongDetails.fromSongData(songData));
  }

  void onSongClicked(SongData songLyrics) {
    goToScreen(context, SongScreen(songLyrics), onReturn: onScreenPoped);
  }

  void onScreenPoped() {
    setState(() {
      updateSongs();
    });
  }
}
