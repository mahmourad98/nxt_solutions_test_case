import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nxt_test_case/core/layers/data/data-models/reservation/reservation_dto.dart';
import 'package:nxt_test_case/core/layers/domain/entities/reservation/ticket.dart';
import 'hotel_reservation.dart';

part 'reservation.freezed.dart';

@freezed
class Reservation with _$Reservation {
  const factory Reservation({
    required int id,
    required DateTime startDate,
    required DateTime endDate,
    required List<HotelReservation> hotelReservations,
    required List<Ticket> tickets,
  }) = _Reservation;

  factory Reservation.from(ReservationDto other,) {
    return Reservation(
      id: other.id ?? 0,
      startDate: DateTime.parse(other.startDate!,).toUtc(),
      endDate: DateTime.parse(other.endDate!,).toUtc(),
      hotelReservations: other.hotelReservations?.map((HotelReservationDto e) => HotelReservation.from(e,),).toList() ?? <HotelReservation>[],
      tickets: other.tickets?.map((TicketDto e) => Ticket.from(e),).toList() ?? <Ticket>[],
    );
  }
}