import 'package:app_financeiro/features/splash/splash_screen.dart';
import 'package:app_financeiro/onBoarding/onBoarding_screen.dart';
import 'package:flutter/material.dart';

import 'common/themes/default_theme.dart';
import 'features/signUp/sing_up_screen.dart';


class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //theme: defaultTheme,
      
      home: SignUpScreen()
    );
  }
}