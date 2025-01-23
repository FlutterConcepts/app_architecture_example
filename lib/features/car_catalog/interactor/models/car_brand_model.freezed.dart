// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'car_brand_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CarBrandModel _$CarBrandModelFromJson(Map<String, dynamic> json) {
  return _CarBrandModel.fromJson(json);
}

/// @nodoc
mixin _$CarBrandModel {
  @JsonKey(fromJson: ParseMapper.stringToInt, toJson: ParseMapper.intToString)
  int get code => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  /// Serializes this CarBrandModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CarBrandModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CarBrandModelCopyWith<CarBrandModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CarBrandModelCopyWith<$Res> {
  factory $CarBrandModelCopyWith(
          CarBrandModel value, $Res Function(CarBrandModel) then) =
      _$CarBrandModelCopyWithImpl<$Res, CarBrandModel>;
  @useResult
  $Res call(
      {@JsonKey(
          fromJson: ParseMapper.stringToInt, toJson: ParseMapper.intToString)
      int code,
      String name});
}

/// @nodoc
class _$CarBrandModelCopyWithImpl<$Res, $Val extends CarBrandModel>
    implements $CarBrandModelCopyWith<$Res> {
  _$CarBrandModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CarBrandModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CarBrandModelImplCopyWith<$Res>
    implements $CarBrandModelCopyWith<$Res> {
  factory _$$CarBrandModelImplCopyWith(
          _$CarBrandModelImpl value, $Res Function(_$CarBrandModelImpl) then) =
      __$$CarBrandModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(
          fromJson: ParseMapper.stringToInt, toJson: ParseMapper.intToString)
      int code,
      String name});
}

/// @nodoc
class __$$CarBrandModelImplCopyWithImpl<$Res>
    extends _$CarBrandModelCopyWithImpl<$Res, _$CarBrandModelImpl>
    implements _$$CarBrandModelImplCopyWith<$Res> {
  __$$CarBrandModelImplCopyWithImpl(
      _$CarBrandModelImpl _value, $Res Function(_$CarBrandModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of CarBrandModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? name = null,
  }) {
    return _then(_$CarBrandModelImpl(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CarBrandModelImpl implements _CarBrandModel {
  const _$CarBrandModelImpl(
      {@JsonKey(
          fromJson: ParseMapper.stringToInt, toJson: ParseMapper.intToString)
      required this.code,
      required this.name});

  factory _$CarBrandModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CarBrandModelImplFromJson(json);

  @override
  @JsonKey(fromJson: ParseMapper.stringToInt, toJson: ParseMapper.intToString)
  final int code;
  @override
  final String name;

  @override
  String toString() {
    return 'CarBrandModel(code: $code, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CarBrandModelImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, code, name);

  /// Create a copy of CarBrandModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CarBrandModelImplCopyWith<_$CarBrandModelImpl> get copyWith =>
      __$$CarBrandModelImplCopyWithImpl<_$CarBrandModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CarBrandModelImplToJson(
      this,
    );
  }
}

abstract class _CarBrandModel implements CarBrandModel {
  const factory _CarBrandModel(
      {@JsonKey(
          fromJson: ParseMapper.stringToInt, toJson: ParseMapper.intToString)
      required final int code,
      required final String name}) = _$CarBrandModelImpl;

  factory _CarBrandModel.fromJson(Map<String, dynamic> json) =
      _$CarBrandModelImpl.fromJson;

  @override
  @JsonKey(fromJson: ParseMapper.stringToInt, toJson: ParseMapper.intToString)
  int get code;
  @override
  String get name;

  /// Create a copy of CarBrandModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CarBrandModelImplCopyWith<_$CarBrandModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
