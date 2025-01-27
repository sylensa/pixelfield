import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pixelfield/core/app_colors.dart';
import 'package:pixelfield/core/custom_button.dart';
import 'package:pixelfield/core/custom_image_widget.dart';
import 'package:pixelfield/core/custom_text.dart';
import 'package:pixelfield/core/helper.dart';
import 'package:pixelfield/core/text_styles.dart';
import 'package:pixelfield/features/screens/sign_in_screen/sign_in_page.dart';


class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Stack(
        children: [
          CustomImageWidget.displayLocalImage("pixelfield_launch_screen.png",radius: 0,width: appWidth(context),height: appHeight(context)),
          Positioned(
            bottom: 50,
            width: appWidth(context),
            child:  Container(
              padding: const EdgeInsets.all(16.0),
              margin: const EdgeInsets.all(20.0),
              color: AppColors.welcomeBackgroundColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const CustomText(
                    text: 'Welcome!',
                    style: TextStyles.headerStyle,
                  ),
                  const SizedBox(height: 20),
                  const CustomText(
                    text: 'Text text text',
                    style: TextStyles.bodyStyle,
                  ),
                  const SizedBox(height: 40),
                  SizedBox(
                    width: appWidth(context),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: CustomButton(
                        text: 'Scan bottle',

                        onPressed: () {
                          // Add your scan bottle logic here
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                       CustomText(
                        text: 'Have an account? ',
                        style: TextStyles.bodyStyle.copyWith(color: AppColors.haveAccountTextColor,fontFamily: "Lato-Regular"),
                      ),
                      GestureDetector(
                        onTap: () {
                          // Add your sign in logic here
                          Get.to(() => SignInPage());
                        },
                        child:  CustomText(
                          text: 'Sign in first',
                          style: TextStyles.linkStyle.copyWith(decoration: TextDecoration.none,color: AppColors.buttonColor,fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}