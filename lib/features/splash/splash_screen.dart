import 'package:app_financeiro/common/constants/app_colors.dart';
import 'package:app_financeiro/common/constants/routes.dart';
import 'package:app_financeiro/features/splash/splash_controller.dart';
import 'package:app_financeiro/features/splash/splash_state.dart';
import 'package:flutter/material.dart';

import '../../common/constants/app_text_styles.dart';
import '../../common/widgets/custom_circular_progress_indicator.dart';
import '../../locator.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final _splashController = locator.get<SplashController>();

  @override
  void initState() {
    super.initState();
    _splashController.isUserLogged();
    _splashController.addListener(() {
      if (_splashController.state is SplashStateSucess) {
        Navigator.pushReplacementNamed(context, NamedRoute.home);
      } else {
        Navigator.pushReplacementNamed(context, NamedRoute.initial);
      }
    });
  }

  @override
  void dispose() {
    _splashController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: AppColors.greenGradient,
        )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'App Financeiro',
              style: AppTextStyles.bigText.copyWith(color: AppColors.white),
            ),
            const CustomCircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
