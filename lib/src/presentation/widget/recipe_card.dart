import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:lottie/lottie.dart';
import 'package:spoonacular/src/core/parameter/parameter_object.dart';
import 'package:spoonacular/src/core/util/assets_constants.dart';
import 'package:spoonacular/src/core/util/numbers_constants.dart';
import 'package:spoonacular/src/core/util/routes_constants.dart';
import 'package:spoonacular/src/core/util/strings_constants.dart';
import 'package:spoonacular/src/domain/entity/recipes/recipe_entity.dart';

class RecipeCard extends StatelessWidget {
  const RecipeCard({
    required this.recipe,
  });

  static const String textTitle = '"';
  static const String textReadyInMinutes = 'min';
  static const String textSummary = 'SUMMARY';
  static const String textTags = 'TAGS';
  static const String textVegetarian = 'VEGETARIAN';
  static const String textVegan = 'VEGAN';
  static const String textGlutenFree = 'GLUTEN FREE';
  static const String textDairyFree = 'DAIRY FREE';
  static const String textVeryHealthy = 'VERY HEALTHY';
  static const String textCheap = 'CHEAP';
  static const String textVeryPopular = 'VERY POPULAR';
  static const String textSustainable = 'SUSTAINABLE';
  static const String textLowFodmap = 'LOW FODMAP';
  static const double imageClockIconHeight = 30.0;
  static const double textFontSize = 13.0;
  static const double sizeBoxHeight = 165.0;
  static const double sizeBoxHeightTextSummary = 250.0;
  static const double containerWidth = 480.0;
  static const double containerBorderRadiusEllipticalX = 60.0;
  static const double containerBorderRadiusEllipticalY = 25.0;
  static const double textsTagsRunSpacing = 5.0;
  static const double textsTagsSpacing = 8.0;
  static const double sizeBoxHeightTextsTags = 45.0;

  final RecipeEntity recipe;

  List<Widget> _getTags(RecipeEntity recipe) {
    return [
      _getTextWithStyle(
        recipe.vegetarian,
        textVegetarian,
      ),
      _getTextWithStyle(
        recipe.vegan,
        textVegan,
      ),
      _getTextWithStyle(
        recipe.glutenFree,
        textGlutenFree,
      ),
      _getTextWithStyle(
        recipe.dairyFree,
        textDairyFree,
      ),
      _getTextWithStyle(
        recipe.veryHealthy,
        textVeryHealthy,
      ),
      _getTextWithStyle(
        recipe.cheap,
        textCheap,
      ),
      _getTextWithStyle(
        recipe.veryPopular,
        textVeryPopular,
      ),
      _getTextWithStyle(
        recipe.sustainable,
        textSustainable,
      ),
      _getTextWithStyle(
        recipe.lowFodmap,
        textLowFodmap,
      ),
    ];
  }

  Widget _getTextWithStyle(bool tag, String text) {
    return Text(
      text,
      style: TextStyle(
        color: tag ? Colors.green : Colors.grey,
        fontSize: textFontSize,
        fontWeight: FontWeight.w700,
        fontFamily: StringsConstants.textFontFamily,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushReplacementNamed(
          RoutesConstants.detailRoute,
          arguments: ParameterDetailPage(
            id: recipe.id,
            title: recipe.title,
            aggregateLikes: recipe.aggregateLikes,
            instructions: recipe.instructions,
            image: recipe.image,
          ),
        );
      },
      child: Container(
        width: containerWidth,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.elliptical(
              containerBorderRadiusEllipticalX,
              containerBorderRadiusEllipticalY,
            ),
            bottomRight: Radius.elliptical(
              containerBorderRadiusEllipticalX,
              containerBorderRadiusEllipticalY,
            ),
          ),
          border: Border.all(),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: sizeBoxHeight,
              child: Stack(
                children: [
                  CachedNetworkImage(
                    imageUrl: recipe.image,
                    imageBuilder: (context, imageProvider) => Container(
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
                  Padding(
                    padding: const EdgeInsets.only(
                      left: NumbersConstants.paddingXXXSmall,
                      top: NumbersConstants.paddingXXSmall,
                    ),
                    child: ColoredBox(
                      color: Colors.white,
                      child: Text(
                        '$textTitle${recipe.title}$textTitle',
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontFamily: StringsConstants.textFontFamily,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: NumbersConstants.paddingXXSmall,
                right: NumbersConstants.paddingXXSmall,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Image(
                    image: AssetImage(
                      AssetsConstants.imageClockIcon,
                    ),
                    height: imageClockIconHeight,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: NumbersConstants.paddingXXXSmall,
                      top: NumbersConstants.paddingXXSmall,
                    ),
                    child: Text(
                      '${recipe.readyInMinutes} $textReadyInMinutes',
                      style: const TextStyle(
                        fontSize: textFontSize,
                        fontWeight: FontWeight.w700,
                        fontFamily: StringsConstants.textFontFamily,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                left: NumbersConstants.paddingXXXSmall,
                top: NumbersConstants.paddingXXSmall,
              ),
              child: Text(
                textSummary,
                style: TextStyle(
                  fontSize: textFontSize,
                  fontWeight: FontWeight.w700,
                  fontFamily: StringsConstants.textFontFamily,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: NumbersConstants.paddingXXXSmall,
                top: NumbersConstants.paddingXXSmall,
                right: NumbersConstants.paddingXXSmall,
              ),
              child: SizedBox(
                height: sizeBoxHeightTextSummary,
                child: SingleChildScrollView(
                  child: Html(
                    data: recipe.summary,
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                left: NumbersConstants.paddingXXXSmall,
                top: NumbersConstants.paddingXXSmall,
              ),
              child: Text(
                textTags,
                style: TextStyle(
                  fontSize: textFontSize,
                  fontWeight: FontWeight.w700,
                  fontFamily: StringsConstants.textFontFamily,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: NumbersConstants.paddingXXXSmall,
                top: NumbersConstants.paddingXXSmall,
                right: NumbersConstants.paddingXXSmall,
                bottom: NumbersConstants.paddingXXXSmall,
              ),
              child: SizedBox(
                height: sizeBoxHeightTextsTags,
                child: SingleChildScrollView(
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    runSpacing: textsTagsRunSpacing,
                    spacing: textsTagsSpacing,
                    children: _getTags(recipe),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
