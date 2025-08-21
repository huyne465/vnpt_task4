import 'package:vnpt_task4/core/clean_arch_setup/extension/unit.dart';
import 'package:vnpt_task4/core/clean_arch_setup/extension/view_model_abs.dart';
import 'package:vnpt_task4/core/helper/ErrorSnackbar_helper.dart';
import 'package:vnpt_task4/core/helper/loading_helper.dart';
import 'package:vnpt_task4/injector.dart';

abstract class AppViewModel extends ViewModel {
  @override
  Future<Unit> showLoading() async {
    await getIt.get<LoadingHelper>().show();
    return unit;
  }

  @override
  Future<Unit> hideLoading() async {
    await getIt.get<LoadingHelper>().hide();
    return unit;
  }

  @override
  Future<Unit> handleError(dynamic error) async {
    await showSnackBar(error.toString());
    return unit;
  }
}
