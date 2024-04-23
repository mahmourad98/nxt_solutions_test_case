import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nxt_test_case/core/layers/data/data-models/reservation/room_dto.dart';

part 'room.freezed.dart';

@freezed
class Room with _$Room {
  const factory Room({
    required String roomNumber,
    required String roomCapacity,
    required String roomTypeName,
    required String currentHotelName,
    required List<Guest> guests,
  }) = _Room;

  factory Room.from(RoomDto other,){
    return Room(
      roomNumber: other.roomNumber ?? 'N/A',
      roomCapacity: other.roomCapacity?.toString() ?? 'N/A',
      roomTypeName: other.roomTypeName ?? 'N/A',
      currentHotelName: other.currentHotelName ?? 'N/A',
      guests: other.guests?.map((e) => Guest.from(e),).toList() ?? <Guest>[],
    );
  }
}

@freezed
class Guest with _$Guest {
  const factory Guest({
    required String firstName,
    required String lastName,
    required String pictureUrl,
  }) = _Guest;

  factory Guest.from(GuestDto other,){
    return Guest(
      firstName: other.firstName ?? 'N/A',
      lastName: other.lastName ?? 'N/A',
      pictureUrl: other.pictureUrl ?? '',
    );
  }
}