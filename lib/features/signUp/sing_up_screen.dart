// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_financeiro/common/utils/uppercase_text_formatter.dart';
import 'package:app_financeiro/common/widgets/password_form_field.dart';
import 'package:flutter/material.dart';

import '../../common/constants/app_colors.dart';
import '../../common/constants/app_text_styles.dart';
import '../../common/widgets/custom_text_form_field.dart';
import '../../common/widgets/multi_text_button.dart';
import '../../common/widgets/primary_button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
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
              key: _formKey,
              child: Column(
                children: [
                  CustomTextFormField(
                    labelText: "seu nome",
                    hintText: "LUCAS PALUDO",
                    inputFormatters: [UpperCaseTextInputFormatter()],
                    validator: (value) {
                      if (value != null && value.isEmpty) {
                        return "Esse campo não pode ser vazio";
                      }
                      return null;
                    },
                  ),
                  CustomTextFormField(
                    labelText: "seu e-mail",
                    keyboardType: TextInputType.emailAddress,
                    hintText: "lucas@gmail.com",
                    validator: (value) {
                      if (value != null && value.isEmpty) {
                        return "Esse campo não pode ser vazio";
                      }
                      return null;
                    },
                  ),
                  PasswordFormField(
                    labelText: "Crie sua senha",
                    hintText: "*******",
                    validator: (value) {
                      if (value != null && value.isEmpty) {
                        return "Esse campo não pode ser vazio";
                      }
                      return null;
                    },
                    helperText: "Deve ter pelo menos 8 caracteres, 1 letra maiúscula e 1 número.",
                    
                  ),
                  PasswordFormField(
                    labelText: "Confirmar senha",
                    hintText: "*******",
                    validator: (value) {
                      if (value != null && value.isEmpty) {
                        return "Esse campo não pode ser vazio";
                      }
                      return null;
                    },
                  )
                ],
              )),
          Padding(
            padding: const EdgeInsets.only(
                left: 32.0, right: 32.0, top: 16.0, bottom: 4.0),
            child: PrimaryButton(
              text: 'Cadastrar',
              onPressed: () {
                final valid = _formKey.currentContext != null && _formKey.currentState!.validate();
                if (valid) {

                } else {

                }
              },
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
