import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:pixelfield/core/app_colors.dart';
import 'package:pixelfield/core/helper.dart';
import 'package:pixelfield/features/controllers/conectivity_controller/connectivity_cubit.dart';
import 'package:pixelfield/features/controllers/login_controller/login_cubit.dart';
import 'package:pixelfield/features/controllers/product_controller/list_product_cubit.dart';
import 'package:pixelfield/features/controllers/shared_preference.dart';
import 'package:pixelfield/features/data_repository/login_repo/login_repo.dart';
import 'package:pixelfield/features/data_repository/product_repo/list_product_repo.dart';
import 'package:pixelfield/features/models/user_model.dart';
import 'package:pixelfield/features/screens/main_screen/main_screen_page.dart';
import 'package:pixelfield/features/screens/splash_screen/launch_screen.dart';
import 'package:pixelfield/features/screens/welcome_screen/welcome_page.dart';

void main() async{
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final Widget myFuture;
  getData() {
    return FutureBuilder(
      future: UserPreferences().getUser(loading: true,),
      builder: (context, AsyncSnapshot<UserModel?> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
          return const LaunchScreen();
          default:
            if (snapshot.hasError) {
              return const WelcomeScreen();
            }
            else if (snapshot.data != null) {
              return  MainScreen(selectedIndex: 1,);
            } else if (snapshot.data == null) {
              return const WelcomeScreen();
            } else {
              return const LaunchScreen();
            }
        }
      },
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    myFuture = getData();
  }
  @override
  Widget build(BuildContext context) {


    return  MultiBlocProvider(
      providers: [
        BlocProvider<ListProductControllerCubit>(
          create: (context) => ListProductControllerCubit(ListProductRepo()),
        ),
        BlocProvider<LoginCubit>(
          create: (context) => LoginCubit(LoginRepo()),
        ),
        BlocProvider<ConnectivityCubit>(
          create: (context) => ConnectivityCubit(),
        ),
      ],
      child:  MediaQuery(
        data: MediaQuery.of(context).copyWith(
          textScaleFactor: 1.0,
          boldText: false,
        ),
        child:  GetMaterialApp(
          debugShowCheckedModeBanner: false,
          navigatorKey: rootNavigatorKey,
          title: 'PixelField',
          theme: ThemeData(
            useMaterial3: false,
            scaffoldBackgroundColor: AppColors.primaryColor,
            fontFamily: fontFamilyEBGaramond,
            brightness: Brightness.light,

          ),
          home:myFuture,
        ),
      ),
    );
  }
}