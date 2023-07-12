import 'package:cookpedia/feature/walk_through/domain/repositories/base_walkthrough_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginWithGoogleUseCase {
  final BaseWalkthroughRepository baseWalkthroughRepository ;

  const LoginWithGoogleUseCase({
    required this.baseWalkthroughRepository,
  });

  Future<UserCredential> call()async{
   return await baseWalkthroughRepository.loginWithGoogle();
  }
}