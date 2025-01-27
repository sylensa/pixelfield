import 'package:flutter/material.dart';
import 'package:pixelfield/core/app_colors.dart';
import 'package:pixelfield/core/custom_text.dart';
import 'package:pixelfield/core/text_styles.dart';

class ProductDetailsSectionWidget extends StatelessWidget {
  final String title;
  final String content;

  ProductDetailsSectionWidget({required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          CustomText(text: title, style: TextStyles.bodyStyle.copyWith(fontFamily: "Lato-Regular")),
          CustomText(text: content, style: TextStyles.bodyStyle.copyWith(fontFamily: "Lato-Regular",color: AppColors.tabsColor)),
        ],
      ),
    );
  }
}