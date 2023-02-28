import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:spoonacular/src/core/util/api_service_constants.dart';
import 'package:spoonacular/src/core/util/assets_constants.dart';
import 'package:spoonacular/src/core/util/numbers_constants.dart';
import 'package:spoonacular/src/core/util/strings_constants.dart';
import 'package:spoonacular/src/domain/entity/ingredients/ingredient_entity.dart';

class IngredientsCard extends StatelessWidget {
  const IngredientsCard({
    required this.ingredients,
  });

  static const String textIngredients = 'INGREDIENTS';
  static const double textFontSize = 17.0;
  static const double sizeBoxImageUrlFirst = 210.0;
  static const double sizeBoxImageUrlSecond = 140.0;
  static const double sizeBoxImageUrlThird = 100.0;
  static const double sizeBoxTextNameFirst = 15.0;
  static const double sizeBoxTextNameSecond = 13.0;
  static const double sizeBoxTextNameThird = 9.0;
  static const double containerHeightGridView = 600.0;
  static const int gridViewCrossAxisCount = 2;
  static const double constraintsMaxWidthFirst = 550.0;
  static const double constraintsMaxWidthSecond = 400.0;

  final List<IngredientEntity> ingredients;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(
                top: NumbersConstants.paddingXXXSmall,
                bottom: NumbersConstants.paddingXSmall,
              ),
              child: Text(
                textIngredients,
                style: TextStyle(
                  fontSize: textFontSize,
                  fontWeight: FontWeight.w900,
                  fontFamily: StringsConstants.textFontFamily,
                ),
              ),
            ),
            DecoratedBox(
              decoration: BoxDecoration(
                border: Border.all(
                  width: NumbersConstants.borderWith,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: NumbersConstants.paddingMedium,
                  horizontal: NumbersConstants.paddingXXXSmall,
                ),
                child: SizedBox(
                  height: containerHeightGridView,
                  child: GridView.builder(
                    itemCount: ingredients.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: gridViewCrossAxisCount,
                    ),
                    itemBuilder: (
                      BuildContext context,
                      int index,
                    ) {
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              bottom: NumbersConstants.paddingXXXSmall,
                            ),
                            child: SizedBox(
                              width: constraints.maxWidth >
                                      constraintsMaxWidthFirst
                                  ? sizeBoxImageUrlFirst
                                  : (constraints.maxWidth >
                                          constraintsMaxWidthSecond
                                      ? sizeBoxImageUrlSecond
                                      : sizeBoxImageUrlThird),
                              height: constraints.maxWidth >
                                      constraintsMaxWidthFirst
                                  ? sizeBoxImageUrlFirst
                                  : (constraints.maxWidth >
                                          constraintsMaxWidthSecond
                                      ? sizeBoxImageUrlSecond
                                      : sizeBoxImageUrlThird),
                              child: CachedNetworkImage(
                                imageUrl:
                                    '${ApiServiceConstants.urlBaseImageIngredients}${ingredients[index].image}',
                                imageBuilder: (context, imageProvider) =>
                                    DecoratedBox(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: imageProvider,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                placeholder: (
                                  context,
                                  url,
                                ) =>
                                    Center(
                                  child: SizedBox(
                                    child: Lottie.asset(
                                      AssetsConstants.lottieLoadingUtensils,
                                    ),
                                  ),
                                ),
                                errorWidget: (
                                  context,
                                  url,
                                  error,
                                ) =>
                                    Center(
                                  child: Container(
                                    color: Colors.grey,
                                    height: MediaQuery.of(context).size.height,
                                    width: MediaQuery.of(context).size.width,
                                    child: Lottie.asset(
                                      AssetsConstants.lottieOopsErrorNew,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Text(
                            ingredients[index].name.toUpperCase(),
                            style: TextStyle(
                              fontSize: constraints.maxWidth >
                                      constraintsMaxWidthFirst
                                  ? sizeBoxTextNameFirst
                                  : (constraints.maxWidth >
                                          constraintsMaxWidthSecond
                                      ? sizeBoxTextNameSecond
                                      : sizeBoxTextNameThird),
                              fontWeight: FontWeight.w900,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
