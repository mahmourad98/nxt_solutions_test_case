import 'package:flutter/material.dart';
import 'package:nxt_test_case/core/extras/constants/app_colors.dart';
import 'package:nxt_test_case/core/layers/domain/entities/reservation/hotel_reservation.dart';
import 'package:nxt_test_case/core/layers/domain/entities/reservation/ticket.dart';
import 'package:nxt_test_case/core/layers/presentation/shared-view-components/line_painter.dart';

import '../../reservation_details_attributes.dart';
import '../hotel_extra_description_sub_view.dart';
import '../hotel_information_sub_view.dart';
import '../room_reservation_details_sub_view.dart';
import '../ticket_details_sub_view.dart';

class HotelReservationItemView extends StatelessWidget {
  final HotelReservation hotelReservation;
  final List<Ticket> tickets;
  final bool isMultiple;
  final ValueNotifier<bool> expansionValueNotifier;
  /////////////////////////
  const HotelReservationItemView({
    super.key, required this.tickets, required this.hotelReservation,
    required this.isMultiple, required this.expansionValueNotifier,
  });
  /////////////////////////
  @override Widget build(BuildContext context,) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return ValueListenableBuilder(
      valueListenable: expansionValueNotifier,
      builder: (BuildContext context, bool isExpanded, Widget? child,) {
        return AnimatedContainer(
          curve: Curves.easeInOut,
          alignment: Alignment.center,
          constraints: const BoxConstraints(minHeight: 64.0,),
          duration: const Duration(milliseconds: 500,),
          decoration: BoxDecoration(
            color: isMultiple ? (isDarkMode ? AppColors.blackColor2 : AppColors.whiteColor2) : (isDarkMode ? AppColors.blackColor : AppColors.whiteColor),
          ),
          padding: const EdgeInsetsDirectional.only(start: 16.0, end: 16.0,),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if(isMultiple) ...[
                SizedBox.fromSize(
                  size: const Size.fromHeight(56.0,),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () => expansionValueNotifier.value = !expansionValueNotifier.value,
                        padding: EdgeInsets.zero,
                        icon: Icon(
                          (isExpanded) ? Icons.keyboard_arrow_up_outlined : Icons.keyboard_arrow_down_outlined,
                          size: 48.0,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          hotelReservation.name,
                          style: titleTextStyle.copyWith(
                            color: isDarkMode ? AppColors.whiteColor : AppColors.blackColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                LinePaint(thickness: 1.0, color: isDarkMode ? AppColors.whiteColor : AppColors.blackColor,),
                const SizedBox(height: 8.0,),
              ],
              if(isExpanded) ...[
                if(isMultiple) const SizedBox(height: 36.0,),
                HotelInformationSubView(hotelReservation,),
                const SizedBox(height: 36.0,),
                TicketsDetailsSubView(tickets,),
                const SizedBox(height: 36.0,),
                RoomReservationDetailsSubView(hotelReservation.rooms,),
                const SizedBox(height: 36.0,),
                HotelExtraDescriptionSubView(hotelReservation,),
                const SizedBox(height: 36.0,),
              ],
            ],
          ),
        );
      },
    );
  }
}