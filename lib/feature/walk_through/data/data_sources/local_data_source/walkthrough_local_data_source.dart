import 'dart:convert';

import 'package:flutter/services.dart';

import '../../models/country_model.dart';

abstract class BaseWalkthroughLocalDataSource {
  Future<List<CountryModel>> getAllCountry();
  Future<List<CountryModel>> searchCountryName(String countryName);
}

class WalkthroughLocalDataSource extends BaseWalkthroughLocalDataSource{
  @override
  Future<List<CountryModel>> getAllCountry()async {
    final response = await rootBundle.loadString('lib/feature/walk_through/data/data_sources/local_data_source/country.json');
    //print(response.toString());
    final List<dynamic> data =await json.decode(response);
    final finalresult =List<CountryModel>.from(data.map((e) => CountryModel.fromJson(e)));
    return finalresult ;
  }

  @override
  Future<List<CountryModel>> searchCountryName(String countryName)async {
    final response = await rootBundle.loadString('lib/feature/walk_through/data/data_sources/local_data_source/country.json');
    final List<dynamic> data =await json.decode(response);
    final allCountry =List<CountryModel>.from(data.map((e) => CountryModel.fromJson(e)));
    List<CountryModel> filterList =allCountry.where((element) => element.name.toLowerCase().contains(countryName.toLowerCase())).toList();
     return filterList ;
  }

}