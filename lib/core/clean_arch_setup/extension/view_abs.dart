import 'package:flutter/widgets.dart';
import 'package:vnpt_task4/core/clean_arch_setup/extension/view_model_abs.dart';

abstract class ViewState<T extends StatefulWidget, M extends ViewModel>
    extends State<T> {
  late M _viewModel;
  M get viewModel => _viewModel;

  @protected
  void loadArguments() {}

  @protected
  M createViewModel();

  //init state
  @override
  void initState() {
    _viewModel = createViewModel();
    super.initState();
    loadArguments();
    _viewModel.initState();
  }
  //update state

  @override
  void didUpdateWidget(covariant T oldWidget) {
    super.didUpdateWidget(oldWidget);
    loadArguments();
  }

  //dispose state
  @override
  void dispose() {
    _viewModel.disposeState();
    super.dispose();
  }
}
