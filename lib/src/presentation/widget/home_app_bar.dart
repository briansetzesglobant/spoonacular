import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:spoonacular/src/core/util/assets_constants.dart';
import 'package:spoonacular/src/core/util/numbers_constants.dart';
import 'package:spoonacular/src/core/util/strings_constants.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar();

  static const String homeAppBarTextSpoonacular = 'Spoonacular';
  static const String homeAppBarTextRecipeSearchIcon = 'SEARCH RECIPES';
  static const double homeAppBarStyleSizeBig = 50.0;
  static const double homeAppBarImageRecipeSearchIconSize = 70.0;
  static const double homeAppBarPreferredSize = 130.0;

  @override
  Size get preferredSize => const Size.fromHeight(
        homeAppBarPreferredSize,
      );

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.teal,
      child: Padding(
        padding: const EdgeInsets.only(
          left: NumbersConstants.paddingLeftBig,
          right: NumbersConstants.paddingRightMedium,
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
                  left: NumbersConstants.paddingLeftBig,
                ),
                child: AutoSizeText(
                  homeAppBarTextSpoonacular,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: homeAppBarStyleSizeBig,
                  ),
                  maxLines: NumbersConstants.autoSizeTextMaxLines,
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
                        top: NumbersConstants.paddingTopBig,
                        right: NumbersConstants.paddingRightMedium,
                        bottom: NumbersConstants.paddingBottomMedium,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Image(
                            image: AssetImage(
                              AssetsConstants.imageRecipeSearchIcon,
                            ),
                            width: homeAppBarImageRecipeSearchIconSize,
                            height: homeAppBarImageRecipeSearchIconSize,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: NumbersConstants.paddingTopSmall,
                            ),
                            child: ColoredBox(
                              color: Colors.white,
                              child: Text(
                                homeAppBarTextRecipeSearchIcon,
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
