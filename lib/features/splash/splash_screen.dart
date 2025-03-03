import 'dart:async';

import 'package:app_financeiro/common/constants/app_colors.dart';
import 'package:app_financeiro/common/constants/routes.dart';
import 'package:flutter/material.dart';

import '../../common/constants/app_text_styles.dart';
import '../../common/widgets/custom_circular_progress_indicator.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  Timer init() {
    return Timer(const Duration(seconds: 2), navigateToOnBoariding);
  }

  void navigateToOnBoariding() {
    Navigator.pushReplacementNamed(
      context,
      NamedRoute.initial,
    );
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
