import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:injectable/injectable.dart';
import 'package:vnpt_task5/core/clean_arch_setup/extensions/unit.dart';

@lazySingleton
class LoadingHelper {
  int _counter = 0;

  Future<Unit> show() async {
    if (EasyLoading.isShow) {
      _counter++;
    } else {
      await EasyLoading.show(status: 'Loading...');
    }
    return unit;
  }

  Future<Unit> hide() async {
    if (_counter == 0) {
      await EasyLoading.dismiss();
    } else {
      _counter--;
    }
    return unit;
  }
}
