// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recipes_list_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RecipesListModel _$RecipesListModelFromJson(Map<String, dynamic> json) {
  return _RecipesListModel.fromJson(json);
}

/// @nodoc
mixin _$RecipesListModel {
  List<RecipeModel> get recipes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RecipesListModelCopyWith<RecipesListModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecipesListModelCopyWith<$Res> {
  factory $RecipesListModelCopyWith(
          RecipesListModel value, $Res Function(RecipesListModel) then) =
      _$RecipesListModelCopyWithImpl<$Res, RecipesListModel>;
  @useResult
  $Res call({List<RecipeModel> recipes});
}

/// @nodoc
class _$RecipesListModelCopyWithImpl<$Res, $Val extends RecipesListModel>
    implements $RecipesListModelCopyWith<$Res> {
  _$RecipesListModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recipes = null,
  }) {
    return _then(_value.copyWith(
      recipes: null == recipes
          ? _value.recipes
          : recipes // ignore: cast_nullable_to_non_nullable
              as List<RecipeModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RecipesListModelCopyWith<$Res>
    implements $RecipesListModelCopyWith<$Res> {
  factory _$$_RecipesListModelCopyWith(
          _$_RecipesListModel value, $Res Function(_$_RecipesListModel) then) =
      __$$_RecipesListModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<RecipeModel> recipes});
}

/// @nodoc
class __$$_RecipesListModelCopyWithImpl<$Res>
    extends _$RecipesListModelCopyWithImpl<$Res, _$_RecipesListModel>
    implements _$$_RecipesListModelCopyWith<$Res> {
  __$$_RecipesListModelCopyWithImpl(
      _$_RecipesListModel _value, $Res Function(_$_RecipesListModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recipes = null,
  }) {
    return _then(_$_RecipesListModel(
      recipes: null == recipes
          ? _value._recipes
          : recipes // ignore: cast_nullable_to_non_nullable
              as List<RecipeModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RecipesListModel implements _RecipesListModel {
  const _$_RecipesListModel({required final List<RecipeModel> recipes})
      : _recipes = recipes;

  factory _$_RecipesListModel.fromJson(Map<String, dynamic> json) =>
      _$$_RecipesListModelFromJson(json);

  final List<RecipeModel> _recipes;
  @override
  List<RecipeModel> get recipes {
    if (_recipes is EqualUnmodifiableListView) return _recipes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recipes);
  }

  @override
  String toString() {
    return 'RecipesListModel(recipes: $recipes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RecipesListModel &&
            const DeepCollectionEquality().equals(other._recipes, _recipes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_recipes));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RecipesListModelCopyWith<_$_RecipesListModel> get copyWith =>
      __$$_RecipesListModelCopyWithImpl<_$_RecipesListModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RecipesListModelToJson(
      this,
    );
  }
}

abstract class _RecipesListModel implements RecipesListModel {
  const factory _RecipesListModel({required final List<RecipeModel> recipes}) =
      _$_RecipesListModel;

  factory _RecipesListModel.fromJson(Map<String, dynamic> json) =
      _$_RecipesListModel.fromJson;

  @override
  List<RecipeModel> get recipes;
  @override
  @JsonKey(ignore: true)
  _$$_RecipesListModelCopyWith<_$_RecipesListModel> get copyWith =>
      throw _privateConstructorUsedError;
}
