import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class BaseAuthRemoteDataSource {
  loginWithGoogle();
}

class AuthRemoteDataSource extends BaseAuthRemoteDataSource {


  @override
  Future<UserCredential> loginWithGoogle() async{
    final GoogleSignIn googleSignIn = GoogleSignIn();

    final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount!.authentication;

    final OAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

}