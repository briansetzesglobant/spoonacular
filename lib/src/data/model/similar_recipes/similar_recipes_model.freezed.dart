// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'similar_recipes_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SimilarRecipesModel _$SimilarRecipesModelFromJson(Map<String, dynamic> json) {
  return _SimilarRecipesModel.fromJson(json);
}

/// @nodoc
mixin _$SimilarRecipesModel {
  String get imageType => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SimilarRecipesModelCopyWith<SimilarRecipesModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SimilarRecipesModelCopyWith<$Res> {
  factory $SimilarRecipesModelCopyWith(
          SimilarRecipesModel value, $Res Function(SimilarRecipesModel) then) =
      _$SimilarRecipesModelCopyWithImpl<$Res, SimilarRecipesModel>;
  @useResult
  $Res call({String imageType, String title, int id});
}

/// @nodoc
class _$SimilarRecipesModelCopyWithImpl<$Res, $Val extends SimilarRecipesModel>
    implements $SimilarRecipesModelCopyWith<$Res> {
  _$SimilarRecipesModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imageType = null,
    Object? title = null,
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      imageType: null == imageType
          ? _value.imageType
          : imageType // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SimilarRecipesModelCopyWith<$Res>
    implements $SimilarRecipesModelCopyWith<$Res> {
  factory _$$_SimilarRecipesModelCopyWith(_$_SimilarRecipesModel value,
          $Res Function(_$_SimilarRecipesModel) then) =
      __$$_SimilarRecipesModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String imageType, String title, int id});
}

/// @nodoc
class __$$_SimilarRecipesModelCopyWithImpl<$Res>
    extends _$SimilarRecipesModelCopyWithImpl<$Res, _$_SimilarRecipesModel>
    implements _$$_SimilarRecipesModelCopyWith<$Res> {
  __$$_SimilarRecipesModelCopyWithImpl(_$_SimilarRecipesModel _value,
      $Res Function(_$_SimilarRecipesModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imageType = null,
    Object? title = null,
    Object? id = null,
  }) {
    return _then(_$_SimilarRecipesModel(
      imageType: null == imageType
          ? _value.imageType
          : imageType // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SimilarRecipesModel implements _SimilarRecipesModel {
  const _$_SimilarRecipesModel(
      {required this.imageType, required this.title, required this.id});

  factory _$_SimilarRecipesModel.fromJson(Map<String, dynamic> json) =>
      _$$_SimilarRecipesModelFromJson(json);

  @override
  final String imageType;
  @override
  final String title;
  @override
  final int id;

  @override
  String toString() {
    return 'SimilarRecipesModel(imageType: $imageType, title: $title, id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SimilarRecipesModel &&
            (identical(other.imageType, imageType) ||
                other.imageType == imageType) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, imageType, title, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SimilarRecipesModelCopyWith<_$_SimilarRecipesModel> get copyWith =>
      __$$_SimilarRecipesModelCopyWithImpl<_$_SimilarRecipesModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SimilarRecipesModelToJson(
      this,
    );
  }
}

abstract class _SimilarRecipesModel implements SimilarRecipesModel {
  const factory _SimilarRecipesModel(
      {required final String imageType,
      required final String title,
      required final int id}) = _$_SimilarRecipesModel;

  factory _SimilarRecipesModel.fromJson(Map<String, dynamic> json) =
      _$_SimilarRecipesModel.fromJson;

  @override
  String get imageType;
  @override
  String get title;
  @override
  int get id;
  @override
  @JsonKey(ignore: true)
  _$$_SimilarRecipesModelCopyWith<_$_SimilarRecipesModel> get copyWith =>
      throw _privateConstructorUsedError;
}
