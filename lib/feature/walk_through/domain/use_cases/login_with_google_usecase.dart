import 'package:cookpedia/feature/walk_through/domain/repositories/base_auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginWithGoogleUseCase {
  final BaseAuthRepository baseAuthRepository ;

  const LoginWithGoogleUseCase({
    required this.baseAuthRepository,
  });

  Future<UserCredential> call()async{
   return await baseAuthRepository.loginWithGoogle();
  }
}