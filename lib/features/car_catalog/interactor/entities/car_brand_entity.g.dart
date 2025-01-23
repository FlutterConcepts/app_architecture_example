// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car_brand_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CarBrandEntityImpl _$$CarBrandEntityImplFromJson(Map<String, dynamic> json) =>
    _$CarBrandEntityImpl(
      code: ParseMapper.stringToInt(json['code'] as String),
      name: json['name'] as String,
    );

Map<String, dynamic> _$$CarBrandEntityImplToJson(
        _$CarBrandEntityImpl instance) =>
    <String, dynamic>{
      'code': ParseMapper.intToString(instance.code),
      'name': instance.name,
    };
