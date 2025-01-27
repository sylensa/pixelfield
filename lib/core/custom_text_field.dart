import 'package:flutter/material.dart';
import 'package:pixelfield/core/app_colors.dart';
import 'package:pixelfield/core/text_styles.dart';


class CustomTextField extends StatelessWidget {
  final String labelText;
  final bool? obscureText;
  final bool? autoFocus;
  final Function onSuffixTap;
  final TextEditingController controller;

  CustomTextField({
    required this.labelText,
    required this.onSuffixTap,
    required this.controller,
    this.obscureText,
    this.autoFocus = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColors.buttonColor))
      ),
      child: TextFormField(
        controller:controller ,
        obscureText: obscureText ?? false,
        autofocus: autoFocus ?? false,
        style: TextStyles.bodyStyle.copyWith(color: Colors.white),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.zero,
          labelText: labelText,
          hintStyle: TextStyles.bodyStyle.copyWith(color: Colors.white),
          labelStyle: TextStyles.bodyStyle.copyWith(color: AppColors.buttonColor),

          border: const OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          suffix:obscureText != null ?
          GestureDetector(
              onTap: (){
                onSuffixTap();
              },
              child:  Icon(obscureText == true ? Icons.visibility_outlined : Icons.visibility_off_outlined ,color: AppColors.buttonColor,)
          ): const SizedBox.shrink()
        )  ,
      ),
    );
  }
}