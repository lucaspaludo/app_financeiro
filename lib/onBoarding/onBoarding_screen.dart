// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:app_financeiro/common/constants/app_colors.dart';
import 'package:app_financeiro/common/constants/app_text_styles.dart';
import 'package:flutter/material.dart';

import '../common/widgets/multi_text_button.dart';
import '../common/widgets/primary_button.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.iceWhite,
      body: Column(
        children: [
          const SizedBox(
            height: 48.0,
          ),
          Expanded(child: Image.asset('assets/images/onBoarding.png')),
          Text('Gaste com sabedoria',
              style: AppTextStyles.mediumText
                  .copyWith(color: AppColors.greenlightTwo)),
          const SizedBox(height: 10),
          Text('Economize mais',
              style: AppTextStyles.mediumText
                  .copyWith(color: AppColors.greenlightTwo)),
          Padding(
            padding: const EdgeInsets.only(
                left: 32.0, right: 32.0, top: 16.0, bottom: 4.0),
            child: PrimaryButton(
              text: 'Começar',
              onPressed: () {},
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          MultiTextButton(
            onPressed: () {},
            children: [
              Text(
                'Já tem uma conta? ',
                style: AppTextStyles.smallText.copyWith(color: AppColors.grey),
              ),
              Text(
                'Log In ',
                style: AppTextStyles.smallText
                    .copyWith(color: AppColors.greenlightTwo),
              ),
            ],
          ),
          const SizedBox(
            height: 60.0,
          )
        ],
      ),
    );
  }
}
