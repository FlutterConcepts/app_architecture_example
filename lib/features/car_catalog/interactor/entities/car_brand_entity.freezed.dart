// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'car_brand_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CarBrandEntity _$CarBrandEntityFromJson(Map<String, dynamic> json) {
  return _CarBrandEntity.fromJson(json);
}

/// @nodoc
mixin _$CarBrandEntity {
  @JsonKey(fromJson: ParseMapper.stringToInt, toJson: ParseMapper.intToString)
  int get code => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  /// Serializes this CarBrandEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CarBrandEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CarBrandEntityCopyWith<CarBrandEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CarBrandEntityCopyWith<$Res> {
  factory $CarBrandEntityCopyWith(
          CarBrandEntity value, $Res Function(CarBrandEntity) then) =
      _$CarBrandEntityCopyWithImpl<$Res, CarBrandEntity>;
  @useResult
  $Res call(
      {@JsonKey(
          fromJson: ParseMapper.stringToInt, toJson: ParseMapper.intToString)
      int code,
      String name});
}

/// @nodoc
class _$CarBrandEntityCopyWithImpl<$Res, $Val extends CarBrandEntity>
    implements $CarBrandEntityCopyWith<$Res> {
  _$CarBrandEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CarBrandEntity
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
abstract class _$$CarBrandEntityImplCopyWith<$Res>
    implements $CarBrandEntityCopyWith<$Res> {
  factory _$$CarBrandEntityImplCopyWith(_$CarBrandEntityImpl value,
          $Res Function(_$CarBrandEntityImpl) then) =
      __$$CarBrandEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(
          fromJson: ParseMapper.stringToInt, toJson: ParseMapper.intToString)
      int code,
      String name});
}

/// @nodoc
class __$$CarBrandEntityImplCopyWithImpl<$Res>
    extends _$CarBrandEntityCopyWithImpl<$Res, _$CarBrandEntityImpl>
    implements _$$CarBrandEntityImplCopyWith<$Res> {
  __$$CarBrandEntityImplCopyWithImpl(
      _$CarBrandEntityImpl _value, $Res Function(_$CarBrandEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of CarBrandEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? name = null,
  }) {
    return _then(_$CarBrandEntityImpl(
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
class _$CarBrandEntityImpl implements _CarBrandEntity {
  const _$CarBrandEntityImpl(
      {@JsonKey(
          fromJson: ParseMapper.stringToInt, toJson: ParseMapper.intToString)
      required this.code,
      required this.name});

  factory _$CarBrandEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$CarBrandEntityImplFromJson(json);

  @override
  @JsonKey(fromJson: ParseMapper.stringToInt, toJson: ParseMapper.intToString)
  final int code;
  @override
  final String name;

  @override
  String toString() {
    return 'CarBrandEntity(code: $code, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CarBrandEntityImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, code, name);

  /// Create a copy of CarBrandEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CarBrandEntityImplCopyWith<_$CarBrandEntityImpl> get copyWith =>
      __$$CarBrandEntityImplCopyWithImpl<_$CarBrandEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CarBrandEntityImplToJson(
      this,
    );
  }
}

abstract class _CarBrandEntity implements CarBrandEntity {
  const factory _CarBrandEntity(
      {@JsonKey(
          fromJson: ParseMapper.stringToInt, toJson: ParseMapper.intToString)
      required final int code,
      required final String name}) = _$CarBrandEntityImpl;

  factory _CarBrandEntity.fromJson(Map<String, dynamic> json) =
      _$CarBrandEntityImpl.fromJson;

  @override
  @JsonKey(fromJson: ParseMapper.stringToInt, toJson: ParseMapper.intToString)
  int get code;
  @override
  String get name;

  /// Create a copy of CarBrandEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CarBrandEntityImplCopyWith<_$CarBrandEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
