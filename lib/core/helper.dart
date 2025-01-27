import 'package:cached_network_image/cached_network_image.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:pixelfield/core/app_colors.dart';
import 'package:pixelfield/core/custom_text.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();
const fontFamilyLato = "Lato-Regular";
const fontFamilyEBGaramond = "EBGaramond";
appWidth(context) {
  return MediaQuery.of(context).size.width;
}

appHeight(context) {
  return MediaQuery.of(context).size.height;
}

showLoaderDialog(BuildContext context, {String? message = "loading...", bool barrierDismissible = false}) {
  AlertDialog alert = AlertDialog(
    content:  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        progress(),
        const SizedBox(width: 10,),
        Container(
            margin: const EdgeInsets.only(left: 7),
            child: Text(
              message!,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.black),
            )),
      ],
    ),
  );
  showDialog(
    barrierDismissible: barrierDismissible,
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

Widget progress({double size = 20,double radius = 10,Color color = AppColors.primaryColor}) {
  return SizedBox(
      width: size,
      height: size,
      child:  const CircularProgressIndicator(
          backgroundColor: Colors.white,
          color: Color(0XFFFD4041),
          valueColor:  AlwaysStoppedAnimation<Color>(Color(0XFFFD4041),)
      ));
}

toastErrorMessage(String message,BuildContext context,) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
        content: Row(
          children: [
            const Icon(Icons.error_outline_rounded, color: Colors.white),
            const SizedBox(width: 8),
            Expanded(
              child
                  : Text(
                message,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.red,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(color: Colors.red.withOpacity(0.2)),
        ),
        showCloseIcon: true,
        dismissDirection: DismissDirection.down,
        elevation: 0,
        closeIconColor: Colors.white,
        duration: const Duration(seconds:3),
        behavior: SnackBarBehavior.floating,

        margin: const EdgeInsets.only(bottom: 0, left: 20, right: 20)
    ),
  );
}
toastSuccessMessage(String message,BuildContext context,) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
        content: Row(
          children: [
            const Icon(Icons.check_circle, color: Colors.white),
            const SizedBox(width: 8),
            Expanded(
              child
                  : Text(
                message,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
        backgroundColor: AppColors.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: const BorderSide(color: AppColors.primaryColor),
        ),
        showCloseIcon: true,
        closeIconColor: Colors.white,
        dismissDirection: DismissDirection.down,
        duration: const Duration(seconds: 3),
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.only(bottom: 0, left: 20, right: 20)
    ),
  );
}
noInternetConnection({String message = "No Internet Connection"}) {
  return  Container(
    height: 50,
    width: double.infinity,
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(0)
    ),
    child:  Center(
        child: CustomText(
            text: message,
            style: const TextStyle(fontSize: 14,color: Colors.white),
        )),
  );
}

Future<bool> checkIfUserIsOnline() async {
  final connectivityResult = await Connectivity().checkConnectivity();
  if (connectivityResult != ConnectivityResult.none) {
   return true;
  } else {
   return false;
  }
}
