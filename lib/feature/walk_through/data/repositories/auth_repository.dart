import 'package:cookpedia/feature/walk_through/data/data_sources/remote_data_source/auth_remote_data_source.dart';
import 'package:cookpedia/feature/walk_through/domain/repositories/base_auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository extends BaseAuthRepository {
  BaseAuthRemoteDataSource baseAuthRemoteDataSource ;

  AuthRepository({
    required this.baseAuthRemoteDataSource,
  });

  @override
  Future<UserCredential> loginWithGoogle()async {
    return await baseAuthRemoteDataSource.loginWithGoogle();
  }


}