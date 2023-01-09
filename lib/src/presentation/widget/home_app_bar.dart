import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:spoonacular/src/core/util/assets_constants.dart';
import 'package:spoonacular/src/core/util/numbers_constants.dart';
import 'package:spoonacular/src/core/util/routes_constants.dart';
import 'package:spoonacular/src/core/util/strings_constants.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar();

  static const String textSpoonacular = 'Spoonacular';
  static const String textFavorites = 'Favorites recipes';
  static const String textRecipeSearchIcon = 'SEARCH RECIPES';
  static const double styleSize = 50.0;
  static const double imageSize = 70.0;
  static const double preferredSizeHeight = 130.0;

  @override
  Size get preferredSize => const Size.fromHeight(
        preferredSizeHeight,
      );

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.teal,
      child: Padding(
        padding: const EdgeInsets.only(
          left: NumbersConstants.paddingLeftXBig,
          right: NumbersConstants.paddingRightXSmall,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(
              image: AssetImage(
                AssetsConstants.imageSpoonacular,
              ),
            ),
            const Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                  left: NumbersConstants.paddingLeftXBig,
                ),
                child: AutoSizeText(
                  textSpoonacular,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: styleSize,
                  ),
                  maxLines: NumbersConstants.autoSizeTextMaxLinesFirst,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pushReplacementNamed(
                  RoutesConstants.favoritesRoute,
                );
              },
              child: FittedBox(
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: NumbersConstants.paddingTopXMedium,
                    right: NumbersConstants.paddingRightXSmall,
                    bottom: NumbersConstants.paddingBottomXMedium,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Image(
                        image: AssetImage(
                          AssetsConstants.imageFavorites,
                        ),
                        width: imageSize,
                        height: imageSize,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: NumbersConstants.paddingTopSmall,
                        ),
                        child: ColoredBox(
                          color: Colors.white,
                          child: Text(
                            'Favorites recipes',
                            style: TextStyle(
                              color: Colors.teal,
                              fontSize: NumbersConstants.textStyleSize,
                              fontWeight: FontWeight.w500,
                              fontFamily: StringsConstants.textFontFamily,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FittedBox(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: NumbersConstants.paddingTopXMedium,
                        right: NumbersConstants.paddingRightXSmall,
                        bottom: NumbersConstants.paddingBottomXMedium,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Image(
                            image: AssetImage(
                              AssetsConstants.imageRecipeSearchIcon,
                            ),
                            width: imageSize,
                            height: imageSize,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: NumbersConstants.paddingTopSmall,
                            ),
                            child: ColoredBox(
                              color: Colors.white,
                              child: Text(
                                textRecipeSearchIcon,
                                style: TextStyle(
                                  color: Colors.teal,
                                  fontSize: NumbersConstants.textStyleSize,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: StringsConstants.textFontFamily,
                                ),
                              ),
                            ),
                          ),
                        ],
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
  }
}
