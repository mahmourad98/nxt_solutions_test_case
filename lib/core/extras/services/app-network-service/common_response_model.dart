// ignore_for_file: deprecated_member_use_from_same_package,type=lint
// ignore_for_file: implementation_imports
// ignore_for_file: depend_on_referenced_packages
import 'dart:io';

import 'package:built_value/built_value.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/src/json_object_serializer.dart';
import 'package:built_value/standard_json_plugin.dart';

part 'common_response_model.g.dart';

abstract class CommonResponse implements Built<CommonResponse, CommonResponseBuilder> {
  CommonResponse._();

  factory CommonResponse([void Function(CommonResponseBuilder)? updates]) = _$CommonResponse;

  @BuiltValueField(wireName: 'code',)
  int? get code;

  @BuiltValueField(wireName: 'status',)
  bool? get status;

  @BuiltValueField(wireName: 'message',)
  String? get message;

  @BuiltValueField(wireName: 'data',)
  JsonObject? get data;

  @BuiltValueField(wireName: 'errors',)
  JsonObject? get errors;

  bool get isSuccessful => code == HttpStatus.ok;

  static Serializer<CommonResponse> get serializer => _$commonResponseSerializer;
  static Serializers get serializers {
    return (Serializers().toBuilder()
      ..add(CommonResponse.serializer)
      ..addPlugin(StandardJsonPlugin())
      ..add(JsonObjectSerializer())).build();
  }

  static CommonResponse fromJson(Object json,) {
    return serializers.deserializeWith<CommonResponse>(serializer, json,) ?? CommonResponse();
  }

  static Object toJson(CommonResponse instance,) {
    return serializers.serializeWith(serializer, instance,) ?? CommonResponse();
  }
}



