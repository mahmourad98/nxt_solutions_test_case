import 'package:json_annotation/json_annotation.dart';
import 'hotel_reservation_dto.dart';
import 'ticket_dto.dart';
export 'hotel_reservation_dto.dart';
export 'ticket_dto.dart';

part 'reservation_dto.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake,)
class ReservationDto {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'start_date')
  String? startDate;
  @JsonKey(name: 'end_date')
  String? endDate;
  @JsonKey(name: 'stays')
  List<HotelReservationDto>? hotelReservations;
  @JsonKey(name: 'user_tickets')
  List<TicketDto>? tickets;

  ReservationDto({
    this.id,
    this.startDate,
    this.endDate,
    this.hotelReservations,
    this.tickets,
  });

  factory ReservationDto.fromJson(Map<String, dynamic> json,) => _$ReservationDtoFromJson(json,);

  Map<String, dynamic> toJson() => _$ReservationDtoToJson(this,);
}