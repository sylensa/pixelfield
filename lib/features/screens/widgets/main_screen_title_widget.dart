import 'package:flutter/material.dart';
import 'package:pixelfield/core/custom_text.dart';
import 'package:pixelfield/core/text_styles.dart';

class MainScreenTitleWidget extends StatelessWidget {
 final int selectedIndex;
  const MainScreenTitleWidget({super.key,required this.selectedIndex});

  getTitle(int index){
    switch(index){
      case 0:
        return "Scan";
      case 1:
        return "My Collections";
      case 2:
        return "My Shop";
      case 3:
        return "Settings";

    }
  }
  @override
  Widget build(BuildContext context) {
    return CustomText(text: "${getTitle(selectedIndex)}", style: TextStyles.headerStyle);
  }
}
