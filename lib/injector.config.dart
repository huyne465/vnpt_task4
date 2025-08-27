// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i409;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import 'core/helper/loading_helper.dart' as _i749;
import 'injector.dart' as _i811;
import 'module/startup/authorizeCitizenID/app/viewModel/stepper_view_model.dart'
    as _i585;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final mainModule = _$MainModule();
    gh.factory<_i585.StepperViewModel>(() => _i585.StepperViewModel());
    gh.lazySingleton<_i749.LoadingHelper>(() => _i749.LoadingHelper());
    gh.lazySingleton<_i409.RouteObserver<_i409.Route<dynamic>>>(
      () => mainModule.getRouteObserver(),
    );
    return this;
  }
}

class _$MainModule extends _i811.MainModule {}
