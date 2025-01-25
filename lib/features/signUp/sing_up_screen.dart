// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../common/constants/app_colors.dart';
import '../../common/constants/app_text_styles.dart';
import '../../common/widgets/custom_text_form_field.dart';
import '../../common/widgets/multi_text_button.dart';
import '../../common/widgets/primary_button.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Text('Gaste com sabedoria',
              textAlign: TextAlign.center,
              style: AppTextStyles.mediumText
                  .copyWith(color: AppColors.greenlightTwo)),
          Text('Economize mais',
              textAlign: TextAlign.center,
              style: AppTextStyles.mediumText
                  .copyWith(color: AppColors.greenlightTwo)),
          Expanded(child: Image.asset('assets/images/signUpImage.png')),
          Form(
              child: Column(
            children: const [
              CustomTextFormField(
                labelText: "seu nome",
                hintText: "Lucas Paludo",
              )
            ],
          )),
          Padding(
            padding: const EdgeInsets.only(
                left: 32.0, right: 32.0, top: 16.0, bottom: 4.0),
            child: PrimaryButton(
              text: 'Cadastrar',
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
        ],
      ),
    );
  }
}


