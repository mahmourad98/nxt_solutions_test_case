// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TicketDto _$TicketDtoFromJson(Map<String, dynamic> json) => TicketDto(
      id: json['ticket_id'] as int?,
      seatNumber: json['seat'] as String?,
      ticketSystemId: json['ticket_system_id'] as String?,
      ticketTypeName: json['ticket_type_name'] as String?,
      gateNumber: json['gate'] as String?,
      userData: json['ticket_user_data'] == null
          ? null
          : TicketUserDataDto.fromJson(
              json['ticket_user_data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TicketDtoToJson(TicketDto instance) => <String, dynamic>{
      'ticket_id': instance.id,
      'seat': instance.seatNumber,
      'ticket_system_id': instance.ticketSystemId,
      'ticket_type_name': instance.ticketTypeName,
      'gate': instance.gateNumber,
      'ticket_user_data': instance.userData?.toJson(),
    };

TicketUserDataDto _$TicketUserDataDtoFromJson(Map<String, dynamic> json) =>
    TicketUserDataDto(
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      pictureUrl: json['avatar'] as String?,
      isUser: json['is_user'] as bool?,
    );

Map<String, dynamic> _$TicketUserDataDtoToJson(TicketUserDataDto instance) =>
    <String, dynamic>{
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'avatar': instance.pictureUrl,
      'is_user': instance.isUser,
    };
