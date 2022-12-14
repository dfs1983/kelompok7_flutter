import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:galerimusik_klpk7/models/song_search_result.dart';
import 'package:galerimusik_klpk7/repositories/songs_repo.dart';
import 'package:galerimusik_klpk7/service_locator.dart';

class SearchSongBlocEvent {}

class SearchForSong extends SearchSongBlocEvent {
  final String songName;

  SearchForSong(this.songName);
}

class ClearSearch extends SearchSongBlocEvent {}

class SearchSongBlocState {}

class InitialState extends SearchSongBlocState {}

class LoadingState extends SearchSongBlocState {}

class LoadedState extends SearchSongBlocState {
  final SongSearchResult songSearchResult;

  LoadedState(this.songSearchResult);
}

class ErrorState extends SearchSongBlocState {}

class SearchSongBloc extends Bloc<SearchSongBlocEvent, SearchSongBlocState> {
  SearchSongBloc() : super(InitialState());

  SongsRepository _lyricsRepository = serviceLocator.get<SongsRepository>();

  @override
  Stream<SearchSongBlocState> mapEventToState(
      SearchSongBlocEvent event) async* {
    if (event is SearchForSong) {
      yield* _mapSearchEventToState(event);
    } else if (event is ClearSearch) {
      yield* _mapClearStateToState(event);
    }
  }

  Stream<SearchSongBlocState> _mapSearchEventToState(
      SearchForSong event) async* {
    yield LoadingState();
    try {
      SongSearchResult songSearchResult =
      await _lyricsRepository.getSearchResults(event.songName);

      yield LoadedState(songSearchResult);
    } catch (e) {
      print(e);
      yield ErrorState();
    }
  }

  Stream<SearchSongBlocState> _mapClearStateToState(ClearSearch event) async* {
    yield InitialState();
  }
}
