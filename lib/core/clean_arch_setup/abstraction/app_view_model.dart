import 'package:vnpt_task5/core/clean_arch_setup/extensions/unit.dart';
import 'package:vnpt_task5/core/clean_arch_setup/extensions/view_model_abs.dart';
import 'package:vnpt_task5/core/helper/loading_helper.dart';
import 'package:vnpt_task5/core/helper/toast_helper.dart';
import 'package:vnpt_task5/injector.dart';

abstract class AppViewModel extends ViewModel {
  @override
  Future<Unit> showLoading() async {
    await injector.get<LoadingHelper>().show();
    return unit;
  }

  @override
  Future<Unit> hideLoading() async {
    await injector.get<LoadingHelper>().hide();
    return unit;
  }

  @override
  Future<Unit> handleError(error) async {
    // TODO: implement handleError
    await showToast(error.toString());
    return unit;
  }
}
