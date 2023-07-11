
import 'package:flutter/material.dart';

import '../../core/utils/app_string.dart';
import '../../feature/walk_through/presentation/pages/welcome_screen.dart';

class Routes {
  static const String initialRoute = '/';
}


class AppRoutes {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(builder: (context) {
          return const WelcomeScreen();
        });

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
        builder: ((context) =>const Scaffold(
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