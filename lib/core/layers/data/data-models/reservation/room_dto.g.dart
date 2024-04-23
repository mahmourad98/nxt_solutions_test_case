// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoomDto _$RoomDtoFromJson(Map<String, dynamic> json) => RoomDto(
      roomNumber: json['room_number'] as String?,
      roomCapacity: json['room_capacity'] as int?,
      roomTypeName: json['room_type_name'] as String?,
      currentHotelName: json['stay_name'] as String?,
      guests: (json['guests'] as List<dynamic>?)
          ?.map((e) => GuestDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RoomDtoToJson(RoomDto instance) => <String, dynamic>{
      'room_number': instance.roomNumber,
      'room_capacity': instance.roomCapacity,
      'room_type_name': instance.roomTypeName,
      'stay_name': instance.currentHotelName,
      'guests': instance.guests?.map((e) => e.toJson()).toList(),
    };

GuestDto _$GuestDtoFromJson(Map<String, dynamic> json) => GuestDto(
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      pictureUrl: json['avatar'] as String?,
    );

Map<String, dynamic> _$GuestDtoToJson(GuestDto instance) => <String, dynamic>{
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'avatar': instance.pictureUrl,
    };
