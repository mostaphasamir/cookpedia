import 'package:cookpedia/feature/walk_through/data/data_sources/remote_data_source/auth_remote_data_source.dart';
import 'package:cookpedia/feature/walk_through/domain/repositories/base_auth_repository.dart';
import 'package:cookpedia/feature/walk_through/presentation/controller/walk_through_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../feature/walk_through/data/repositories/auth_repository.dart';
import '../../feature/walk_through/domain/use_cases/login_with_google_usecase.dart';

final sl = GetIt.instance;

class ServiceLocator{

  void init(){

    ///bloc
    sl.registerFactory(() => WalkThroughBloc(sl()));
    ///useCase
    sl.registerLazySingleton(() => LoginWithGoogleUseCase(baseAuthRepository:sl() ));
    ///repo
    sl.registerLazySingleton<BaseAuthRepository>(() => AuthRepository(baseAuthRemoteDataSource: sl()));
    ///data source
    sl.registerLazySingleton<BaseAuthRemoteDataSource>(() => AuthRemoteDataSource());
  }
  

}