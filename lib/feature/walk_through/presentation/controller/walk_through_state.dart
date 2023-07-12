part of 'walk_through_bloc.dart';

abstract class WalkThroughState extends Equatable {
  const WalkThroughState();

  @override
  List<Object> get props => [];
}

class WalkThroughInitial extends WalkThroughState {
  @override
  List<Object> get props => [];
}

class LoginWithGoogleSuccessState extends WalkThroughState {}

class LoginWithGoogleErrorState extends WalkThroughState {}

class LoadingCountryState extends WalkThroughState {}

class LoadedCountryState extends WalkThroughState {
  final List<CountryModel> countries ;

  const LoadedCountryState(this.countries);
}

class ErrorCountryState extends WalkThroughState {}