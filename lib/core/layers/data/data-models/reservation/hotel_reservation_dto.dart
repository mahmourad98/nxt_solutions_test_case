import 'package:json_annotation/json_annotation.dart';

import 'room_dto.dart';

part 'hotel_reservation_dto.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake,)
class HotelReservationDto {
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'description')
  String? description;
  @JsonKey(name: 'lat')
  String? locationLatitude;
  @JsonKey(name: 'lng')
  String? locationLongitude;
  @JsonKey(name: 'check_in')
  String? checkInDate;
  @JsonKey(name: 'check_out')
  String? checkOutDate;
  @JsonKey(name: 'stars')
  int? rating;
  @JsonKey(name: 'stay_images')
  List<String>? images;
  @JsonKey(name: 'rooms')
  List<RoomDto>? rooms;
  @JsonKey(name: 'amenities')
  String? amenities;

  HotelReservationDto({
    this.name,
    this.description,
    this.locationLatitude,
    this.locationLongitude,
    this.checkInDate,
    this.checkOutDate,
    this.rating,
    this.images,
    this.rooms,
    this.amenities,
  });

  factory HotelReservationDto.fromJson(Map<String, dynamic> json,) => _$HotelReservationDtoFromJson(json,);

  Map<String, dynamic> toJson() => _$HotelReservationDtoToJson(this,);
}