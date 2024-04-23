import 'package:flutter/material.dart';
import 'package:nxt_test_case/core/extras/constants/constant_messages.dart';
import 'package:stacked/stacked.dart';

import 'custom_loader_widget.dart';
import 'error_visualisation_widget.dart';

class GenericStateWrapperOnViewModel<T extends BaseViewModel> extends ViewModelWidget<T> {
  final Widget payloadWidget;
  final Object? specialBusyObject;
  final Widget? specialLoader;
  final Widget? specialErrorVisualizer;

  @override
  bool get reactive => true;

  const GenericStateWrapperOnViewModel({
    required this.payloadWidget, this.specialBusyObject, this.specialLoader, this.specialErrorVisualizer,
  }) : super(key: null,);

  @override
  Widget build(BuildContext context, T viewModel,) {
    return Container(
      child: isBusy(viewModel,)
      ? _loadingWidget()
      : (viewModel.hasError) ? _errorWidget(viewModel.error(viewModel,),) : payloadWidget,
    );
  }

  bool isBusy(T viewModel,) => (specialBusyObject != null) ? viewModel.busy(specialBusyObject,) : viewModel.isBusy ;

  Widget _loadingWidget() {
    Widget placeHolderWidget = const Center(
      child: CustomLoader(),
    );
    if(specialLoader != null){
      placeHolderWidget = specialLoader!;
    }
    return placeHolderWidget;
  }

  Widget _errorWidget(dynamic err,) {
    if (specialErrorVisualizer != null) {
      return specialErrorVisualizer!;
    } else {
      return GeneralErrorVisualisation(
        message: ConstantMessages.someErrorHappenedMessage,
      );
    }
  }
}
