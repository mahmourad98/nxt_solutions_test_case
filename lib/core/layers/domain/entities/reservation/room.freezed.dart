// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'room.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Room {
  String get roomNumber => throw _privateConstructorUsedError;
  String get roomCapacity => throw _privateConstructorUsedError;
  String get roomTypeName => throw _privateConstructorUsedError;
  String get currentHotelName => throw _privateConstructorUsedError;
  List<Guest> get guests => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RoomCopyWith<Room> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoomCopyWith<$Res> {
  factory $RoomCopyWith(Room value, $Res Function(Room) then) =
      _$RoomCopyWithImpl<$Res, Room>;
  @useResult
  $Res call(
      {String roomNumber,
      String roomCapacity,
      String roomTypeName,
      String currentHotelName,
      List<Guest> guests});
}

/// @nodoc
class _$RoomCopyWithImpl<$Res, $Val extends Room>
    implements $RoomCopyWith<$Res> {
  _$RoomCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? roomNumber = null,
    Object? roomCapacity = null,
    Object? roomTypeName = null,
    Object? currentHotelName = null,
    Object? guests = null,
  }) {
    return _then(_value.copyWith(
      roomNumber: null == roomNumber
          ? _value.roomNumber
          : roomNumber // ignore: cast_nullable_to_non_nullable
              as String,
      roomCapacity: null == roomCapacity
          ? _value.roomCapacity
          : roomCapacity // ignore: cast_nullable_to_non_nullable
              as String,
      roomTypeName: null == roomTypeName
          ? _value.roomTypeName
          : roomTypeName // ignore: cast_nullable_to_non_nullable
              as String,
      currentHotelName: null == currentHotelName
          ? _value.currentHotelName
          : currentHotelName // ignore: cast_nullable_to_non_nullable
              as String,
      guests: null == guests
          ? _value.guests
          : guests // ignore: cast_nullable_to_non_nullable
              as List<Guest>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RoomImplCopyWith<$Res> implements $RoomCopyWith<$Res> {
  factory _$$RoomImplCopyWith(
          _$RoomImpl value, $Res Function(_$RoomImpl) then) =
      __$$RoomImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String roomNumber,
      String roomCapacity,
      String roomTypeName,
      String currentHotelName,
      List<Guest> guests});
}

/// @nodoc
class __$$RoomImplCopyWithImpl<$Res>
    extends _$RoomCopyWithImpl<$Res, _$RoomImpl>
    implements _$$RoomImplCopyWith<$Res> {
  __$$RoomImplCopyWithImpl(_$RoomImpl _value, $Res Function(_$RoomImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? roomNumber = null,
    Object? roomCapacity = null,
    Object? roomTypeName = null,
    Object? currentHotelName = null,
    Object? guests = null,
  }) {
    return _then(_$RoomImpl(
      roomNumber: null == roomNumber
          ? _value.roomNumber
          : roomNumber // ignore: cast_nullable_to_non_nullable
              as String,
      roomCapacity: null == roomCapacity
          ? _value.roomCapacity
          : roomCapacity // ignore: cast_nullable_to_non_nullable
              as String,
      roomTypeName: null == roomTypeName
          ? _value.roomTypeName
          : roomTypeName // ignore: cast_nullable_to_non_nullable
              as String,
      currentHotelName: null == currentHotelName
          ? _value.currentHotelName
          : currentHotelName // ignore: cast_nullable_to_non_nullable
              as String,
      guests: null == guests
          ? _value._guests
          : guests // ignore: cast_nullable_to_non_nullable
              as List<Guest>,
    ));
  }
}

/// @nodoc

class _$RoomImpl implements _Room {
  const _$RoomImpl(
      {required this.roomNumber,
      required this.roomCapacity,
      required this.roomTypeName,
      required this.currentHotelName,
      required final List<Guest> guests})
      : _guests = guests;

  @override
  final String roomNumber;
  @override
  final String roomCapacity;
  @override
  final String roomTypeName;
  @override
  final String currentHotelName;
  final List<Guest> _guests;
  @override
  List<Guest> get guests {
    if (_guests is EqualUnmodifiableListView) return _guests;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_guests);
  }

  @override
  String toString() {
    return 'Room(roomNumber: $roomNumber, roomCapacity: $roomCapacity, roomTypeName: $roomTypeName, currentHotelName: $currentHotelName, guests: $guests)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RoomImpl &&
            (identical(other.roomNumber, roomNumber) ||
                other.roomNumber == roomNumber) &&
            (identical(other.roomCapacity, roomCapacity) ||
                other.roomCapacity == roomCapacity) &&
            (identical(other.roomTypeName, roomTypeName) ||
                other.roomTypeName == roomTypeName) &&
            (identical(other.currentHotelName, currentHotelName) ||
                other.currentHotelName == currentHotelName) &&
            const DeepCollectionEquality().equals(other._guests, _guests));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      roomNumber,
      roomCapacity,
      roomTypeName,
      currentHotelName,
      const DeepCollectionEquality().hash(_guests));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RoomImplCopyWith<_$RoomImpl> get copyWith =>
      __$$RoomImplCopyWithImpl<_$RoomImpl>(this, _$identity);
}

