// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car_model_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CarModelEntityImpl _$$CarModelEntityImplFromJson(Map<String, dynamic> json) =>
    _$CarModelEntityImpl(
      code: TypeParser.stringToInt(json['code'] as String),
      name: json['name'] as String,
    );

Map<String, dynamic> _$$CarModelEntityImplToJson(
        _$CarModelEntityImpl instance) =>
    <String, dynamic>{
      'code': TypeParser.intToString(instance.code),
      'name': instance.name,
    };
