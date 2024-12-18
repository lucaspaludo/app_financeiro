import 'package:app_financeiro/common/constants/app_colors.dart';
import 'package:app_financeiro/common/constants/app_text_styles.dart';
import 'package:flutter/material.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        child: Column(
          
          children: [
            Expanded(
              flex: 2,
              child: Container(
                color: AppColors.iceWhite,
                child: Image.asset('assets/images/onBoarding.png'),
              ),
            ),
            Text('Gaste com sabedoria', style: AppTextStyles.mediumText.copyWith(color: AppColors.greenlightTwo)),
            const  SizedBox(height: 10),
            Text('Economize mais', style: AppTextStyles.mediumText.copyWith(color: AppColors.greenlightTwo)),
            const  SizedBox(height: 20,),
            ElevatedButton(onPressed: (){}, child: const Text('Começar')),
            const SizedBox(height: 20,),
            Text('Já tem uma conta? Fazer Log In', style: AppTextStyles.smallText.copyWith(color: AppColors.grey)),
            const SizedBox(height: 60.0,)
          ],
        ),
      ),
    );
  }
}
