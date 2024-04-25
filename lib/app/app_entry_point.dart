import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'app_view_controller.dart';
import 'my_app.dart';

class AppEntryPoint extends StatelessWidget {
  const AppEntryPoint() : super(key: null,);
  @override Widget build(BuildContext context,) {
    return ViewModelBuilder<AppViewController>.reactive(
      fireOnViewModelReadyOnce: true,
      initialiseSpecialViewModelsOnce: true,
      createNewViewModelOnInsert: false,
      disposeViewModel: false,
      viewModelBuilder: () => AppViewController(),
      onViewModelReady: (AppViewController viewModel,) => viewModel.onModelReady(),
      onDispose: (AppViewController viewModel,) => viewModel.onPreDispose(),
      builder: (BuildContext buildContext, AppViewController viewModel, __,) => MyApplication(),
    );
  }
}


