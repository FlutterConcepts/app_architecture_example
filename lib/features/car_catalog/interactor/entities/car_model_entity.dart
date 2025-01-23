import 'package:app_architecture_example/app_architecture_example.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'car_model_entity.freezed.dart';
part 'car_model_entity.g.dart';

@freezed
class CarModelEntity with _$CarModelEntity {
  const factory CarModelEntity({
    @JsonKey(fromJson: TypeParser.stringToInt, toJson: TypeParser.intToString)
    required int code,
    required String name,
  }) = _CarModelEntity;

  factory CarModelEntity.fromJson(Map<String, dynamic> json) =>
      _$CarModelEntityFromJson(json);
}
