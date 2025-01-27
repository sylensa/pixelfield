import 'package:flutter/material.dart';
import 'package:pixelfield/core/app_colors.dart';
import 'package:pixelfield/core/custom_image_widget.dart';
import 'package:pixelfield/core/custom_text.dart';
import 'package:pixelfield/core/helper.dart';
import 'package:pixelfield/core/text_styles.dart';

class HistoryWidget extends StatelessWidget {
  final String title;
  final String description;
  final String label;
  final bool isFirst;
  final bool isLast;

  HistoryWidget({
    required this.title,
    required this.description,
    required this.label,
    required this.isLast,
    required this.isFirst,
  });

  @override
  Widget build(BuildContext context) {
    return   Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height:  isLast == true ? 40 : 0,),
              Text(label, style: TextStyles.bodyStyle.copyWith(color: AppColors.tabsColor,fontSize: 12,fontWeight: FontWeight.w400)),
              Text(title, style: TextStyles.headerStyle),
              const SizedBox(height: 10),
              Text(description, style: TextStyles.bodyStyle.copyWith(color: AppColors.tabsColor)),
              const SizedBox(height: 10),
              Text(description, style: TextStyles.bodyStyle.copyWith(color: AppColors.tabsColor)),
              const SizedBox(height: 10),
              Container(
                width: appWidth(context),
                padding: const EdgeInsets.only(left: 10,right: 10,bottom: 20,top: 0),
                color: AppColors.primaryColor,
                child:  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                       CustomImageWidget.displayLocalImage("file.png",width: 16,height: 16,radius: 0),
                        SizedBox(width: 20,),
                        CustomText(text: "Attachmeent", style: TextStyles.tabStyle),
                      ],
                    ),
                    SizedBox(height: 10,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Container(
                            width: 64,
                            height: 64,
                            color: Color(0XFFD9D9D9),
                          ),
                        ),
                        Flexible(
                          child: Container(
                            width: 64,
                            height: 64,
                            color: Color(0XFFD9D9D9),
                          ),
                        ),
                        Flexible(
                          child: Container(
                            width: 64,
                            height: 64,
                            color: Color(0XFFD9D9D9),
                          ),
                        ),
                      ],
                    )
                 
                  ],
                ),
              )
            ],
          ),
        ),

        Positioned(
          left:10,
          child: Container(
            height: 300,
            width: 1,
            color: AppColors.buttonColor,
          ),
        ),
        Positioned(
          left:0,
          top: isLast ? 40 : 0,
          child:  Container(
            width: 24,
            height: 24,
            decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white
            ),
          ),
        ),
      ],
    );
  }
}