import 'package:flutter/material.dart';
import 'package:pixelfield/core/custom_text.dart';
import 'package:pixelfield/core/text_styles.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  const Center(
      child: CustomText(text: 'Settings Page',style: TextStyles.headerStyle,),
    );
  }
}