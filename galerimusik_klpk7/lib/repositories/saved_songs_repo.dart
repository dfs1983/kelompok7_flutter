import 'package:galerimusik_klpk7/models/songs_data.dart';

import 'package:galerimusik_klpk7/repositories/lcl_storage_repository.dart';

class SavedSongsRepository {
  final LocalStorageRepository _localStorageRepository;

  SavedSongsRepository(this._localStorageRepository);

  List<SongData> getSavedSongs() {
    var songs = _localStorageRepository.getSavedSongs();
    return songs.reversed.toList();
  }

  Future<void> addNewSong(SongData songLyrics) async {
    await _localStorageRepository.addNewSong(songLyrics);
  }

  Future<void> deleteSong(SongData songLyrics) async {
    await _localStorageRepository.deleteSong(songLyrics);
  }

  bool isSongSaved(SongData songLyrics) {
    return _localStorageRepository.isSongSaved(songLyrics);
  }
}
