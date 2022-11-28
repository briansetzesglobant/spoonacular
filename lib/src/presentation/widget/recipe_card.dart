import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:lottie/lottie.dart';
import 'package:spoonacular/src/core/util/assets_constants.dart';
import 'package:spoonacular/src/core/util/numbers_constants.dart';
import 'package:spoonacular/src/core/util/strings_constants.dart';
import 'package:spoonacular/src/domain/entity/recipe_entity.dart';

class RecipeCard extends StatelessWidget {
  const RecipeCard(this.recipe);

  static const String recipeCardTextTitle = '"';
  static const String recipeCardTextReadyInMinutes = 'min';
  static const String recipeCardTextSummary = 'SUMMARY';
  static const String recipeCardTextTags = 'TAGS';
  static const String recipeCardTextVegetarian = 'VEGETARIAN';
  static const String recipeCardTextVegan = 'VEGAN';
  static const String recipeCardTextGlutenFree = 'GLUTEN FREE';
  static const String recipeCardTextDairyFree = 'DAIRY FREE';
  static const String recipeCardTextVeryHealthy = 'VERY HEALTHY';
  static const String recipeCardTextCheap = 'CHEAP';
  static const String recipeCardTextVeryPopular = 'VERY POPULAR';
  static const String recipeCardTextSustainable = 'SUSTAINABLE';
  static const String recipeCardTextLowFodmap = 'LOW FODMAP';
  static const double recipeCardContainerWidthColumn = 480.0;
  static const double recipeCardContainerBorderRadiusEllipticalX = 60.0;
  static const double recipeCardContainerBorderRadiusEllipticalY = 25.0;
  static const double recipeCardSizeBoxHeight = 165.0;
  static const double recipeCardImageClockIconHeight = 30.0;
  static const double recipeCardSizeBoxHeightTextSummaryHtml = 250.0;
  static const double recipeCardTextsTagsRunSpacing = 5.0;
  static const double recipeCardTextsTagsSpacing = 8.0;
  static const double recipeCardSizeBoxHeightTextsTags = 45.0;

  final RecipeEntity recipe;

  List<Widget> _getTags(RecipeEntity recipe) {
    return [
      _getTextWithStyle(
        recipe.vegetarian,
        recipeCardTextVegetarian,
      ),
      _getTextWithStyle(
        recipe.vegan,
        recipeCardTextVegan,
      ),
      _getTextWithStyle(
        recipe.glutenFree,
        recipeCardTextGlutenFree,
      ),
      _getTextWithStyle(
        recipe.dairyFree,
        recipeCardTextDairyFree,
      ),
      _getTextWithStyle(
        recipe.veryHealthy,
        recipeCardTextVeryHealthy,
      ),
      _getTextWithStyle(
        recipe.cheap,
        recipeCardTextCheap,
      ),
      _getTextWithStyle(
        recipe.veryPopular,
        recipeCardTextVeryPopular,
      ),
      _getTextWithStyle(
        recipe.sustainable,
        recipeCardTextSustainable,
      ),
      _getTextWithStyle(
        recipe.lowFodmap,
        recipeCardTextLowFodmap,
      ),
    ];
  }

  Widget _getTextWithStyle(bool tag, String text) {
    return Text(
      text,
      style: TextStyle(
        color: tag ? Colors.green : Colors.grey,
        fontSize: NumbersConstants.textStyleSize,
        fontWeight: FontWeight.w700,
        fontFamily: StringsConstants.textFontFamily,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: recipeCardContainerWidthColumn,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.elliptical(
            recipeCardContainerBorderRadiusEllipticalX,
            recipeCardContainerBorderRadiusEllipticalY,
          ),
          bottomRight: Radius.elliptical(
            recipeCardContainerBorderRadiusEllipticalX,
            recipeCardContainerBorderRadiusEllipticalY,
          ),
        ),
        border: Border.all(),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: recipeCardSizeBoxHeight,
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
                    left: NumbersConstants.paddingLeftMedium,
                    top: NumbersConstants.paddingTopMedium,
                  ),
                  child: ColoredBox(
                    color: Colors.white,
                    child: Text(
                      '$recipeCardTextTitle${recipe.title}$recipeCardTextTitle',
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
              top: NumbersConstants.paddingTopMedium,
              right: NumbersConstants.paddingRightSmall,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Image(
                  image: AssetImage(
                    AssetsConstants.imageClockIcon,
                  ),
                  height: recipeCardImageClockIconHeight,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: NumbersConstants.paddingLeftMedium,
                    top: NumbersConstants.paddingTopMedium,
                  ),
                  child: Text(
                    '${recipe.readyInMinutes} $recipeCardTextReadyInMinutes',
                    style: const TextStyle(
                      fontSize: NumbersConstants.textStyleSize,
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
              left: NumbersConstants.paddingLeftMedium,
              top: NumbersConstants.paddingTopMedium,
            ),
            child: Text(
              recipeCardTextSummary,
              style: TextStyle(
                fontSize: NumbersConstants.textStyleSize,
                fontWeight: FontWeight.w700,
                fontFamily: StringsConstants.textFontFamily,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: NumbersConstants.paddingLeftMedium,
              top: NumbersConstants.paddingTopMedium,
              right: NumbersConstants.paddingRightSmall,
            ),
            child: SizedBox(
              height: recipeCardSizeBoxHeightTextSummaryHtml,
              child: SingleChildScrollView(
                child: Html(
                  data: recipe.summary,
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(
              left: NumbersConstants.paddingLeftMedium,
              top: NumbersConstants.paddingTopMedium,
            ),
            child: Text(
              recipeCardTextTags,
              style: TextStyle(
                fontSize: NumbersConstants.textStyleSize,
                fontWeight: FontWeight.w700,
                fontFamily: StringsConstants.textFontFamily,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: NumbersConstants.paddingLeftMedium,
              top: NumbersConstants.paddingTopMedium,
              right: NumbersConstants.paddingRightSmall,
              bottom: NumbersConstants.paddingBottomSmall,
            ),
            child: SizedBox(
              height: recipeCardSizeBoxHeightTextsTags,
              child: SingleChildScrollView(
                child: Wrap(
                  alignment: WrapAlignment.center,
                  runSpacing: recipeCardTextsTagsRunSpacing,
                  spacing: recipeCardTextsTagsSpacing,
                  children: _getTags(recipe),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
