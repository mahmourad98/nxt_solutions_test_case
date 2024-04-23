import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:nxt_test_case/core/extras/constants/app_sizes.dart';

class HotelRatingBar extends StatelessWidget {
  final bool isReadOnly;
  final int count;
  final double rating;
  final Color color;
  final double size;
  final void Function(double,)? onRatingUpdate;
  const HotelRatingBar({
    super.key,
    this.isReadOnly = true,
    this.count = 5,
    this.size = AppSize.s24,
    this.color = Colors.orangeAccent,
    required this.rating,
    this.onRatingUpdate,
  });
  @override Widget build(BuildContext context,) {
    return IgnorePointer(
      ignoring: !isReadOnly,
      ignoringSemantics: !isReadOnly,
      child: FittedBox(
        fit: BoxFit.fitWidth,
        child: RatingBar.builder(
          allowHalfRating: true,
          direction: Axis.horizontal,
          wrapAlignment: WrapAlignment.center,
          itemPadding: const EdgeInsets.symmetric(horizontal: AppSize.s4,),
          itemCount: count,
          initialRating: rating,
          minRating: 1.0,
          maxRating: count.toDouble(),
          itemSize: size,
          itemBuilder: (_, __,) => Icon(Icons.star, color: color,),
          onRatingUpdate: (double r,) { return onRatingUpdate?.call(r,); },
        ),
      ),
    );
  }
}
