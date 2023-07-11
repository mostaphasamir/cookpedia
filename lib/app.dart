import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'config/routes/app_routes.dart';
import 'config/themes/app_light_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return Sizer(
        builder: (context, orientation, deviceType) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Cookpedia',
            theme: appLightTheme(),
            onGenerateRoute: AppRoutes.onGenerateRoute,
          );
        }
    );

  }
}
