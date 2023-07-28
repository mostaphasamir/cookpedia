import 'package:cookpedia/feature/walk_through/domain/entities/cooking_level.dart';

class CookingLevelModel extends CookingLevel {
  const CookingLevelModel({required super.title, required super.description});

  factory CookingLevelModel.fromJson(Map<String, dynamic> jsonData) {
    return CookingLevelModel(
      title: jsonData['title'],
      description: jsonData['description'],
    );
  }
}