abstract class _Room implements Room {
  const factory _Room(
      {required final String roomNumber,
      required final String roomCapacity,
      required final String roomTypeName,
      required final String currentHotelName,
      required final List<Guest> guests}) = _$RoomImpl;

  @override
  String get roomNumber;
  @override
  String get roomCapacity;
  @override
  String get roomTypeName;
  @override
  String get currentHotelName;
  @override
  List<Guest> get guests;
  @override
  @JsonKey(ignore: true)
  _$$RoomImplCopyWith<_$RoomImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$Guest {
  String get firstName => throw _privateConstructorUsedError;
  String get lastName => throw _privateConstructorUsedError;
  String get pictureUrl => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GuestCopyWith<Guest> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GuestCopyWith<$Res> {
  factory $GuestCopyWith(Guest value, $Res Function(Guest) then) =
      _$GuestCopyWithImpl<$Res, Guest>;
  @useResult
  $Res call({String firstName, String lastName, String pictureUrl});
}

/// @nodoc
class _$GuestCopyWithImpl<$Res, $Val extends Guest>
    implements $GuestCopyWith<$Res> {
  _$GuestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = null,
    Object? lastName = null,
    Object? pictureUrl = null,
  }) {
    return _then(_value.copyWith(
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      pictureUrl: null == pictureUrl
          ? _value.pictureUrl
          : pictureUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GuestImplCopyWith<$Res> implements $GuestCopyWith<$Res> {
  factory _$$GuestImplCopyWith(
          _$GuestImpl value, $Res Function(_$GuestImpl) then) =
      __$$GuestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String firstName, String lastName, String pictureUrl});
}

/// @nodoc
class __$$GuestImplCopyWithImpl<$Res>
    extends _$GuestCopyWithImpl<$Res, _$GuestImpl>
    implements _$$GuestImplCopyWith<$Res> {
  __$$GuestImplCopyWithImpl(
      _$GuestImpl _value, $Res Function(_$GuestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = null,
    Object? lastName = null,
    Object? pictureUrl = null,
  }) {
    return _then(_$GuestImpl(
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      pictureUrl: null == pictureUrl
          ? _value.pictureUrl
          : pictureUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GuestImpl implements _Guest {
  const _$GuestImpl(
      {required this.firstName,
      required this.lastName,
      required this.pictureUrl});

  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final String pictureUrl;

  @override
  String toString() {
    return 'Guest(firstName: $firstName, lastName: $lastName, pictureUrl: $pictureUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GuestImpl &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.pictureUrl, pictureUrl) ||
                other.pictureUrl == pictureUrl));
  }

  @override
  int get hashCode => Object.hash(runtimeType, firstName, lastName, pictureUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GuestImplCopyWith<_$GuestImpl> get copyWith =>
      __$$GuestImplCopyWithImpl<_$GuestImpl>(this, _$identity);
}

abstract class _Guest implements Guest {
  const factory _Guest(
      {required final String firstName,
      required final String lastName,
      required final String pictureUrl}) = _$GuestImpl;

  @override
  String get firstName;
  @override
  String get lastName;
  @override
  String get pictureUrl;
  @override
  @JsonKey(ignore: true)
  _$$GuestImplCopyWith<_$GuestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
