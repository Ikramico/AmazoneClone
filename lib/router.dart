import 'package:amazone_demo/features/auth/screens/au_screen.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AuthScreen.routeName:
      return MaterialPageRoute(builder: (_) => const AuthScreen(),
      settings: routeSettings,
      );
      default: 
       return MaterialPageRoute(builder: (_) => const Scaffold(
        body: Center(
          child: Text('Error 404! Page not Found'),
        ),
       ),
      settings: routeSettings,
      );

  };
  
}
