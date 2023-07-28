import 'package:cookpedia/feature/walk_through/data/data_sources/remote_data_source/walkthrough_remote_data_source.dart';
import 'package:cookpedia/feature/walk_through/domain/repositories/base_walkthrough_repository.dart';
import 'package:cookpedia/feature/walk_through/presentation/controller/walk_through_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../feature/walk_through/data/data_sources/local_data_source/walkthrough_local_data_source.dart';
import '../../feature/walk_through/data/repositories/walkthrough_repository.dart';
import '../../feature/walk_through/domain/use_cases/get_all_country.dart';
import '../../feature/walk_through/domain/use_cases/get_cooking_level_data_usecase.dart';
import '../../feature/walk_through/domain/use_cases/login_with_google_usecase.dart';
import '../../feature/walk_through/domain/use_cases/search_country_usecase.dart';

final sl = GetIt.instance;

class ServiceLocator{

  void init(){

    ///bloc
    sl.registerFactory(() => WalkThroughBloc(sl(),sl(),sl(),sl()));

    ///useCase
    sl.registerLazySingleton(() => LoginWithGoogleUseCase(baseWalkthroughRepository: sl()));
    sl.registerLazySingleton(() => GetAllCountryUseCase(baseWalkthroughRepository: sl()));
    sl.registerLazySingleton(() => SearchCountryUseCase(baseWalkthroughRepository: sl()));
    sl.registerLazySingleton(() => GetCookingLevelDataUseCase(baseWalkthroughRepository: sl()));

    ///repo
    sl.registerLazySingleton<BaseWalkthroughRepository>(() => WalkthroughRepository(baseWalkthroughRemoteDataSource: sl(), baseWalkthroughLocalDataSource: sl()));
    ///data source
    sl.registerLazySingleton<BaseWalkthroughRemoteDataSource>(() => WalkthroughRemoteDataSource());
    sl.registerLazySingleton<BaseWalkthroughLocalDataSource>(() => WalkthroughLocalDataSource());
  }
  

}