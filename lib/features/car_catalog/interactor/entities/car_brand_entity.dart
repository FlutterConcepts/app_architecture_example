import 'package:app_architecture_example/app_architecture_example.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'car_brand_entity.freezed.dart';
part 'car_brand_entity.g.dart';

@freezed
class CarBrandEntity with _$CarBrandEntity {
  const factory CarBrandEntity({
    @JsonKey(fromJson: TypeParser.stringToInt, toJson: TypeParser.intToString)
    required int code,
    required String name,
  }) = _CarBrandEntity;

  factory CarBrandEntity.fromJson(Map<String, dynamic> json) =>
      _$CarBrandEntityFromJson(json);
}
