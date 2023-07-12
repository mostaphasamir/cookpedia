import 'package:cookpedia/core/service/service_locator.dart';
import 'package:cookpedia/core/utils/app_assets.dart';
import 'package:cookpedia/core/utils/app_sizer/app_height.dart';
import 'package:cookpedia/core/utils/app_sizer/app_width.dart';
import 'package:cookpedia/feature/walk_through/presentation/controller/walk_through_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../../config/routes/app_routes.dart';
import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/app_string.dart';
import '../widgets/default_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<WalkThroughBloc>()..add(InitialEvent()),
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage(AppAssets.welcomeBackGround),
            fit: BoxFit.cover,
          )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                AppStrings.welcomeTo,
                style: Theme.of(context).textTheme.displayMedium,
              ),
              SizedBox(
                height: AppHeight.h3,
              ),
              Text(
                AppStrings.cookpedia,
                style: Theme.of(context)
                    .textTheme
                    .displayMedium!
                    .copyWith(color: Theme.of(context).colorScheme.primary),
              ),
              SizedBox(
                height: AppHeight.h3,
              ),
              Text(
                AppStrings.intro,
                style: Theme.of(context).textTheme.titleMedium,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: AppHeight.h2,
              ),
              Divider(
                  color: Colors.white,
                  indent: AppWidth.w10,
                  endIndent: AppWidth.w10),
              DefaultButton(
                onTap: (){
                  sl<WalkThroughBloc>().add(LoginWithGoogleEvent());
                },
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      image: const AssetImage(AppAssets.googleIcon),
                      height: AppHeight.h3,
                    ),
                    SizedBox(
                      width: AppWidth.w2,
                    ),
                    Text(
                      AppStrings.continueWithGoogle,
                      style: TextStyle(fontSize: 14.sp),
                    )
                  ],
                ),
              ),
              DefaultButton(
                  onTap: () => Navigator.pushNamed(context,Routes.selectCountryScreen),
                color: AppColor.primaryColor,
                child: Text(
                  AppStrings.getStarted,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Colors.white),
                ),
              ),
              DefaultButton(
                color: Colors.white,
                child: Text(
                  AppStrings.iAlreadyHaveAnAccount,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Theme.of(context).colorScheme.primary),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
