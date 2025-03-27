// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';
import 'package:app_financeiro/common/constants/routes.dart';
import 'package:app_financeiro/common/utils/validator.dart';
import 'package:app_financeiro/common/widgets/custom_bottom_sheet.dart';
import 'package:app_financeiro/common/widgets/password_form_field.dart';
import 'package:app_financeiro/features/sign_in/sign_in_state.dart';
import 'package:flutter/material.dart';
import '../../common/constants/app_colors.dart';
import '../../common/constants/app_text_styles.dart';
import '../../common/widgets/custom_text_form_field.dart';
import '../../common/widgets/multi_text_button.dart';
import '../../common/widgets/primary_button.dart';
import '../../locator.dart';
import 'sign_in_controller.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen>
    with CustomModalSheetMixin<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();

  final _emailController = TextEditingController();
  final _controller = locator.get<SignInController>();
  @override
  void dispose() {
    _passwordController.dispose();

    _emailController.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      if (_controller.state is SignInStateLoading) {
        showDialog(
          context: context,
          builder: (context) =>
              const Center(child: CircularProgressIndicator()),
        );
      } else if (_controller.state is SignInStateSucess) {
        Navigator.pop(context); // Fecha o dialog de loading
        Navigator.pushReplacementNamed(context, NamedRoute.home);
      } else if (_controller.state is SignInStateError) {
        Navigator.pop(context); // Fecha o dialog de loading
        final error = _controller.state as SignInStateError;
        showCustomModalBottomSheet(
          context: context,
          content: error.message,
          buttonText: 'Tentar novamente',
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Text('Seja Bem-Vindo!',
              textAlign: TextAlign.center,
              style: AppTextStyles.mediumText
                  .copyWith(color: AppColors.greenlightTwo)),
          Expanded(child: Image.asset('assets/images/signInImage.png')),
          Form(
              key: _formKey,
              child: Column(
                children: [
                  CustomTextFormField(
                    controller: _emailController,
                    labelText: "seu e-mail",
                    keyboardType: TextInputType.emailAddress,
                    hintText: "lucas@gmail.com",
                    validator: Validator.validateEmail,
                  ),
                  PasswordFormField(
                    controller: _passwordController,
                    labelText: "Sua senha",
                    hintText: "*******",
                    validator: Validator.validatePassword,
                    helperText:
                        "Deve ter pelo menos 8 caracteres, 1 letra maiúscula e 1 número.",
                  ),
                ],
              )),
          Padding(
            padding: const EdgeInsets.only(
                left: 32.0, right: 32.0, top: 16.0, bottom: 4.0),
            child: PrimaryButton(
              text: 'Entrar',
              onPressed: () {
                final valid = _formKey.currentContext != null &&
                    _formKey.currentState!.validate();
                if (valid) {
                  _controller.signIn(
                    email: _emailController.text,
                    password: _passwordController.text,
                  );
                } else {
                  log('iu');
                }
              },
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          MultiTextButton(
            onPressed: () =>
                Navigator.popAndPushNamed(context, NamedRoute.signUp),
            children: [
              Text(
                'Não possui uma conta? ',
                style: AppTextStyles.smallText.copyWith(color: AppColors.grey),
              ),
              Text(
                'Cadastre-se ',
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
