import 'package:flutter/material.dart';
import 'package:nxt_test_case/core/extras/constants/app_colors.dart';
import 'package:nxt_test_case/core/layers/domain/entities/reservation/reservation.dart';

class ReservationItemView extends StatelessWidget {
  final Reservation reservation;
  final void Function(Reservation reservation,)? onTap;
  const ReservationItemView({super.key, required this.reservation, this.onTap,});
  @override Widget build(BuildContext context,) {
    return Stack(
      fit: StackFit.loose,
      children: [
        Container(
          width: MediaQuery.of(context,).size.width,
          margin: const EdgeInsets.symmetric(horizontal: 16.0,),
          padding: const EdgeInsets.all(16.0,),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey,),
            borderRadius: BorderRadius.circular(8.0,),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "No: ${reservation.id.toString()}",
                style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8.0,),
              Text(
                "${reservation.hotelReservations.length.toString()} Hotel Reservations",
                style: const TextStyle(fontSize: 16.0, color: Colors.grey,),
              ),
            ],
          ),
        ),
        Positioned(
          top: 0,
          bottom: 0,
          right: 0,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 24.0,),
            child: IconButton(
              padding: EdgeInsetsDirectional.zero,
              icon: const Icon(Icons.arrow_right, size: 64.0, color: AppColors.blackColor,),
              onPressed: () { onTap?.call(reservation,); },
            ),
          ),
        ),
      ],
    );
  }
}
