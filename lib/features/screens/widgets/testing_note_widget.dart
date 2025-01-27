import 'package:flutter/material.dart';
import 'package:pixelfield/core/app_colors.dart';
import 'package:pixelfield/core/custom_text.dart';
import 'package:pixelfield/core/helper.dart';
import 'package:pixelfield/core/text_styles.dart';

class TestingNoteWidget extends StatelessWidget {
  final String title;
  final String description;
  const TestingNoteWidget({super.key, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: appWidth(context),
      padding: const EdgeInsets.only(left: 10,right: 10,bottom: 20,top: 10),
      color: AppColors.primaryColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(text: title, style: TextStyles.tabStyle),
          CustomText(text: description, style: TextStyles.tabStyle.copyWith(fontSize: 16,fontWeight: FontWeight.w400)),
          CustomText(text: description, style: TextStyles.tabStyle.copyWith(fontSize: 16,fontWeight: FontWeight.w400)),
          CustomText(text: description, style: TextStyles.tabStyle.copyWith(fontSize: 16,fontWeight: FontWeight.w400)),

        ],
      ),
    );
  }
}
