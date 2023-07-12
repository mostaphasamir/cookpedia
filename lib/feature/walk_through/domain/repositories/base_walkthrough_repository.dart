import 'package:cookpedia/feature/walk_through/domain/entities/country.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class BaseWalkthroughRepository {
  Future<UserCredential> loginWithGoogle();
  Future<List<Country>> getAllCountry();
}