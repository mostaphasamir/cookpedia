import 'package:cookpedia/feature/walk_through/data/data_sources/remote_data_source/walkthrough_remote_data_source.dart';
import 'package:cookpedia/feature/walk_through/domain/entities/country.dart';
import 'package:cookpedia/feature/walk_through/domain/repositories/base_walkthrough_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../data_sources/local_data_source/walkthrough_local_data_source.dart';

class WalkthroughRepository extends BaseWalkthroughRepository {
  BaseWalkthroughRemoteDataSource baseWalkthroughRemoteDataSource ;
  BaseWalkthroughLocalDataSource baseWalkthroughLocalDataSource ;
  WalkthroughRepository({
    required this.baseWalkthroughRemoteDataSource,
    required this.baseWalkthroughLocalDataSource,
  });

  @override
  Future<UserCredential> loginWithGoogle()async {
    return await baseWalkthroughRemoteDataSource.loginWithGoogle();
  }

  @override
  Future<List<Country>> getAllCountry()async {
    return await baseWalkthroughLocalDataSource.getAllCountry();
  }

  @override
  Future<List<Country>> searchCountryName(String countryName) async{
    return await baseWalkthroughLocalDataSource.searchCountryName(countryName);
  }


}