import 'package:cookpedia/feature/walk_through/domain/entities/cooking_level.dart';
import 'package:cookpedia/feature/walk_through/domain/entities/country.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class BaseWalkthroughRepository {
  Future<UserCredential> loginWithGoogle();
  Future<List<Country>> getAllCountry();
  Future<List<Country>>searchCountryName(String countryName);
  Future<List<CookingLevel>>getCookingLevelData();
}