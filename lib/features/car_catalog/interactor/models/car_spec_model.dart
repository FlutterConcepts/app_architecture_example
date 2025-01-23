import 'package:app_architecture_example/app_architecture_example.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'car_spec_model.freezed.dart';
part 'car_spec_model.g.dart';

@freezed
class CarSpecModel with _$CarSpecModel {
  const factory CarSpecModel({
    @JsonKey(fromJson: ParseMapper.stringToInt, toJson: ParseMapper.intToString)
    required int code,
    required String name,
  }) = _CarSpecModel;

  factory CarSpecModel.fromJson(Map<String, dynamic> json) =>
      _$CarSpecModelFromJson(json);
}
