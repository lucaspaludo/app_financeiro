// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:flutter/material.dart';

import 'package:app_financeiro/common/constants/app_colors.dart';
import 'package:app_financeiro/common/constants/app_text_styles.dart';

import '../common/widgets/primary_button.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.iceWhite,
      body: Align(
        child: Column(
          children: [
            SizedBox(height: 48.0,),
            Expanded(
              flex: 2,
              child: Image.asset('assets/images/onBoarding.png'),
            ),
            Text('Gaste com sabedoria',
                style: AppTextStyles.mediumText
                    .copyWith(color: AppColors.greenlightTwo)),
            const SizedBox(height: 10),
            Text('Economize mais',
                style: AppTextStyles.mediumText
                    .copyWith(color: AppColors.greenlightTwo)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
              child: PrimaryButton(
                text: 'Começar',
                onPressed: () {},
                ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text('Já tem uma conta? Fazer Log In',
                style: AppTextStyles.smallText.copyWith(color: AppColors.grey)),
            const SizedBox(
              height: 60.0,
            )
          ],
        ),
      ),
    );
  }
}

