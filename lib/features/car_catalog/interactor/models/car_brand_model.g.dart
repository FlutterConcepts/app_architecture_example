// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car_brand_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CarBrandModelImpl _$$CarBrandModelImplFromJson(Map<String, dynamic> json) =>
    _$CarBrandModelImpl(
      code: ParseMapper.stringToInt(json['code'] as String),
      name: json['name'] as String,
    );

Map<String, dynamic> _$$CarBrandModelImplToJson(_$CarBrandModelImpl instance) =>
    <String, dynamic>{
      'code': ParseMapper.intToString(instance.code),
      'name': instance.name,
    };
