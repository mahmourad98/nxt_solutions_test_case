// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ticket.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Ticket {
  int get id => throw _privateConstructorUsedError;
  String get seatNumber => throw _privateConstructorUsedError;
  String get ticketSystemId => throw _privateConstructorUsedError;
  String get ticketTypeName => throw _privateConstructorUsedError;
  String get gateNumber => throw _privateConstructorUsedError;
  TicketUserData get userData => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TicketCopyWith<Ticket> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TicketCopyWith<$Res> {
  factory $TicketCopyWith(Ticket value, $Res Function(Ticket) then) =
      _$TicketCopyWithImpl<$Res, Ticket>;
  @useResult
  $Res call(
      {int id,
      String seatNumber,
      String ticketSystemId,
      String ticketTypeName,
      String gateNumber,
      TicketUserData userData});

  $TicketUserDataCopyWith<$Res> get userData;
}

/// @nodoc
class _$TicketCopyWithImpl<$Res, $Val extends Ticket>
    implements $TicketCopyWith<$Res> {
  _$TicketCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? seatNumber = null,
    Object? ticketSystemId = null,
    Object? ticketTypeName = null,
    Object? gateNumber = null,
    Object? userData = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      seatNumber: null == seatNumber
          ? _value.seatNumber
          : seatNumber // ignore: cast_nullable_to_non_nullable
              as String,
      ticketSystemId: null == ticketSystemId
          ? _value.ticketSystemId
          : ticketSystemId // ignore: cast_nullable_to_non_nullable
              as String,
      ticketTypeName: null == ticketTypeName
          ? _value.ticketTypeName
          : ticketTypeName // ignore: cast_nullable_to_non_nullable
              as String,
      gateNumber: null == gateNumber
          ? _value.gateNumber
          : gateNumber // ignore: cast_nullable_to_non_nullable
              as String,
      userData: null == userData
          ? _value.userData
          : userData // ignore: cast_nullable_to_non_nullable
              as TicketUserData,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TicketUserDataCopyWith<$Res> get userData {
    return $TicketUserDataCopyWith<$Res>(_value.userData, (value) {
      return _then(_value.copyWith(userData: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TicketImplCopyWith<$Res> implements $TicketCopyWith<$Res> {
  factory _$$TicketImplCopyWith(
          _$TicketImpl value, $Res Function(_$TicketImpl) then) =
      __$$TicketImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String seatNumber,
      String ticketSystemId,
      String ticketTypeName,
      String gateNumber,
      TicketUserData userData});

  @override
  $TicketUserDataCopyWith<$Res> get userData;
}

/// @nodoc
class __$$TicketImplCopyWithImpl<$Res>
    extends _$TicketCopyWithImpl<$Res, _$TicketImpl>
    implements _$$TicketImplCopyWith<$Res> {
  __$$TicketImplCopyWithImpl(
      _$TicketImpl _value, $Res Function(_$TicketImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? seatNumber = null,
    Object? ticketSystemId = null,
    Object? ticketTypeName = null,
    Object? gateNumber = null,
    Object? userData = null,
  }) {
    return _then(_$TicketImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      seatNumber: null == seatNumber
          ? _value.seatNumber
          : seatNumber // ignore: cast_nullable_to_non_nullable
              as String,
      ticketSystemId: null == ticketSystemId
          ? _value.ticketSystemId
          : ticketSystemId // ignore: cast_nullable_to_non_nullable
              as String,
      ticketTypeName: null == ticketTypeName
          ? _value.ticketTypeName
          : ticketTypeName // ignore: cast_nullable_to_non_nullable
              as String,
      gateNumber: null == gateNumber
          ? _value.gateNumber
          : gateNumber // ignore: cast_nullable_to_non_nullable
              as String,
      userData: null == userData
          ? _value.userData
          : userData // ignore: cast_nullable_to_non_nullable
              as TicketUserData,
    ));
  }
}

/// @nodoc

class _$TicketImpl implements _Ticket {
  const _$TicketImpl(
      {required this.id,
      required this.seatNumber,
      required this.ticketSystemId,
      required this.ticketTypeName,
      required this.gateNumber,
      required this.userData});

  @override
  final int id;
  @override
  final String seatNumber;
  @override
  final String ticketSystemId;
  @override
  final String ticketTypeName;
  @override
  final String gateNumber;
  @override
  final TicketUserData userData;

  @override
  String toString() {
    return 'Ticket(id: $id, seatNumber: $seatNumber, ticketSystemId: $ticketSystemId, ticketTypeName: $ticketTypeName, gateNumber: $gateNumber, userData: $userData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TicketImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.seatNumber, seatNumber) ||
                other.seatNumber == seatNumber) &&
            (identical(other.ticketSystemId, ticketSystemId) ||
                other.ticketSystemId == ticketSystemId) &&
            (identical(other.ticketTypeName, ticketTypeName) ||
                other.ticketTypeName == ticketTypeName) &&
            (identical(other.gateNumber, gateNumber) ||
                other.gateNumber == gateNumber) &&
            (identical(other.userData, userData) ||
                other.userData == userData));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, seatNumber, ticketSystemId,
      ticketTypeName, gateNumber, userData);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TicketImplCopyWith<_$TicketImpl> get copyWith =>
      __$$TicketImplCopyWithImpl<_$TicketImpl>(this, _$identity);
}

abstract class _Ticket implements Ticket {
  const factory _Ticket(
      {required final int id,
      required final String seatNumber,
      required final String ticketSystemId,
      required final String ticketTypeName,
      required final String gateNumber,
      required final TicketUserData userData}) = _$TicketImpl;

  @override
  int get id;
  @override
  String get seatNumber;
  @override
  String get ticketSystemId;
  @override
  String get ticketTypeName;
  @override
  String get gateNumber;
  @override
  TicketUserData get userData;
  @override
  @JsonKey(ignore: true)
  _$$TicketImplCopyWith<_$TicketImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$TicketUserData {
  String get firstName => throw _privateConstructorUsedError;
  String get lastName => throw _privateConstructorUsedError;
  String get pictureUrl => throw _privateConstructorUsedError;
  bool get isUser => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TicketUserDataCopyWith<TicketUserData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TicketUserDataCopyWith<$Res> {
  factory $TicketUserDataCopyWith(
          TicketUserData value, $Res Function(TicketUserData) then) =
      _$TicketUserDataCopyWithImpl<$Res, TicketUserData>;
  @useResult
  $Res call(
      {String firstName, String lastName, String pictureUrl, bool isUser});
}

/// @nodoc
class _$TicketUserDataCopyWithImpl<$Res, $Val extends TicketUserData>
    implements $TicketUserDataCopyWith<$Res> {
  _$TicketUserDataCopyWithImpl(this._value, this._then);

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
    Object? isUser = null,
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
      isUser: null == isUser
          ? _value.isUser
          : isUser // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TicketUserDataImplCopyWith<$Res>
    implements $TicketUserDataCopyWith<$Res> {
  factory _$$TicketUserDataImplCopyWith(_$TicketUserDataImpl value,
          $Res Function(_$TicketUserDataImpl) then) =
      __$$TicketUserDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String firstName, String lastName, String pictureUrl, bool isUser});
}

/// @nodoc
class __$$TicketUserDataImplCopyWithImpl<$Res>
    extends _$TicketUserDataCopyWithImpl<$Res, _$TicketUserDataImpl>
    implements _$$TicketUserDataImplCopyWith<$Res> {
  __$$TicketUserDataImplCopyWithImpl(
      _$TicketUserDataImpl _value, $Res Function(_$TicketUserDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = null,
    Object? lastName = null,
    Object? pictureUrl = null,
    Object? isUser = null,
  }) {
    return _then(_$TicketUserDataImpl(
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
      isUser: null == isUser
          ? _value.isUser
          : isUser // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$TicketUserDataImpl implements _TicketUserData {
  const _$TicketUserDataImpl(
      {required this.firstName,
      required this.lastName,
      required this.pictureUrl,
      required this.isUser});

  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final String pictureUrl;
  @override
  final bool isUser;

  @override
  String toString() {
    return 'TicketUserData(firstName: $firstName, lastName: $lastName, pictureUrl: $pictureUrl, isUser: $isUser)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TicketUserDataImpl &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.pictureUrl, pictureUrl) ||
                other.pictureUrl == pictureUrl) &&
            (identical(other.isUser, isUser) || other.isUser == isUser));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, firstName, lastName, pictureUrl, isUser);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TicketUserDataImplCopyWith<_$TicketUserDataImpl> get copyWith =>
      __$$TicketUserDataImplCopyWithImpl<_$TicketUserDataImpl>(
          this, _$identity);
}

abstract class _TicketUserData implements TicketUserData {
  const factory _TicketUserData(
      {required final String firstName,
      required final String lastName,
      required final String pictureUrl,
      required final bool isUser}) = _$TicketUserDataImpl;

  @override
  String get firstName;
  @override
  String get lastName;
  @override
  String get pictureUrl;
  @override
  bool get isUser;
  @override
  @JsonKey(ignore: true)
  _$$TicketUserDataImplCopyWith<_$TicketUserDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
