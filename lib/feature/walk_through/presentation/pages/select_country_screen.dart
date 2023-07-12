import 'package:cookpedia/core/utils/app_sizer/app_height.dart';
import 'package:cookpedia/core/utils/app_sizer/app_width.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_color.dart';
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
            searchTextFiled(),
            SizedBox(
              height: AppHeight.h3,
            ),
            BlocConsumer<WalkThroughBloc, WalkThroughState>(
              listener: (context, state) {},
              builder: (context, state) {
                switch (state.runtimeType) {
                  case (LoadingCountryState):
                    return const Center(child: CircularProgressIndicator());
                  case (LoadedCountryState):
                    final loadedCountryState = state as LoadedCountryState;
                    return Expanded(
                      child: ListView.builder(
                        itemBuilder: (context, index) => countryWidget(
                          country: loadedCountryState.countries[index],
                        ),
                        itemCount: loadedCountryState.countries.length,
                      ),
                    );
                  default:
                    return Container();
                }
              },
            ),
            const DefaultButton(child: Text(AppStrings.continuee),),
          ],
        ),
      ),
    );
  }
}
