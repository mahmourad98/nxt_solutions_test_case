import 'package:flutter/material.dart';
import 'package:nxt_test_case/core/layers/domain/entities/reservation/room.dart';
import 'package:nxt_test_case/core/layers/presentation/pages/reservation-details-page/sub-views/view-items/room_details_widget.dart';

class RoomReservationDetailsSubView extends StatelessWidget {
  final List<Room> rooms;
  /////////////////////////
  const RoomReservationDetailsSubView(this.rooms,) : super(key: null,);
  /////////////////////////
  @override Widget build(BuildContext context,) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...List.generate(
          rooms.length,
          (int i,) => RoomDetailsWidget(
            index: i,
            room: rooms[i],
          ),
        ),
      ],
    );
  }
}
