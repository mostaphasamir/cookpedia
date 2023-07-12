import 'package:cookpedia/feature/walk_through/domain/entities/country.dart';

class CountryModel extends Country {
  const CountryModel(
      {required super.flagURL, required super.code, required super.name});

  factory CountryModel.fromJson(Map<String, dynamic> jsonData) {
    return CountryModel(
      flagURL: jsonData['flag'],
      code: jsonData['code'],
      name: jsonData['name'],
    );
  }
}
