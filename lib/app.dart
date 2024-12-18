import 'package:app_financeiro/features/splash/splash_screen.dart';
import 'package:app_financeiro/onBoarding/onBoarding_screen.dart';
import 'package:flutter/material.dart';


class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      home: OnBoardingScreen()
    );
  }
}