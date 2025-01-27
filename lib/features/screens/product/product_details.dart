import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pixelfield/core/app_colors.dart';
import 'package:pixelfield/core/custom_button.dart';
import 'package:pixelfield/core/custom_image_widget.dart';
import 'package:pixelfield/core/custom_text.dart';
import 'package:pixelfield/core/helper.dart';
import 'package:pixelfield/core/text_styles.dart';
import 'package:pixelfield/features/screens/product/history_page.dart';
import 'package:pixelfield/features/screens/product/testing_notes.dart';
import 'package:pixelfield/features/screens/product/widget/details_product.dart';
import 'package:pixelfield/features/screens/widgets/product_details_section_widget.dart';
import 'package:pixelfield/features/screens/widgets/tabs_options.dart';


class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SingleChildScrollView(
        padding:  EdgeInsets.only(top: appHeight(context) * 0.05,left: 0,right: 0),
        child:Stack(
          children: [
            CustomImageWidget.displayLocalImage("pixelfield_launch_screen.png",radius: 0,width: appWidth(context),height: appHeight(context)* 2),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(height: 30,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                        color: AppColors.primaryColor,
                        child: CustomText(
                          text: 'Genesis Collection',
                          style: TextStyles.headerStyle.copyWith(fontWeight: FontWeight.w400,fontSize: 12),
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          Get.back();
                        },
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.primaryColor
                          ),
                          child: CustomImageWidget.displayLocalImage("close.png",width: 24,height: 24,radius: 0),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 20,),

                  Container(
                    width: appWidth(context),
                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                      color: AppColors.primaryColor,
                    child:  Row(
                      children: [
                        CustomImageWidget.displayLocalImage("genuine-product.png",width: 24,height: 24,radius: 0),
                        const SizedBox(width: 10,),
                        Expanded(
                          child: CustomText(
                            text: 'Genuine Bottle (Unopened)',
                            style: TextStyles.subHeaderStyle.copyWith(fontSize: 14,fontWeight: FontWeight.w700),
                          ),
                        ),
                        CustomImageWidget.displayLocalImage("arrow_down.png",width: 15,height: 24,radius: 0),


                      ],
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Center(child:  CustomImageWidget.displayLocalImage("product-image.png",radius: 0,width: 308,height: 411),),

                  const SizedBox(height: 10),
                 Container(
                   color: AppColors.navBackgroundColor,
                   padding: const EdgeInsets.all(20),
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       RichText(
                           text:TextSpan(
                               text: "Bottle",
                               style: TextStyles.subHeaderStyle.copyWith(color: AppColors.tabsColor,fontSize: 12,fontWeight: FontWeight.w400),
                               children: [
                                 TextSpan(
                                   text: ' 135/184',
                                   style: TextStyles.subHeaderStyle.copyWith(color: AppColors.tabsColor,fontSize: 12,fontWeight: FontWeight.w400),
                                 ),

                               ]

                           )
                       ),

                       RichText(
                           text:TextSpan(
                               text: "Talisker",
                               style: TextStyles.subHeaderStyle.copyWith(fontSize: 32,fontWeight: FontWeight.w500,color: AppColors.textFieldColor,fontFamily: fontFamilyEBGaramond),
                               children: [
                                 TextSpan(
                                   text: ' 18 Year old',
                                   style: TextStyles.subHeaderStyle.copyWith(fontSize: 32,fontWeight: FontWeight.w500,color: AppColors.buttonColor,fontFamily: fontFamilyLato),
                                 ),
                                 TextSpan(
                                   text: ' #2504',
                                   style: TextStyles.subHeaderStyle.copyWith(fontSize: 32,fontWeight: FontWeight.w500,color: AppColors.textFieldColor,fontFamily: fontFamilyLato),

                                 ),
                               ]

                           )
                       ),
                       const SizedBox(height: 20),
                       TabsOptions(
                         options: const [
                           "Details","Tasting notes","History",
                         ],
                         onChange: (index){

                         },
                         children: const [
                           DetailsProduct(),
                            TestingNotes(),
                           HistoryPage(),
                         ],
                       ),

                     ],
                   ),
                 ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: appWidth(context),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: CustomButton(
                        text: 'Add to my collection',
                        onPressed: () {
                          // Add your logic here
                        },
                        child:  Row(
                          children: [
                            CustomImageWidget.displayLocalImage("plus.png",width: 24,height: 24,radius: 0),
                            const SizedBox(width: 20,),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            )
          ],
        )

        ,
      ),
    );
  }
}