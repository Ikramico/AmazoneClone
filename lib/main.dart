import 'package:amazone_demo/constants/globe.dart';
import 'package:amazone_demo/features/auth/screens/au_screen.dart';
import 'package:amazone_demo/router.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Amazon Demo',
      theme: ThemeData(
          scaffoldBackgroundColor: GlobalVariables.backgroundColor,
          colorScheme: ColorScheme.light(
            primary: GlobalVariables.secondaryColor,
          ),
          appBarTheme: const AppBarTheme(elevation: 0),
          iconTheme: const IconThemeData(
            color: Colors.black,
          )),
      onGenerateRoute: (settings) => generateRoute(settings),
      home: const AuthScreen(),
    );
  }
}
