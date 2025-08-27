import 'package:get/route_manager.dart';
import 'package:vnpt_task5/core/routes/app_route.dart';
import 'package:vnpt_task5/module/startup/authorizeCitizenID/app/ui/AuthorizeScreen/screen/authorize_screen.dart';

class AppNavigator {
  static final routes = [
    GetPage(name: AppRoute.authorizeScreen1, page: () => AuthorizeScreen()),
  ];
}
