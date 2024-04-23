// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reservation_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReservationDto _$ReservationDtoFromJson(Map<String, dynamic> json) =>
    ReservationDto(
      id: json['id'] as int?,
      startDate: json['start_date'] as String?,
      endDate: json['end_date'] as String?,
      hotelReservations: (json['stays'] as List<dynamic>?)
          ?.map((e) => HotelReservationDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      tickets: (json['user_tickets'] as List<dynamic>?)
          ?.map((e) => TicketDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ReservationDtoToJson(ReservationDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'start_date': instance.startDate,
      'end_date': instance.endDate,
      'stays': instance.hotelReservations?.map((e) => e.toJson()).toList(),
      'user_tickets': instance.tickets?.map((e) => e.toJson()).toList(),
    };
