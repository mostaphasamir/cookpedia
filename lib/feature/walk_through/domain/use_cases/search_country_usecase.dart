import '../entities/country.dart';
import '../repositories/base_walkthrough_repository.dart';

class SearchCountryUseCase{
  final BaseWalkthroughRepository baseWalkthroughRepository ;

  const SearchCountryUseCase({
    required this.baseWalkthroughRepository,
  });


  Future<List<Country>> call(String countryName)async{
    final result= await baseWalkthroughRepository.searchCountryName(countryName);
    return result;
  }
}