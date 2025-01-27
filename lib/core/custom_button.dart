import 'package:flutter/material.dart';
import 'package:pixelfield/core/app_colors.dart';
import 'package:pixelfield/core/custom_image_widget.dart';
import 'package:pixelfield/core/custom_text.dart';
import 'package:pixelfield/core/text_styles.dart';


class CustomButton extends StatelessWidget {
  final String text;
  final Widget? child;
  final VoidCallback onPressed;

  CustomButton({required this.text, required this.onPressed, this.child});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.buttonColor,
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
        textStyle: TextStyles.buttonStyle,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          child ?? SizedBox.shrink(),
          CustomText(text: text,style: const TextStyle(color: AppColors.buttonTextColor,fontSize: 16,fontWeight: FontWeight.w600),),
        ],
      ),
    );
  }
}