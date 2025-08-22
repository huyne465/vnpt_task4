import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:vnpt_task4/constants/app_constants.dart';
import 'package:vnpt_task4/core/route/app_route.dart';
import 'package:vnpt_task4/core/route/app_screen.dart';
import 'package:vnpt_task4/injector.dart';
import 'package:vnpt_task4/module/startup/profile/app/ui/screens/profile_screen.dart';

void main() {
  runApp(const MyApp());
  configureDependencies();
  setupEasyLoading();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          initialRoute: AppRoutes.init,
          getPages: AppScreens.routes,
          debugShowCheckedModeBanner: false,
          title: AppConstants.appName,
          home: const ProfileScreen(),
          builder: EasyLoading.init(),
        );
      },
    );
  }
}

void setupEasyLoading() {
  EasyLoading.instance
    ..indicatorType = EasyLoadingIndicatorType.ring
    ..maskType = EasyLoadingMaskType.black
    ..loadingStyle = EasyLoadingStyle.custom
    ..backgroundColor = Colors.white
    ..indicatorColor = Colors.blue
    ..progressColor = Colors.blue
    ..userInteractions = false
    ..textColor = Colors.black;
}
