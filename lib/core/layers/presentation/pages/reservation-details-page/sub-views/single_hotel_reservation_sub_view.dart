import 'package:flutter/material.dart';
import 'package:nxt_test_case/core/layers/domain/entities/reservation/reservation.dart';
import 'view-items/multiple_hotel_reservation_widget.dart';

class HotelReservationsSubView extends StatefulWidget {
  final Reservation reservation;
  const HotelReservationsSubView(this.reservation,) : super(key: null,);
  @override State<HotelReservationsSubView> createState() => _HotelReservationsSubViewState();
}

class _HotelReservationsSubViewState extends State<HotelReservationsSubView> {
  bool get multipleHotelReservation => widget.reservation.hotelReservations.length > 1;
  late final _keys = widget.reservation.hotelReservations.map((e) => ValueKey(e.hashCode,),).toList();
  late final _valueNotifiers = widget.reservation.hotelReservations.map((e) => ValueNotifier(false,),).toList();
  @override void initState() {
    super.initState();
    if (!multipleHotelReservation) {
      _valueNotifiers.first.value = true;
    }
  }
  @override Widget build(BuildContext context,) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (_, int i,) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 8.0,),
            child: HotelReservationItemView(
              key: _keys[i],
              expansionValueNotifier: _valueNotifiers[i],
              isMultiple: multipleHotelReservation,
              tickets: widget.reservation.tickets,
              hotelReservation: widget.reservation.hotelReservations[i],
            ),
          );
        },
        childCount: widget.reservation.hotelReservations.length,
      ),
    );
  }
}

