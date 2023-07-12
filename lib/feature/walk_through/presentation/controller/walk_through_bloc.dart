import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../domain/use_cases/login_with_google_usecase.dart';


part 'walk_through_event.dart';
part 'walk_through_state.dart';

class WalkThroughBloc extends Bloc<WalkThroughEvent, WalkThroughState> {
  final LoginWithGoogleUseCase loginWithGoogleUseCase ;
  WalkThroughBloc(this.loginWithGoogleUseCase) : super(WalkThroughInitial()) {
    on<LoginWithGoogleEvent>(loginWithGoogleEvent);
  }

  Future<FutureOr<void>> loginWithGoogleEvent(LoginWithGoogleEvent event, Emitter<WalkThroughState> emit) async {
    final UserCredential user =await loginWithGoogleUseCase();
    print(user.user!.email);
  }
}
