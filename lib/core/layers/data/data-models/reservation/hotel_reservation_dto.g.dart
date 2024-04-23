// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hotel_reservation_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HotelReservationDto _$HotelReservationDtoFromJson(Map<String, dynamic> json) =>
    HotelReservationDto(
      name: json['name'] as String?,
      description: json['description'] as String?,
      locationLatitude: json['lat'] as String?,
      locationLongitude: json['lng'] as String?,
      checkInDate: json['check_in'] as String?,
      checkOutDate: json['check_out'] as String?,
      rating: json['stars'] as int?,
      images: (json['stay_images'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      rooms: (json['rooms'] as List<dynamic>?)
          ?.map((e) => RoomDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      amenities: json['amenities'] as String?,
    );

Map<String, dynamic> _$HotelReservationDtoToJson(
        HotelReservationDto instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'lat': instance.locationLatitude,
      'lng': instance.locationLongitude,
      'check_in': instance.checkInDate,
      'check_out': instance.checkOutDate,
      'stars': instance.rating,
      'stay_images': instance.images,
      'rooms': instance.rooms?.map((e) => e.toJson()).toList(),
      'amenities': instance.amenities,
    };
