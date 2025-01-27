import 'package:flutter/material.dart';
import 'package:pixelfield/core/app_colors.dart';
import 'package:pixelfield/core/custom_text.dart';
import 'package:pixelfield/core/text_styles.dart';

class ScanPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  const Center(
      child: CustomText(text: 'Scan Page',style: TextStyles.headerStyle,),
    );
  }
}