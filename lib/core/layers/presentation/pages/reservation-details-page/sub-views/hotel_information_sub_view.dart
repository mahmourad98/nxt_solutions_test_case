import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:nxt_test_case/core/extras/constants/app_colors.dart';
import 'package:nxt_test_case/core/extras/helpers/date_time_helper.dart';
import 'package:nxt_test_case/core/layers/domain/entities/reservation/hotel_reservation.dart';
import 'package:nxt_test_case/core/layers/presentation/pages/reservation-details-page/reservation_details_attributes.dart';
import 'package:nxt_test_case/core/layers/presentation/pages/reservation-details-page/sub-views/view-items/hotel_location_widget.dart';
import 'package:nxt_test_case/core/layers/presentation/shared-view-components/hotel_rating_bar.dart';
import 'package:nxt_test_case/core/layers/presentation/shared-view-components/line_painter.dart';

class HotelInformationSubView extends StatelessWidget {
  final HotelReservation hotelReservation;
  /////////////////////////
  const HotelInformationSubView(this.hotelReservation,) : super(key: null,);
  /////////////////////////
  @override Widget build(BuildContext context,) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 20,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "From",
                    style: titleTextStyle.copyWith(
                      color: isDarkMode ? AppColors.whiteColor : AppColors.blackColor,
                    ),
                  ),
                  Text(
                    DateTimeHelper.formatDate(hotelReservation.checkInDate,),
                    style: subtitleTextStyle.copyWith(
                      color: isDarkMode ? AppColors.whiteColor : AppColors.blackColor,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(flex: 5,),
            Expanded(
              flex: 20,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Till",
                    style: titleTextStyle.copyWith(
                      color: isDarkMode ? AppColors.whiteColor : AppColors.blackColor,
                    ),
                  ),
                  Text(
                    DateTimeHelper.formatDate(hotelReservation.checkOutDate,),
                    style: subtitleTextStyle.copyWith(
                      color: isDarkMode ? AppColors.whiteColor : AppColors.blackColor,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(flex: 5,),
          ],
        ),
        const SizedBox(height: 36.0,),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 20,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Stars",
                    style: titleTextStyle.copyWith(
                      color: isDarkMode ? AppColors.whiteColor : AppColors.blackColor,
                    ),
                  ),
                  HotelRatingBar(
                    rating: hotelReservation.rating.toDouble(),
                    size: 40.0,
                  ),
                ],
              ),
            ),
            const Spacer(flex: 5,),
            Expanded(
              flex: 20,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Room Count",
                    style: titleTextStyle.copyWith(
                      color: isDarkMode ? AppColors.whiteColor : AppColors.blackColor,
                    ),
                  ),
                  Text(
                    "${hotelReservation.rooms.length} Rooms",
                    style: subtitleTextStyle.copyWith(
                      color: isDarkMode ? AppColors.whiteColor : AppColors.blackColor,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(flex: 5,),
          ],
        ),
        const SizedBox(height: 36.0,),
        Text(
          "Location:",
          style: titleTextStyle.copyWith(
            fontSize: 24.0,
            color: isDarkMode ? AppColors.whiteColor : AppColors.blackColor,
          ),
        ),
        const SizedBox(height: 8.0,),
        HotelLocationWidget(
          hotelName: hotelReservation.name,
          location: Tuple2(hotelReservation.locationLatitude, hotelReservation.locationLongitude,),
        ),
      ],
    );
  }
}
