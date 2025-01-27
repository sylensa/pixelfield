import 'package:flutter/material.dart';
import 'package:pixelfield/core/app_colors.dart';
import 'package:pixelfield/core/custom_image_widget.dart';
import 'package:pixelfield/core/helper.dart';



class LaunchScreen extends StatelessWidget {
  const LaunchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.primaryColor,
      body:Stack(
        children: [
          CustomImageWidget.displayLocalImage("pixelfield_launch_screen.png",radius: 0,width: appWidth(context),height: appHeight(context)),
          Positioned.fill(
            child:  Center(
              child: Image.asset("assets/images/pixelfield_logo.png",width: 140,height: 140,),
            ),
          )
        ],
      ),
    );
  }
}