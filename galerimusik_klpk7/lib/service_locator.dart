// TODO Implement this library.
import 'package:galerimusik_klpk7/repositories/lcl_storage_repository.dart';
import "package:galerimusik_klpk7/repositories/songs_repo.dart";
import 'package:galerimusik_klpk7/repositories/saved_songs_repo.dart';
import 'package:get_it/get_it.dart';

Future<void> setupServiceLocator() async {
  LocalStorageRepository localStorageRepository = LocalStorageRepository();
  await localStorageRepository.init();
  serviceLocator
      .registerSingleton<LocalStorageRepository>(localStorageRepository);

  serviceLocator.registerSingleton<SongsRepository>(APISongsRepository());

  serviceLocator.registerSingleton<SavedSongsRepository>(
    SavedSongsRepository(serviceLocator.get<LocalStorageRepository>()),
  );
}

final serviceLocator = GetIt.instance;
