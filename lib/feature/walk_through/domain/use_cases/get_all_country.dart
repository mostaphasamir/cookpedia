import 'package:cookpedia/feature/walk_through/domain/entities/country.dart';
import 'package:cookpedia/feature/walk_through/domain/repositories/base_walkthrough_repository.dart';

class GetAllCountryUseCase{
  final BaseWalkthroughRepository baseWalkthroughRepository ;

  const GetAllCountryUseCase({
    required this.baseWalkthroughRepository,
  });

  Future<List<Country>> call()async{
    return await baseWalkthroughRepository.getAllCountry();
  }
}