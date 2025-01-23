// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car_spec_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CarSpecModelImpl _$$CarSpecModelImplFromJson(Map<String, dynamic> json) =>
    _$CarSpecModelImpl(
      code: ParseMapper.stringToInt(json['code'] as String),
      name: json['name'] as String,
    );

Map<String, dynamic> _$$CarSpecModelImplToJson(_$CarSpecModelImpl instance) =>
    <String, dynamic>{
      'code': ParseMapper.intToString(instance.code),
      'name': instance.name,
    };
