import 'package:cookpedia/feature/walk_through/presentation/controller/walk_through_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/service/service_locator.dart';
import '../../core/utils/app_string.dart';
import '../../feature/walk_through/presentation/pages/cooking_level_screen.dart';
import '../../feature/walk_through/presentation/pages/select_country_screen.dart';
import '../../feature/walk_through/presentation/pages/welcome_screen.dart';

class Routes {
  static const String initialRoute = '/';
  static const String selectCountryScreen = '/selectCountry';
  static const String cookingLevelScreen = '/cookingLevelScreen';
}

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(builder: (context) {
          return const WelcomeScreen();
        });
      case Routes.selectCountryScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) =>
                sl<WalkThroughBloc>()..add(GetCountryDataEvent()),
            child: const SelectCountryScreen(),
          ),
        );
      case Routes.cookingLevelScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => sl<WalkThroughBloc>()..add(GetCookingLevelDataEvent()),
            child: const CookingLevelScreen(),
          ),
        );

      // case Routes.randomQuoteRoute:
      //   return MaterialPageRoute(builder: ((context) {
      //     return BlocProvider(
      //       create: ((context) => di.sl<RandomQuoteCubit>()),
      //       child: const QuoteScreen(),
      //     );
      //   }));
      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
        builder: ((context) => const Scaffold(
              body: Center(
                child: Text(AppStrings.noRouteFound),
              ),
            )));
  }
}

// final routes = {
//   Routes.initialRoute: (context)=> QuoteScreen(),
//
// };
