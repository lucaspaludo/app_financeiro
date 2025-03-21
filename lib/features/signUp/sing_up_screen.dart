// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';
import 'package:app_financeiro/common/constants/routes.dart';
import 'package:app_financeiro/common/utils/uppercase_text_formatter.dart';
import 'package:app_financeiro/common/utils/validator.dart';
import 'package:app_financeiro/common/widgets/custom_bottom_sheet.dart';
import 'package:app_financeiro/common/widgets/password_form_field.dart';
import 'package:app_financeiro/features/signUp/sign_up_controller.dart';
import 'package:app_financeiro/features/signUp/sign_up_state.dart';
import 'package:app_financeiro/services/mock_auth_service.dart';
import 'package:flutter/material.dart';
import '../../common/constants/app_colors.dart';
import '../../common/constants/app_text_styles.dart';
import '../../common/widgets/custom_text_form_field.dart';
import '../../common/widgets/multi_text_button.dart';
import '../../common/widgets/primary_button.dart';
import '../../locator.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen>
    with CustomModalSheetMixin<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _controller = locator.get<SignUpController>();

  @override
  void dispose() {
    _passwordController.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      if (_controller.state is SignUpStateLoading) {
        showDialog(
          context: context,
          builder: (context) =>
              const Center(child: CircularProgressIndicator()),
        );
      } else if (_controller.state is SignUpStateSucess) {
        Navigator.pop(context); // Fecha o dialog de loading
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const Scaffold(
              body: Center(child: Text("Nova Tela")),
            ),
          ),
        );
      } else if (_controller.state is SignUpStateError) {
        Navigator.pop(context); // Fecha o dialog de loading
        final error = _controller.state as SignUpStateError;
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
                    controller: _nameController,
                    labelText: "seu nome",
                    hintText: "LUCAS PALUDO",
                    inputFormatters: [UpperCaseTextInputFormatter()],
                    validator: Validator.validateName,
                  ),
                  CustomTextFormField(
                    controller: _emailController,
                    labelText: "seu e-mail",
                    keyboardType: TextInputType.emailAddress,
                    hintText: "lucas@gmail.com",
                    validator: Validator.validateEmail,
                  ),
                  PasswordFormField(
                    controller: _passwordController,
                    labelText: "Crie sua senha",
                    hintText: "*******",
                    validator: Validator.validatePassword,
                    helperText:
                        "Deve ter pelo menos 8 caracteres, 1 letra maiúscula e 1 número.",
                  ),
                  PasswordFormField(
                      labelText: "Confirmar senha",
                      hintText: "*******",
                      validator: (value) => Validator.validateConfirmPassword(
                          value, _passwordController.text))
                ],
              )),
          Padding(
            padding: const EdgeInsets.only(
                left: 32.0, right: 32.0, top: 16.0, bottom: 4.0),
            child: PrimaryButton(
              text: 'Cadastrar',
              onPressed: () {
                final valid = _formKey.currentContext != null &&
                    _formKey.currentState!.validate();
                if (valid) {
                  _controller.signUp(
                    name: _nameController.text,
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
                Navigator.popAndPushNamed(context, NamedRoute.signIn),
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
