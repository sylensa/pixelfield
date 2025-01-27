import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixelfield/core/app_colors.dart';
import 'package:pixelfield/core/custom_image_widget.dart';
import 'package:pixelfield/core/custom_text.dart';
import 'package:pixelfield/core/helper.dart';
import 'package:pixelfield/core/text_styles.dart';
import 'package:pixelfield/features/controllers/conectivity_controller/connectivity_cubit.dart';
import 'package:pixelfield/features/controllers/conectivity_controller/connectivty_state.dart';
import 'package:pixelfield/features/screens/collection_screen/collection_page.dart';
import 'package:pixelfield/features/screens/scan_screen/scan_page.dart';
import 'package:pixelfield/features/screens/settings_screen/settings_page.dart';
import 'package:pixelfield/features/screens/shop_screen/shop_page.dart';
import 'package:pixelfield/features/screens/widgets/main_screen_title_widget.dart';

class MainScreen extends StatefulWidget {
  int selectedIndex;
   MainScreen({super.key, this.selectedIndex = 0});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {


  // List of screens to navigate to
  final List<Widget> _screens = [
    ScanPage(),
    CollectionPage(),
    ShopPage(),
    SettingsPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      widget.selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConnectivityCubit,ConnectivityState>(builder: (context,state){
      return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.navBackgroundColor,
          elevation: 0,
          title: MainScreenTitleWidget(selectedIndex: widget.selectedIndex,),
          centerTitle: false,
          actions: [
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 15,top: 20,bottom: 10),
                  child:  CustomImageWidget.displayLocalImage("bell.png",width: 24,height: 24,radius: 0,color: Colors.white),
                ),
                Positioned(
                  bottom: 15,
                  right: 15,
                  child: CustomImageWidget.displayLocalImage("badge.png",width: 8,height: 8,radius: 0),
                )
              ],
            )

          ],

        ),
        bottomSheet: (state is ConnectivityConnected) ?
        const SizedBox.shrink():
        noInternetConnection(),
        backgroundColor: AppColors.navBackgroundColor,
        body:_screens[widget.selectedIndex],

        bottomNavigationBar: BottomNavigationBar(

          currentIndex: widget.selectedIndex,
          backgroundColor: AppColors.primaryColor,
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
          items:  <BottomNavigationBarItem>[

            BottomNavigationBarItem(
              icon: CustomImageWidget.displayLocalImage("scan.png",width: 24,height: 24,radius: 0,color: widget.selectedIndex == 0 ? Colors.white : Colors.grey),
              label: 'Scan',
            ),
            BottomNavigationBarItem(
              icon: CustomImageWidget.displayLocalImage("collections.png",width: 24,height: 24,radius: 0,color: widget.selectedIndex == 1 ? Colors.white : Colors.grey),
              label: 'Collection',
            ),
            BottomNavigationBarItem(
              icon: CustomImageWidget.displayLocalImage("shop.png",width: 24,height: 24,radius: 0,color: widget.selectedIndex == 2 ? Colors.white : Colors.grey),
              label: 'Shop',
            ),
            BottomNavigationBarItem(
              icon: CustomImageWidget.displayLocalImage("settings.png",width: 24,height: 24,radius: 0,color: widget.selectedIndex == 3 ? Colors.white : Colors.grey),
              label: 'Settings',
            ),
          ],
          selectedItemColor: Colors.white, // Color for the selected icon
          unselectedItemColor: Colors.grey, // Color for unselected icons
        ),
      );
    });
  }
}