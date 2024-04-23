
import 'package:json_annotation/json_annotation.dart';

part 'ticket_dto.g.dart';

@JsonSerializable(explicitToJson: true,)
class TicketDto {
   @JsonKey(name: 'ticket_id')
   int? id;
   @JsonKey(name: 'seat')
   String? seatNumber;
   @JsonKey(name: 'ticket_system_id')
   String? ticketSystemId;
   @JsonKey(name: 'ticket_type_name')
   String? ticketTypeName;
   @JsonKey(name: 'gate')
   String? gateNumber;
   @JsonKey(name: 'ticket_user_data')
   TicketUserDataDto? userData;

  TicketDto({
    this.id,
    this.seatNumber,
    this.ticketSystemId,
    this.ticketTypeName,
    this.gateNumber,
    this.userData,
  });

  factory TicketDto.fromJson(Map<String, dynamic> json,) => _$TicketDtoFromJson(json,);

  Map<String, dynamic> toJson() => _$TicketDtoToJson(this,);
}

@JsonSerializable(explicitToJson: true,)
class TicketUserDataDto {
  @JsonKey(name: 'first_name')
  String? firstName;
  @JsonKey(name: 'last_name')
  String? lastName;
  @JsonKey(name: 'avatar')
  String? pictureUrl;
  @JsonKey(name: 'is_user')
  bool? isUser;

  TicketUserDataDto({
    this.firstName,
    this.lastName,
    this.pictureUrl,
    this.isUser,
  });

  factory TicketUserDataDto.fromJson(Map<String, dynamic> json,) => _$TicketUserDataDtoFromJson(json,);

  Map<String, dynamic> toJson() => _$TicketUserDataDtoToJson(this,);
}