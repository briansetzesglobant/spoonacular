import 'package:spoonacular/src/core/util/numbers_constants.dart';

abstract class UseCaseInterface<T> {
  Future<T> call({
    int id = NumbersConstants.valueDefectMethodCall,
  });
}
