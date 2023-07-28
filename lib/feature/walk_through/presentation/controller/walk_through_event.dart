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

class SelectCountryEvent extends WalkThroughEvent {
  final int selectedIndex ;

  const SelectCountryEvent({
    required this.selectedIndex,
  });
}

class SearchCountryEvent extends WalkThroughEvent{
  final String country ;

  const SearchCountryEvent(this.country);
}

class GetCookingLevelDataEvent extends WalkThroughEvent {}