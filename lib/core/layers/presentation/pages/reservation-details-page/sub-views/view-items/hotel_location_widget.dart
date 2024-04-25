import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:nxt_test_case/core/extras/constants/app_colors.dart';
import 'package:nxt_test_case/core/extras/services/geocoding_service.dart';
import 'package:nxt_test_case/core/layers/presentation/pages/reservation-details-page/reservation_details_attributes.dart';

class HotelLocationWidget extends StatelessWidget {
  final String hotelName;
  final Tuple2<double, double> location;
  const HotelLocationWidget({super.key, required this.hotelName, required this.location,});
  @override Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return FutureBuilder<String?>(
      future: Future(() => GeoCodingService.getAddressFromLatLong(location.value1, location.value2,),),
      builder: (BuildContext buildContext, AsyncSnapshot<String?> snapshot,) {
        return SizedBox(
          height: 112.0,
          width: MediaQuery.of(context,).size.width,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: isDarkMode ? AppColors.silverColor2 : AppColors.silverColor,
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10.0,
                  spreadRadius: 2.0,
                  offset: Offset(0.0, 2.0,),
                ),
              ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0,),
                    child: RichText(
                      maxLines: 4,
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: hotelName,
                            style: titleTextStyle.copyWith(
                              color: isDarkMode ? AppColors.whiteColor : AppColors.blackColor,
                            ),
                          ),
                          const TextSpan(text: "\n\n",),
                          TextSpan(
                            text: "Address: ${snapshot.data ?? "Fetching address..."}",
                            style: subtitleTextStyle.copyWith(
                              color: isDarkMode ? AppColors.whiteColor : AppColors.blackColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox.fromSize(
                  size: const Size.fromWidth(104.0,),
                  child: Image.network(
                    "https://i.insider.com/5c954296dc67671dc8346930?width=1136&format=jpeg",
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}
