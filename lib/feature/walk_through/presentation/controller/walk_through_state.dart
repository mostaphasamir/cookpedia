part of 'walk_through_bloc.dart';

abstract class WalkThroughState extends Equatable {
  const WalkThroughState();

}

class WalkThroughInitial extends WalkThroughState {
  @override
  List<Object> get props => [];
}

class LoginWithGoogleSuccessState extends WalkThroughState {
  @override
  List<Object?> get props => [];
}

class LoginWithGoogleErrorState extends WalkThroughState {
  @override
  List<Object?> get props => [];
}

class LoadingCountryState extends WalkThroughState {
  @override
  List<Object?> get props => [];
}

class LoadedCountryState extends WalkThroughState {
  final List<CountryModel> countries;
  final int? selectedIndex;

  const LoadedCountryState({required this.countries, this.selectedIndex});

  LoadedCountryState copyWith({
    required int selectedIndex,
  }) {
    return LoadedCountryState(
      countries: countries,
      selectedIndex: selectedIndex,
    );
  }

  @override
  List<Object?> get props => [countries, selectedIndex];
}

class ErrorCountryState extends WalkThroughState {
  @override
  List<Object?> get props => [];
}

class SearchByCountryListState extends WalkThroughState {
  final List<CountryModel> countries;

  const SearchByCountryListState({required this.countries});

  @override
  List<Object> get props => [countries];
}



class GetCookingLevelDataLoadingState extends WalkThroughState {
  @override
  List<Object> get props => [];
}

class GetCookingLevelDataSuccessfulState extends WalkThroughState {
  final List<CookingLevel> cookingLevelData;

  const GetCookingLevelDataSuccessfulState({
    required this.cookingLevelData,
  });

  @override
  List<Object> get props => [cookingLevelData];
}

class GetCookingLevelDataErrorState extends WalkThroughState {
  @override
  List<Object> get props => [];
}