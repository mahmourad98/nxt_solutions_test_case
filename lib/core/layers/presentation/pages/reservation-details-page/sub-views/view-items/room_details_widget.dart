import 'package:flutter/material.dart';
import 'package:nxt_test_case/core/extras/constants/app_colors.dart';
import 'package:nxt_test_case/core/layers/domain/entities/reservation/room.dart';
import 'package:nxt_test_case/core/layers/presentation/shared-view-components/line_painter.dart';

import '../../reservation_details_attributes.dart';

class RoomDetailsWidget extends StatelessWidget {
  final int index;
  final Room room;
  const RoomDetailsWidget({super.key, required this.index, required this.room,});
  @override Widget build(BuildContext context,) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Room Reservation ${formatNumberWithLeadingZero(index+1,)}",
          style: titleTextStyle.copyWith(
            color: isDarkMode ? Colors.white : Colors.black,
          ),
        ),
        const SizedBox(height: 20.0,),
        Text(
          "Guest(s):",
          style: titleTextStyle.copyWith(
            color: isDarkMode ? Colors.white : Colors.black,
          ),
        ),
        const SizedBox(height: 8.0,),
        ...List.generate(
          room.guests.length,
          (int i) => _SingleGuestRow(guest: room.guests[i],),
        ).map((e) => Padding(padding: const EdgeInsets.only(bottom: 8.0,), child: e,),),
        const SizedBox(height: 28.0,),
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
                    "Room Type:",
                    style: titleTextStyle.copyWith(
                      color: isDarkMode ? Colors.white : Colors.black,
                    ),
                  ),
                  Text(
                    room.roomTypeName,
                    style: subtitleTextStyle.copyWith(
                      color: isDarkMode ? Colors.white : Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(flex: 5,),
            const Expanded(
              flex: 20,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [],
              ),
            ),
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
                    "Room Number",
                    style: titleTextStyle.copyWith(
                      color: isDarkMode ? Colors.white : Colors.black,
                    ),
                  ),
                  Text(
                    room.roomNumber,
                    style: subtitleTextStyle.copyWith(
                      color: isDarkMode ? Colors.white : Colors.black,
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
                    "Sleeps",
                    style: titleTextStyle.copyWith(
                      color: isDarkMode ? Colors.white : Colors.black,
                    ),
                  ),
                  Text(
                    room.roomCapacity.toString(),
                    style: subtitleTextStyle.copyWith(
                      color: isDarkMode ? Colors.white : Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 36.0,),
        const LinePaint(color: AppColors.greyColor2, withGap: true,),
      ],
    );
  }

  String formatNumberWithLeadingZero(int number,) {
    return number < 10 ? '0$number' : number.toString();
  }
}

class _SingleGuestRow extends StatelessWidget {
  final Guest guest;
  /////////////////////////
  const _SingleGuestRow({required this.guest,}) : super(key: null,);
  /////////////////////////
  @override Widget build(BuildContext context,) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 40.0,
          height: 40.0,
          child: DecoratedBox(
            decoration: const BoxDecoration(
              color: AppColors.whiteColor,
              shape: BoxShape.circle,
            ),
            child: Padding(
              padding: const EdgeInsets.all(2.0,),
              child: Container(
                width: 36.0,
                height: 36.0,
                decoration: const BoxDecoration(
                  color: AppColors.whiteColor,
                  shape: BoxShape.circle,
                ),
                clipBehavior: Clip.antiAlias,
                child: Image.network(
                  guest.pictureUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 16.0,
        ),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${guest.firstName} ${guest.lastName}",
                style: subtitleTextStyle.copyWith(
                  color: isDarkMode ? Colors.white : Colors.black,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

