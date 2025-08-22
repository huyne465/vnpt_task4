import 'package:get/get_navigation/get_navigation.dart';
import 'package:vnpt_task4/core/route/app_route.dart';
import 'package:vnpt_task4/module/startup/profile/app/ui/screens/changePassword_screen.dart';
import 'package:vnpt_task4/module/startup/profile/app/ui/screens/profile_screen.dart';

class AppScreens {
  static final routes = [
    GetPage(name: AppRoutes.profile, page: () => const ProfileScreen()),
    GetPage(
      name: AppRoutes.changePassword,
      page: () => const ChangePasswordScreen(),
    ),
  ];
}
