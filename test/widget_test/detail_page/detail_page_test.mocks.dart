// Mocks generated by Mockito 5.3.2 from annotations
// in spoonacular/test/widget_test/detail_page/detail_page_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i6;

import 'package:mockito/mockito.dart' as _i1;
import 'package:spoonacular/src/core/resource/data_state.dart' as _i3;
import 'package:spoonacular/src/data/datasource/local/get_storage_local.dart'
    as _i4;
import 'package:spoonacular/src/domain/entity/ingredients/ingredients_list_entity.dart'
    as _i8;
import 'package:spoonacular/src/domain/entity/similar_recipes/similar_recipes_entity.dart'
    as _i10;
import 'package:spoonacular/src/domain/repository/repository_interface.dart'
    as _i2;
import 'package:spoonacular/src/domain/use_case/implementation/ingredients_use_case.dart'
    as _i7;
import 'package:spoonacular/src/domain/use_case/implementation/nutrition_facts_use_case.dart'
    as _i5;
import 'package:spoonacular/src/domain/use_case/implementation/similar_recipes_use_case.dart'
    as _i9;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeRepositoryInterface_0 extends _i1.SmartFake
    implements _i2.RepositoryInterface {
  _FakeRepositoryInterface_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeDataState_1<T> extends _i1.SmartFake implements _i3.DataState<T> {
  _FakeDataState_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [GetStorageLocal].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetStorageLocal extends _i1.Mock implements _i4.GetStorageLocal {
  MockGetStorageLocal() {
    _i1.throwOnMissingStub(this);
  }

  @override
  void writeGetStorageLocal(Map<String, String>? favoritesRecipes) =>
      super.noSuchMethod(
        Invocation.method(
          #writeGetStorageLocal,
          [favoritesRecipes],
        ),
        returnValueForMissingStub: null,
      );
  @override
  Map<String, String> readGetStorageLocal() => (super.noSuchMethod(
        Invocation.method(
          #readGetStorageLocal,
          [],
        ),
        returnValue: <String, String>{},
      ) as Map<String, String>);
}

/// A class which mocks [NutritionFactsUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockNutritionFactsUseCase extends _i1.Mock
    implements _i5.NutritionFactsUseCase {
  MockNutritionFactsUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.RepositoryInterface get nutritionFactsRepository => (super.noSuchMethod(
        Invocation.getter(#nutritionFactsRepository),
        returnValue: _FakeRepositoryInterface_0(
          this,
          Invocation.getter(#nutritionFactsRepository),
        ),
      ) as _i2.RepositoryInterface);
  @override
  set nutritionFactsRepository(
          _i2.RepositoryInterface? _nutritionFactsRepository) =>
      super.noSuchMethod(
        Invocation.setter(
          #nutritionFactsRepository,
          _nutritionFactsRepository,
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i6.Future<_i3.DataState<String>> call({int? id = 0}) => (super.noSuchMethod(
        Invocation.method(
          #call,
          [],
          {#id: id},
        ),
        returnValue:
            _i6.Future<_i3.DataState<String>>.value(_FakeDataState_1<String>(
          this,
          Invocation.method(
            #call,
            [],
            {#id: id},
          ),
        )),
      ) as _i6.Future<_i3.DataState<String>>);
}

/// A class which mocks [IngredientsUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockIngredientsUseCase extends _i1.Mock
    implements _i7.IngredientsUseCase {
  MockIngredientsUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.RepositoryInterface get ingredientsRepository => (super.noSuchMethod(
        Invocation.getter(#ingredientsRepository),
        returnValue: _FakeRepositoryInterface_0(
          this,
          Invocation.getter(#ingredientsRepository),
        ),
      ) as _i2.RepositoryInterface);
  @override
  set ingredientsRepository(_i2.RepositoryInterface? _ingredientsRepository) =>
      super.noSuchMethod(
        Invocation.setter(
          #ingredientsRepository,
          _ingredientsRepository,
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i6.Future<_i3.DataState<_i8.IngredientsListEntity>> call({int? id = 0}) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [],
          {#id: id},
        ),
        returnValue: _i6.Future<_i3.DataState<_i8.IngredientsListEntity>>.value(
            _FakeDataState_1<_i8.IngredientsListEntity>(
          this,
          Invocation.method(
            #call,
            [],
            {#id: id},
          ),
        )),
      ) as _i6.Future<_i3.DataState<_i8.IngredientsListEntity>>);
}

/// A class which mocks [SimilarRecipesUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockSimilarRecipesUseCase extends _i1.Mock
    implements _i9.SimilarRecipesUseCase {
  MockSimilarRecipesUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.RepositoryInterface get similarRecipesRepository => (super.noSuchMethod(
        Invocation.getter(#similarRecipesRepository),
        returnValue: _FakeRepositoryInterface_0(
          this,
          Invocation.getter(#similarRecipesRepository),
        ),
      ) as _i2.RepositoryInterface);
  @override
  set similarRecipesRepository(
          _i2.RepositoryInterface? _similarRecipesRepository) =>
      super.noSuchMethod(
        Invocation.setter(
          #similarRecipesRepository,
          _similarRecipesRepository,
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i6.Future<_i3.DataState<List<_i10.SimilarRecipesEntity>>> call(
          {int? id = 0}) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [],
          {#id: id},
        ),
        returnValue:
            _i6.Future<_i3.DataState<List<_i10.SimilarRecipesEntity>>>.value(
                _FakeDataState_1<List<_i10.SimilarRecipesEntity>>(
          this,
          Invocation.method(
            #call,
            [],
            {#id: id},
          ),
        )),
      ) as _i6.Future<_i3.DataState<List<_i10.SimilarRecipesEntity>>>);
}
