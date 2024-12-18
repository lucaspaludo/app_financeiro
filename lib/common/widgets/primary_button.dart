import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';

class PrimaryButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  const PrimaryButton({
    Key? key,
    this.onPressed,
    required this.text,
  }) : super(key: key);

  final BorderRadius _borderRadius =
      const BorderRadius.all(Radius.circular(24.0));

  @override
  Widget build(BuildContext context) {
    return Ink(
      
      height: 48,
      decoration: BoxDecoration(
        borderRadius: _borderRadius,
        gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: AppColors.greenGradient),
      ),
      child: InkWell(
        onTap: onPressed,
        borderRadius: _borderRadius,
        child: Align(
          child: Text(
            text,
            style:
                AppTextStyles.mediumText18.copyWith(color: AppColors.white),
          ),
        ),
      ),
    );
  }
}
