import 'package:json_annotation/json_annotation.dart';

part 'room_dto.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake,)
class RoomDto {
  @JsonKey(name: 'room_number')
  String? roomNumber;
  @JsonKey(name: 'room_capacity')
  int? roomCapacity;
  @JsonKey(name: 'room_type_name')
  String? roomTypeName;
  @JsonKey(name: 'stay_name')
  String? currentHotelName;
  @JsonKey(name: 'guests')
  List<GuestDto>? guests;
  RoomDto({
    this.roomNumber,
    this.roomCapacity,
    this.roomTypeName,
    this.currentHotelName,
    this.guests,
  });

  factory RoomDto.fromJson(Map<String, dynamic> json,) => _$RoomDtoFromJson(json,);

  Map<String, dynamic> toJson() => _$RoomDtoToJson(this,);
}

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake,)
class GuestDto {
  @JsonKey(name: 'first_name')
  String? firstName;
  @JsonKey(name: 'last_name')
  String? lastName;
  @JsonKey(name: 'avatar')
  String? pictureUrl;
  GuestDto({
    this.firstName,
    this.lastName,
    this.pictureUrl,
  });

  factory GuestDto.fromJson(Map<String, dynamic> json,) => _$GuestDtoFromJson(json,);

  Map<String, dynamic> toJson() => _$GuestDtoToJson(this,);
}