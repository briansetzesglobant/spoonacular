import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:spoonacular/src/core/util/assets_constants.dart';
import 'package:spoonacular/src/core/util/numbers_constants.dart';
import 'package:spoonacular/src/core/util/routes_constants.dart';

class FavoritesRecipesAppBar extends StatelessWidget implements PreferredSizeWidget {
  const FavoritesRecipesAppBar();

  static const String textFavoritesRecipes = 'Favorites Recipes';
  static const double imageSpoonacularSize = 50.0;
  static const double textFavoritesRecipesFontSizeFirst = 50.0;
  static const double textFavoritesRecipesFontSizeSecond = 35.0;
  static const double styleSize = 50.0;
  static const double constraintsMaxWidth = 600.0;
  static const double preferredSizeHeight = 70.0;

  @override
  Size get preferredSize => const Size.fromHeight(
        preferredSizeHeight,
      );

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return ColoredBox(
          color: Colors.teal,
          child: Padding(
            padding: const EdgeInsets.only(
              left: NumbersConstants.paddingLeftBig,
              right: NumbersConstants.paddingRightLarge,
            ),
            child: Expanded(
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: NumbersConstants.paddingTopXXSmall,
                      bottom: NumbersConstants.paddingBottomXSmall,
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).pushReplacementNamed(
                          RoutesConstants.homeRoute,
                        );
                      },
                      child: const Image(
                        image: AssetImage(
                          AssetsConstants.imageSpoonacular,
                        ),
                        width: imageSpoonacularSize,
                        height: imageSpoonacularSize,
                      ),
                    ),
                  ),
                  Center(
                    child: AutoSizeText(
                      textFavoritesRecipes,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: constraints.maxWidth > constraintsMaxWidth
                            ? textFavoritesRecipesFontSizeFirst
                            : textFavoritesRecipesFontSizeSecond,
                      ),
                      maxLines: NumbersConstants.autoSizeTextMaxLinesFirst,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
