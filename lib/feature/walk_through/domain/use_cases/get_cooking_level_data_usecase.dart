import 'package:cookpedia/feature/walk_through/domain/entities/cooking_level.dart';
import 'package:cookpedia/feature/walk_through/domain/repositories/base_walkthrough_repository.dart';

class GetCookingLevelDataUseCase {
  final BaseWalkthroughRepository baseWalkthroughRepository ;

  const GetCookingLevelDataUseCase({
    required this.baseWalkthroughRepository,
  });

  Future<List<CookingLevel>>call(){
    return baseWalkthroughRepository.getCookingLevelData();
  }
}