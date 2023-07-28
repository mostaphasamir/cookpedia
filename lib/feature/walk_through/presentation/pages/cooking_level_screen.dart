import 'package:cookpedia/core/utils/app_color.dart';
import 'package:cookpedia/feature/walk_through/presentation/controller/walk_through_bloc.dart';
import 'package:cookpedia/feature/walk_through/presentation/widgets/cooking_level_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_sizer/app_height.dart';
import '../../../../core/utils/app_sizer/app_width.dart';
import '../../../../core/utils/app_string.dart';
import '../widgets/default_button.dart';
import '../widgets/slider_appbar.dart';

class CookingLevelScreen extends StatelessWidget {
  const CookingLevelScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: sliderAppBar(value: .4),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
        child: Column(
          children: [
            Text(
              AppStrings.whatIsYourCookingLevel,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(
              height: AppHeight.h3,
            ),
            Text(
              AppStrings.pleaseSelectCookingLevel,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            SizedBox(height: AppHeight.h3,),
            Expanded(
              child: BlocBuilder<WalkThroughBloc, WalkThroughState>(
                builder: (context, state) {
                  switch (state.runtimeType) {
                    case (GetCookingLevelDataSuccessfulState):
                      final stateData =
                          state as GetCookingLevelDataSuccessfulState;
                      return ListView.builder(
                        shrinkWrap: true,
                        itemBuilder: (context, index) => CookingLevelWidget(cookingLevel: stateData.cookingLevelData[index]),
                        itemCount: stateData.cookingLevelData.length,
                      );
                    case (GetCookingLevelDataLoadingState):
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    case (GetCookingLevelDataErrorState):
                      return Container(
                        color: Colors.red,
                      );
                    default:
                      return Container();
                  }
                },
              ),
            ),
            DefaultButton(
              onTap: () {},
              marginHorizontal: AppWidth.w2,
              child: const Text(
                AppStrings.continuee,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
