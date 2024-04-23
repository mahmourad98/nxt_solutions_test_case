import 'package:flutter/material.dart';
import 'package:nxt_test_case/core/extras/constants/app_sizes.dart';
import 'package:nxt_test_case/core/extras/constants/app_text_styles.dart';

class GeneralErrorVisualisation extends StatelessWidget {
  final String message;
  const GeneralErrorVisualisation({required this.message,}) : super(key: null,);
  @override Widget build(BuildContext context,) {
    return Center(
      child: InkWell(
        onTap: () => {},
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.signal_cellular_connected_no_internet_0_bar_outlined,
              size: (AppSize.s32 * 4),
              color: Colors.grey.withAlpha(100,),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: AppSize.s24, vertical: AppSize.s20,),
              child: Text(
                "$message Tap for retry",
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: FontSizeManager.s12,
                  fontWeight: FontWeightManager.semiBold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}