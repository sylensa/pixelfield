import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:pixelfield/core/app_colors.dart';
import 'package:pixelfield/core/custom_button.dart';
import 'package:pixelfield/core/custom_image_widget.dart';
import 'package:pixelfield/core/custom_text.dart';
import 'package:pixelfield/core/custom_text_field.dart';
import 'package:pixelfield/core/helper.dart';
import 'package:pixelfield/core/text_styles.dart';
import 'package:pixelfield/features/controllers/login_controller/login_cubit.dart';
import 'package:pixelfield/features/controllers/login_controller/login_state.dart';
import 'package:pixelfield/features/screens/main_screen/main_screen_page.dart';


class SignInPage extends StatefulWidget {
  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool obscureText = true;
  late LoginCubit loginCubit;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loginCubit = BlocProvider.of<LoginCubit>(context);
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit,LoginState>(builder: (context,state){
      return Scaffold(
        backgroundColor: AppColors.primaryColor,
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(onPressed: (){
            Get.back();
          }, icon:CustomImageWidget.displayLocalImage("back_arrow.png",radius: 0,width: 24,height: 24)),
          backgroundColor: AppColors.primaryColor,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 20,),
                const CustomText(
                  text: 'Sign in',
                  style: TextStyles.headerStyle,
                ),
                const SizedBox(height: 40),
                CustomTextField(
                  controller: loginCubit.email,
                  labelText: 'Email',
                  autoFocus: true,
                  onSuffixTap: (){
                    setState(() {

                    });
                  },
                ),
                const SizedBox(height: 40),
                CustomTextField(
                  controller: loginCubit.password,
                  labelText: 'Password',
                  obscureText: obscureText,
                  onSuffixTap: (){
                    setState(() {
                      obscureText = !obscureText;
                    });
                  },
                ),
                const SizedBox(height: 40),
                SizedBox(
                  width: appWidth(context),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: CustomButton(
                      text: 'Continue',
                      onPressed: () {
                        if(loginCubit.validation()){
                          loginCubit.login();
                        }else{
                          toastErrorMessage("All fields are required", context);
                        }

                        // Add your continue logic here
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CustomText(
                      text: 'Can\'t sign in? ',
                      style: TextStyles.bodyStyle.copyWith(fontFamily: "Lato-Regular"),
                    ),
                    const SizedBox(width: 20,),
                    GestureDetector(
                      onTap: () {
                        // Add your recover password logic here
                      },
                      child:  CustomText(
                        text: 'Recover password',
                        style: TextStyles.linkStyle.copyWith(decoration: TextDecoration.none,color: AppColors.buttonColor,fontWeight: FontWeight.w600,fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    }, listener: (context,state){
      if(state is LoginLoading){
          showLoaderDialog(rootNavigatorKey.currentContext!,barrierDismissible: false);
      }
      if(state is LoginLoaded){
        Get.back();
        Get.offAll(() => MainScreen(selectedIndex: 1,));
        toastSuccessMessage("Login was successful", rootNavigatorKey.currentContext!);

      }
      if(state is LoginError){
        Get.back();
       toastErrorMessage(state.message, rootNavigatorKey.currentContext!);
      }
    });
  }
}