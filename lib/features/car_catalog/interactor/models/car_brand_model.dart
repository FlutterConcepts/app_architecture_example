import 'package:app_architecture_example/app_architecture_example.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'car_brand_model.freezed.dart';
part 'car_brand_model.g.dart';

@freezed
class CarBrandModel with _$CarBrandModel {
  const factory CarBrandModel({
    @JsonKey(fromJson: ParseMapper.stringToInt, toJson: ParseMapper.intToString)
    required int code,
    required String name,
  }) = _CarBrandModel;

  factory CarBrandModel.fromJson(Map<String, dynamic> json) =>
      _$CarBrandModelFromJson(json);
}
