import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:nxt_test_case/core/layers/domain/entities/reservation/reservation.dart';
import 'view-items/multiple_hotel_reservation_widget.dart';

class HotelReservationsSubView extends HookWidget {
  final Reservation reservation;
  late final _keys = reservation.hotelReservations.map((e) => ValueKey(e.hashCode,),).toList();
  late final _valueNotifiers = reservation.hotelReservations.map((e) => ValueNotifier(false,),).toList();
  /////////////////////////
  HotelReservationsSubView(this.reservation,) : super(key: null,);
  bool get multipleHotelReservation => reservation.hotelReservations.length > 1;
  @override Widget build(BuildContext context,) {
    useEffect(() {
      if (!multipleHotelReservation) {
        _valueNotifiers.first.value = true;
      }
      return null;
    }, const [],);
    /////////////////////////
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext buildContext, int i,) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 8.0,),
            child: HotelReservationItemView(
              key: _keys[i],
              expansionValueNotifier: _valueNotifiers[i],
              isMultiple: multipleHotelReservation,
              tickets: reservation.tickets,
              hotelReservation: reservation.hotelReservations[i],
            ),
          );
        },
        childCount: reservation.hotelReservations.length,
      ),
    );
  }
}

