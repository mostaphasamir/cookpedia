import 'dart:async';

import 'package:cookpedia/feature/walk_through/domain/entities/country.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/country_model.dart';
import '../../domain/entities/cooking_level.dart';
import '../../domain/use_cases/get_all_country.dart';
import '../../domain/use_cases/get_cooking_level_data_usecase.dart';
import '../../domain/use_cases/login_with_google_usecase.dart';
import '../../domain/use_cases/search_country_usecase.dart';


part 'walk_through_event.dart';
part 'walk_through_state.dart';

class WalkThroughBloc extends Bloc<WalkThroughEvent, WalkThroughState> {
  final LoginWithGoogleUseCase loginWithGoogleUseCase ;
  final GetAllCountryUseCase getAllCountryUseCase ;
  final SearchCountryUseCase searchCountryUseCase ;
  final GetCookingLevelDataUseCase getCookingLevelDataUseCase ;
  WalkThroughBloc(this.loginWithGoogleUseCase,this.getAllCountryUseCase, this.searchCountryUseCase,this.getCookingLevelDataUseCase) : super(WalkThroughInitial()) {
    on<LoginWithGoogleEvent>(loginWithGoogleEvent);
    on<GoToGetStartedEvent>(goToGetStartedEvent);
    on<GetCountryDataEvent>(getCountryDataEvent);
    on<SelectCountryEvent>(selectCountryEvent);
    on<SearchCountryEvent>(searchCountryEvent);
    on<GetCookingLevelDataEvent>(getCookingLevelDataEvent);
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
    emit(LoadedCountryState(countries: result as List<CountryModel>));
  }

  FutureOr<void> searchCountryEvent(SearchCountryEvent event, Emitter<WalkThroughState> emit)async {
    emit(LoadingCountryState());
    final List<Country> filterList = await searchCountryUseCase(event.country);
    emit(LoadedCountryState(countries:  filterList as List<CountryModel>));
  }


  FutureOr<void> selectCountryEvent(SelectCountryEvent event, Emitter<WalkThroughState> emit) {
    final loadedState = state as LoadedCountryState ;
    print(event.selectedIndex);
    emit(loadedState.copyWith(selectedIndex: event.selectedIndex));
  }

  FutureOr<void> getCookingLevelDataEvent(GetCookingLevelDataEvent event, Emitter<WalkThroughState> emit) async{
    emit(GetCookingLevelDataLoadingState());
    final List<CookingLevel> cookingLevelData = await getCookingLevelDataUseCase();
    emit(GetCookingLevelDataSuccessfulState(cookingLevelData:cookingLevelData ));
  }
}
