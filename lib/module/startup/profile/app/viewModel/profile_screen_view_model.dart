import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:injectable/injectable.dart';
import 'package:vnpt_task4/core/clean_arch_setup/abstraction/app_viewModel.dart';
import 'package:vnpt_task4/core/clean_arch_setup/extension/unit.dart';
import 'package:vnpt_task4/core/route/app_route.dart';

@injectable
class ProfileScreenViewModel extends AppViewModel {
  Future<Unit> onNavigate() async {
    await Get.offNamed(AppRoutes.changePassword);
    return unit;
  }
}
