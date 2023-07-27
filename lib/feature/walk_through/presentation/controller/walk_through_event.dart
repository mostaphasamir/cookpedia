part of 'walk_through_bloc.dart';

abstract class WalkThroughEvent extends Equatable {
  const WalkThroughEvent();
  @override
  List<Object?> get props => [];
}
class InitialEvent extends WalkThroughEvent {}

class LoginWithGoogleEvent extends WalkThroughEvent {}

class GoToGetStartedEvent extends WalkThroughEvent {}

class GetCountryDataEvent extends WalkThroughEvent {}

class SearchCountryEvent extends WalkThroughEvent{
  final String country ;

  const SearchCountryEvent(this.country);
}