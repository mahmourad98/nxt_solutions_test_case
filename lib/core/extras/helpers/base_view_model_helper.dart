import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

mixin BaseViewModelHelper on BaseViewModel {
  void onModelReady();
  void onPreDispose();
}