import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:vnpt_task5/injector.config.dart';

final injector = GetIt.instance;

@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: true, // default
)
void configureDependencies() => injector.init();

@module
abstract class MainModule {
  @lazySingleton
  RouteObserver<Route> getRouteObserver() => RouteObserver();
}
