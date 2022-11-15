import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:galerimusik_klpk7/models/songs_data.dart';
import 'package:galerimusik_klpk7/repositories/songs_repo.dart';
import 'package:galerimusik_klpk7/service_locator.dart';

class FetchSongDataBlocEvent {}

class FetchSongData extends FetchSongDataBlocEvent {
  final String identifier;

  FetchSongData(this.identifier);
}

class FetchSongDataBlocState {}

class InitialState extends FetchSongDataBlocState {}

class LoadingState extends FetchSongDataBlocState {}

class LoadedState extends FetchSongDataBlocState {
  final SongData songData;

  LoadedState(this.songData);
}

class ErrorState extends FetchSongDataBlocState {}

class FetchSongDataBloc
    extends Bloc<FetchSongDataBlocEvent, FetchSongDataBlocState> {
  FetchSongDataBloc() : super(InitialState());

  SongsRepository _lyricsRepository = serviceLocator.get<SongsRepository>();

  @override
  Stream<FetchSongDataBlocState> mapEventToState(
      FetchSongDataBlocEvent event) async* {
    if (event is FetchSongData) {
      yield* _mapSearchEventToState(event);
    }
  }

  Stream<FetchSongDataBlocState> _mapSearchEventToState(
      FetchSongData event) async* {
    yield LoadingState();
    try {
      var songData =
      await _lyricsRepository.fetchSongDataFromIdentifier(event.identifier);
      yield LoadedState(songData);
    } catch (e) {
      print(e);
      yield ErrorState();
    }
  }
}
