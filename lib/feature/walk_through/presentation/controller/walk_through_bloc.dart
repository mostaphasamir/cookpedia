import 'dart:async';

import 'package:cookpedia/feature/walk_through/domain/entities/country.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/country_model.dart';
import '../../domain/use_cases/get_all_country.dart';
import '../../domain/use_cases/login_with_google_usecase.dart';


part 'walk_through_event.dart';
part 'walk_through_state.dart';

class WalkThroughBloc extends Bloc<WalkThroughEvent, WalkThroughState> {
  final LoginWithGoogleUseCase loginWithGoogleUseCase ;
  final GetAllCountryUseCase getAllCountryUseCase ;
  WalkThroughBloc(this.loginWithGoogleUseCase,this.getAllCountryUseCase) : super(WalkThroughInitial()) {
    on<LoginWithGoogleEvent>(loginWithGoogleEvent);
    on<GoToGetStartedEvent>(goToGetStartedEvent);
    on<GetCountryDataEvent>(getCountryDataEvent);
  }

  Future<FutureOr<void>> loginWithGoogleEvent(LoginWithGoogleEvent event, Emitter<WalkThroughState> emit) async {
    final UserCredential user =await loginWithGoogleUseCase();
    if (kDebugMode) {
      print(user.user!.email);
    }
  }

  FutureOr<void> goToGetStartedEvent(GoToGetStartedEvent event, Emitter<WalkThroughState> emit) {
  }

  FutureOr<void> getCountryDataEvent(GetCountryDataEvent event, Emitter<WalkThroughState> emit) async{
    emit(LoadingCountryState());
    final List<Country> result = await getAllCountryUseCase();
    emit(LoadedCountryState(result as List<CountryModel>));
  }
}
