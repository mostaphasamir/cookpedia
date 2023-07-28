import 'package:cookpedia/core/utils/app_sizer/app_height.dart';
import 'package:cookpedia/core/utils/app_sizer/app_width.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/routes/app_routes.dart';
import '../../../../core/utils/app_string.dart';
import '../controller/walk_through_bloc.dart';
import '../widgets/country_widget.dart';
import '../widgets/default_button.dart';
import '../widgets/search_text_filed.dart';
import '../widgets/slider_appbar.dart';

class SelectCountryScreen extends StatelessWidget {
  const SelectCountryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: sliderAppBar(
        value: .2,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              Text(
                AppStrings.whichCountry,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(
                height: AppHeight.h3,
              ),
              Text(
                AppStrings.pleaseSelectYourCountry,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              SizedBox(
                height: AppHeight.h3,
              ),
              searchTextFiled(
                onChanged: (value) {
                  context.read<WalkThroughBloc>().add(SearchCountryEvent(value));
                },
              ),
              SizedBox(
                height: AppHeight.h3,
              ),
              BlocBuilder<WalkThroughBloc, WalkThroughState>(
                buildWhen: (previous, current) {
                  return previous != current;
                },
                builder: (context, state) {
                  switch (state.runtimeType) {
                    case (LoadingCountryState):
                      return const Center(child: CircularProgressIndicator());
                    case (LoadedCountryState):
                      final loadedCountryState = state as LoadedCountryState;
                      return SizedBox(
                        height: AppHeight.h42,
                        child: ListView.builder(
                          itemBuilder: (context, index) => GestureDetector(
                            onTap: () {
                              BlocProvider.of<WalkThroughBloc>(context).add(SelectCountryEvent(selectedIndex: index));
                            },
                            child: countryWidget(
                              country: loadedCountryState.countries[index],
                              selected: loadedCountryState.selectedIndex==index,
                            ),
                          ),
                          itemCount: loadedCountryState.countries.length,
                        ),
                      );
                    case SearchByCountryListState:
                      final filteredCountyList =
                          state as SearchByCountryListState;
                      return SizedBox(
                        height: AppHeight.h42,
                        child: ListView.builder(
                          itemBuilder: (context, index)=>GestureDetector(
                            onTap: () {
                              //context.read<WalkThroughBloc>().selectedCountryIndex = index ;
                            },
                            child: countryWidget(
                              country: filteredCountyList.countries[index],
                            ),
                          ),
                          itemCount: filteredCountyList.countries.length,
                        ),
                      );
                    default:
                      return Container();
                  }
                },
              ),
              DefaultButton(
                onTap: () {
                  Navigator.pushNamed(context, Routes.cookingLevelScreen);
                },
                marginHorizontal: AppWidth.w2,
                child: const Text(
                  AppStrings.continuee,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
