import 'package:app_financeiro/common/constants/app_colors.dart';
import 'package:flutter/material.dart';

import '../../common/constants/app_text_styles.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

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
            )
        ),
        child: Text(
        'App Financeiro',
        style: AppTextStyles.bigText.copyWith(color: AppColors.white),),
      ),
    );
  }
}
