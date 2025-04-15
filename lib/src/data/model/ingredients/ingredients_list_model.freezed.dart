// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ingredients_list_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

IngredientsListModel _$IngredientsListModelFromJson(Map<String, dynamic> json) {
  return _IngredientsListModel.fromJson(json);
}

/// @nodoc
mixin _$IngredientsListModel {
  List<IngredientModel> get ingredients => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IngredientsListModelCopyWith<IngredientsListModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IngredientsListModelCopyWith<$Res> {
  factory $IngredientsListModelCopyWith(IngredientsListModel value,
          $Res Function(IngredientsListModel) then) =
      _$IngredientsListModelCopyWithImpl<$Res, IngredientsListModel>;
  @useResult
  $Res call({List<IngredientModel> ingredients});
}

/// @nodoc
class _$IngredientsListModelCopyWithImpl<$Res,
        $Val extends IngredientsListModel>
    implements $IngredientsListModelCopyWith<$Res> {
  _$IngredientsListModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ingredients = null,
  }) {
    return _then(_value.copyWith(
      ingredients: null == ingredients
          ? _value.ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as List<IngredientModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_IngredientsListModelCopyWith<$Res>
    implements $IngredientsListModelCopyWith<$Res> {
  factory _$$_IngredientsListModelCopyWith(_$_IngredientsListModel value,
          $Res Function(_$_IngredientsListModel) then) =
      __$$_IngredientsListModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<IngredientModel> ingredients});
}

/// @nodoc
class __$$_IngredientsListModelCopyWithImpl<$Res>
    extends _$IngredientsListModelCopyWithImpl<$Res, _$_IngredientsListModel>
    implements _$$_IngredientsListModelCopyWith<$Res> {
  __$$_IngredientsListModelCopyWithImpl(_$_IngredientsListModel _value,
      $Res Function(_$_IngredientsListModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ingredients = null,
  }) {
    return _then(_$_IngredientsListModel(
      ingredients: null == ingredients
          ? _value._ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as List<IngredientModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_IngredientsListModel implements _IngredientsListModel {
  const _$_IngredientsListModel(
      {required final List<IngredientModel> ingredients})
      : _ingredients = ingredients;

  factory _$_IngredientsListModel.fromJson(Map<String, dynamic> json) =>
      _$$_IngredientsListModelFromJson(json);

  final List<IngredientModel> _ingredients;
  @override
  List<IngredientModel> get ingredients {
    if (_ingredients is EqualUnmodifiableListView) return _ingredients;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_ingredients);
  }

  @override
  String toString() {
    return 'IngredientsListModel(ingredients: $ingredients)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_IngredientsListModel &&
            const DeepCollectionEquality()
                .equals(other._ingredients, _ingredients));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_ingredients));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_IngredientsListModelCopyWith<_$_IngredientsListModel> get copyWith =>
      __$$_IngredientsListModelCopyWithImpl<_$_IngredientsListModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_IngredientsListModelToJson(
      this,
    );
  }
}

abstract class _IngredientsListModel implements IngredientsListModel {
  const factory _IngredientsListModel(
          {required final List<IngredientModel> ingredients}) =
      _$_IngredientsListModel;

  factory _IngredientsListModel.fromJson(Map<String, dynamic> json) =
      _$_IngredientsListModel.fromJson;

  @override
  List<IngredientModel> get ingredients;
  @override
  @JsonKey(ignore: true)
  _$$_IngredientsListModelCopyWith<_$_IngredientsListModel> get copyWith =>
      throw _privateConstructorUsedError;
}
