import 'package:flutter/material.dart';

import '../../../../core/theme/colors.dart';

class CustomTextfield extends StatelessWidget {
  final String hintText;
  final Widget suffixIcon;

  const CustomTextfield({
    super.key,
    required this.hintText,
    required this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hintText,
        suffixIcon: suffixIcon,
        suffixIconColor: AppColors.primary,
      ),
    );
  }
}
