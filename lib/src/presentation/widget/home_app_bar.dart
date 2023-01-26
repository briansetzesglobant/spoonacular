import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:spoonacular/src/core/util/assets_constants.dart';
import 'package:spoonacular/src/core/util/numbers_constants.dart';
import 'package:spoonacular/src/core/util/strings_constants.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar();

  static const String textSpoonacular = 'Spoonacular';
  static const String textFavorites = 'FAVORITE RECIPES';
  static const String textSearch = 'SEARCH RECIPES';
  static const double imageSize = 65.0;
  static const double styleSize = 40.0;
  static const double textFavoritesFontSizeFirst = 20.0;
  static const double textFavoritesFontSizeSecond = 13.0;
  static const double textFavoritesFontSizeThird = 9.0;
  static const double constraintsMaxWidthFirst = 900.0;
  static const double constraintsMaxWidthSecond = 650.0;
  static const double preferredSizeHeight = 135.0;

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
              left: NumbersConstants.paddingBig,
              right: NumbersConstants.paddingXXXSmall,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Image(
                  image: AssetImage(
                    AssetsConstants.imageSpoonacular,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: NumbersConstants.paddingBig,
                    ),
                    child: AutoSizeText(
                      textSpoonacular.toUpperCase(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: styleSize,
                        fontWeight: FontWeight.w600,
                        fontFamily: StringsConstants.textFontFamily,
                        decoration: TextDecoration.underline,
                      ),
                      maxLines: NumbersConstants.autoSizeTextMaxLinesFirst,
                    ),
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: FittedBox(
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: NumbersConstants.paddingXXXSmall,
                              top: NumbersConstants.paddingXMedium,
                              right: NumbersConstants.paddingXXXSmall,
                              bottom: NumbersConstants.paddingXMedium,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Image(
                                  image: AssetImage(
                                    AssetsConstants.imageFavorites,
                                  ),
                                  width: imageSize,
                                  height: imageSize,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: NumbersConstants.paddingSmall,
                                  ),
                                  child: Text(
                                    textFavorites,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: constraints.maxWidth >
                                              constraintsMaxWidthFirst
                                          ? textFavoritesFontSizeFirst
                                          : (constraints.maxWidth >
                                                  constraintsMaxWidthSecond
                                              ? textFavoritesFontSizeSecond
                                              : textFavoritesFontSizeThird),
                                      fontWeight: FontWeight.w500,
                                      fontFamily:
                                          StringsConstants.textFontFamily,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: FittedBox(
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: NumbersConstants.paddingXXXSmall,
                              top: NumbersConstants.paddingXMedium,
                              right: NumbersConstants.paddingXXXSmall,
                              bottom: NumbersConstants.paddingXMedium,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Image(
                                  image: AssetImage(
                                    AssetsConstants.imageSearch,
                                  ),
                                  width: imageSize,
                                  height: imageSize,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: NumbersConstants.paddingSmall,
                                  ),
                                  child: Text(
                                    textSearch,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: constraints.maxWidth >
                                              constraintsMaxWidthFirst
                                          ? textFavoritesFontSizeFirst
                                          : (constraints.maxWidth >
                                                  constraintsMaxWidthSecond
                                              ? textFavoritesFontSizeSecond
                                              : textFavoritesFontSizeThird),
                                      fontWeight: FontWeight.w500,
                                      fontFamily:
                                          StringsConstants.textFontFamily,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
