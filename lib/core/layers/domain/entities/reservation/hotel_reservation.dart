import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nxt_test_case/core/layers/data/data-models/reservation/hotel_reservation_dto.dart';
import 'package:nxt_test_case/core/layers/data/data-models/reservation/room_dto.dart';

import 'room.dart';

part 'hotel_reservation.freezed.dart';

@freezed
class HotelReservation with _$HotelReservation {
  const factory HotelReservation({
    required String name,
    required String description,
    required double locationLatitude,
    required double locationLongitude,
    required DateTime checkInDate,
    required DateTime checkOutDate,
    required int rating,
    required List<String> images,
    required List<Room> rooms,
    required String amenities,
  }) = _HotelReservation;

  factory HotelReservation.from(HotelReservationDto other,){
    return HotelReservation(
      name: other.name ?? 'N/A',
      description: other.description ?? 'N/A',
      locationLatitude: (other.locationLatitude != null) ? num.parse(other.locationLatitude!).toDouble() : 0.0,
      locationLongitude: (other.locationLongitude != null) ? num.parse(other.locationLongitude!).toDouble() : 0.0,
      checkInDate: DateTime.now().toLocal().toUtc(),
      checkOutDate: DateTime.now().toLocal().toUtc(),
      rating: other.rating ?? 0,
      images: other.images ?? <String>[],
      rooms: other.rooms?.map((RoomDto e) => Room.from(e),).toList() ?? <Room>[],
      amenities: other.amenities ?? 'N/A',
    );
  }
}