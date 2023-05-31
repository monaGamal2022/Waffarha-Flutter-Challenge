import 'package:get_it/get_it.dart';
import 'package:waffarha_challenge/core/api_manager.dart';

import '../photos_gallery/data/repository/photos_repository.dart';

final getIt = GetIt.instance;

void injectDependencies() {
  getIt.registerLazySingleton(() => APIsManager());
  getIt.registerFactory(() => PhotosRepository(getIt()));
}
