import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:nxt_test_case/core/extras/constants/app_sizes.dart';

enum CustomLoaderTypes{ring, ripple,}

class CustomLoader extends StatelessWidget {
  final CustomLoaderTypes customLoaderTypes;
  const CustomLoader({this.customLoaderTypes = CustomLoaderTypes.ring, super.key,});
  @override Widget build(BuildContext context,) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12.0,),),
      child: Container(
        constraints: const BoxConstraints.tightFor(
          width: AppSize.s36 * 2,
          height: AppSize.s36 * 2,
        ),
        padding: const EdgeInsets.all(AppSize.s12,),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.15,),
          borderRadius: BorderRadius.circular(AppSize.s12,),
        ),
        child: _getLoader(customLoaderTypes,),
      ),
    );
  }

  Widget _getLoader(CustomLoaderTypes customLoaderTypes,) {
    switch (customLoaderTypes){
      case CustomLoaderTypes.ring:
      return const RingLoaderWidget();
      case CustomLoaderTypes.ripple:
      return const RippleLoaderWidget();
    }
  }
}

class RingLoaderWidget extends StatelessWidget {
  final Color? loaderColor;

  const RingLoaderWidget({this.loaderColor,}) : super(key: null,);

  @override
  Widget build(BuildContext context,) {
    return Container(
      constraints: const BoxConstraints.tightFor(
        width: AppSize.s32 * 2,
        height: AppSize.s32 * 2,
      ),
      alignment: Alignment.center,
      child: SpinKitRing(
        color: loaderColor ?? Colors.blueAccent,
        lineWidth: 8.0,
      ),
    );
  }
}

class RippleLoaderWidget extends StatelessWidget {
  final Color? loaderColor;
  const RippleLoaderWidget({super.key, this.loaderColor,});
  @override Widget build(BuildContext context,) {
    return Container(
      constraints: const BoxConstraints.tightFor(
        width: AppSize.s32 * 2,
        height: AppSize.s32 * 2,
      ),
      alignment: Alignment.center,
      child: SpinKitRipple(color: loaderColor ?? Colors.blueAccent,),
    );
  }
}
