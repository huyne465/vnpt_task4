import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:vnpt_task5/core/routes/app_navigator.dart';
import 'package:vnpt_task5/core/routes/app_route.dart';
import 'package:vnpt_task5/injector.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  configureDependencies();
  setupEasyLoading();

  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('vi'),
        // Locale('en'),
      ],
      path: 'resources/languages',
      useOnlyLangCode: true,
      fallbackLocale: const Locale('vi'),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      splitScreenMode: true,
      minTextAdapt: true,
      builder: (context, child) {
        return GetMaterialApp(
          title: 'vnpt_task5',
          builder: EasyLoading.init(),
          transitionDuration: const Duration(milliseconds: 200),
          debugShowCheckedModeBanner: false,
          initialRoute: AppRoute.init,
          getPages: AppNavigator.routes,
          // Thêm localization delegates cho GetMaterialApp
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
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
