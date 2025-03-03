
import 'package:app_financeiro/common/constants/routes.dart';
import 'package:app_financeiro/features/sign_in/sign_in_screen.dart';
import 'package:app_financeiro/features/splash/splash_screen.dart';
import 'package:app_financeiro/onBoarding/on_boarding_screen.dart';
import 'package:flutter/material.dart';
import 'features/signUp/sing_up_screen.dart';


class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //theme: defaultTheme,
      
      initialRoute: NamedRoute.splash,
      routes: {
        NamedRoute.initial: (context) => const OnBoardingScreen(),
        NamedRoute.splash:(context) => const SplashScreen(),
        NamedRoute.signUp: (context) => const SignUpScreen(),
        NamedRoute.signIn: (context) => const SignInScreen(),
      },
    );
  }
}