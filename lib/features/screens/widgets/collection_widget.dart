import 'package:flutter/material.dart';
import 'package:pixelfield/core/app_colors.dart';
import 'package:pixelfield/core/custom_image_widget.dart';
import 'package:pixelfield/core/text_styles.dart';

class CollectionItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String details;

  CollectionItem({
    required this.title,
    required this.subtitle,
    required this.details,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.welcomeBackgroundColor,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(child: CustomImageWidget.displayLocalImage("wine_bottle.png",width: 122,height: 170,radius: 0),),
            const SizedBox(height: 10,),
            SizedBox(
                width:126,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: TextStyles.headerStyle.copyWith(fontSize: 22,fontWeight: FontWeight.w500,),maxLines: 1,overflow: TextOverflow.ellipsis,),
                  Text(subtitle, style:  TextStyles.headerStyle.copyWith(fontSize: 22,fontWeight: FontWeight.w500,),maxLines: 1,overflow: TextOverflow.ellipsis,),
                  Text(details, style: TextStyles.bodyStyle.copyWith(color: const Color(0XFFD7D5D1),fontSize: 12,fontWeight: FontWeight.w400),maxLines: 1,overflow: TextOverflow.ellipsis,),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}