import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:spoonacular/src/core/util/assets_constants.dart';
import 'package:spoonacular/src/core/util/numbers_constants.dart';
import 'package:spoonacular/src/core/util/strings_constants.dart';
import 'package:spoonacular/src/domain/entity/recipe_entity.dart';
import 'package:spoonacular/src/presentation/controller/recipes_controller.dart';
import 'package:spoonacular/src/presentation/widget/home_app_bar.dart';
import 'package:spoonacular/src/presentation/widget/recipe_card.dart';

class HomePage extends StatefulWidget {
  const HomePage();

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const String textRefresh = 'SHOW MORE RECIPES';
  static const String textNoRecipesFound = 'NO RECIPES FOUND';
  static const double textRefreshFontSize = 20.0;
  static const double textNoRecipesFoundFontSize = 50.0;
  static const double sizeBox = 30.0;
  static const double containerImageRefresh = 40.0;
  static const int firstIndexCard = 0;
  static const int secondIndexCard = 1;
  static const int thirdIndexCard = 2;

  final RecipesController controller = Get.find<RecipesController>();

  @override
  void initState() {
    super.initState();
    controller.getRecipesRandom();
  }

  Widget _getSuccessPage(List<RecipeEntity> state) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(
          bottom: NumbersConstants.paddingBig,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: NumbersConstants.paddingBig,
                top: NumbersConstants.paddingXSmall,
              ),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      controller.getRecipesRandom();
                    },
                    child: Row(
                      children: [
                        Container(
                          height: containerImageRefresh,
                          width: containerImageRefresh,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                AssetsConstants.imageRefresh,
                              ),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(
                            left: NumbersConstants.paddingXXSmall,
                          ),
                          child: Text(
                            textRefresh,
                            style: TextStyle(
                              fontSize: textRefreshFontSize,
                              fontWeight: FontWeight.w700,
                              fontFamily: StringsConstants.textFontFamily,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: NumbersConstants.paddingBig,
                top: NumbersConstants.paddingXSmall,
                right: NumbersConstants.paddingBig,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: RecipeCard(
                      state[firstIndexCard],
                    ),
                  ),
                  const SizedBox(
                    width: sizeBox,
                  ),
                  Expanded(
                    child: RecipeCard(
                      state[secondIndexCard],
                    ),
                  ),
                  const SizedBox(
                    width: sizeBox,
                  ),
                  Expanded(
                    child: RecipeCard(
                      state[thirdIndexCard],
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppBar(),
      body: controller.obx(
        (state) => _getSuccessPage(state!),
        onLoading: Center(
          child: SizedBox(
            child: Lottie.asset(
              AssetsConstants.lottieLoadingUtensils,
            ),
          ),
        ),
        onError: (error) => Center(
          child: Container(
            color: Colors.grey,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Lottie.asset(
              AssetsConstants.lottieOopsErrorNew,
            ),
          ),
        ),
        onEmpty: Center(
          child: FittedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Image(
                  image: AssetImage(
                    AssetsConstants.imageNoRecipesFound,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: NumbersConstants.paddingXSmall,
                  ),
                  child: AutoSizeText(
                    textNoRecipesFound,
                    style: TextStyle(
                      fontSize: textNoRecipesFoundFontSize,
                      fontFamily: StringsConstants.textFontFamily,
                    ),
                    maxLines: NumbersConstants.autoSizeTextMaxLines,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
