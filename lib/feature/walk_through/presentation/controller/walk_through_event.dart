part of 'walk_through_bloc.dart';

abstract class WalkThroughEvent extends Equatable {
  const WalkThroughEvent();
  @override
  List<Object?> get props => [];
}
class InitialEvent extends WalkThroughEvent {}

class LoginWithGoogleEvent extends WalkThroughEvent {


}