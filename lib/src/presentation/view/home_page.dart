import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:spoonacular/src/core/util/assets_constants.dart';
import 'package:spoonacular/src/core/util/numbers_constants.dart';
import 'package:spoonacular/src/core/util/strings_constants.dart';
import 'package:spoonacular/src/domain/entity/recipes/recipe_entity.dart';
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
  static const double textNoRecipesFoundStyleSize = 50.0;
  static const double sizeBoxWidth = 30.0;
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
          bottom: NumbersConstants.paddingBottomBig,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: NumbersConstants.paddingLeftXBig,
                top: NumbersConstants.paddingTopXSmall,
              ),
              child: InkWell(
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
                        left: NumbersConstants.paddingLeftSmall,
                      ),
                      child: Text(
                        textRefresh,
                        style: TextStyle(
                          fontSize: NumbersConstants.textStyleSize,
                          fontWeight: FontWeight.w900,
                          fontFamily: StringsConstants.textFontFamily,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: NumbersConstants.paddingLeftXBig,
                top: NumbersConstants.paddingTopXSmall,
                right: NumbersConstants.paddingRightBig,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: RecipeCard(
                      state[firstIndexCard],
                    ),
                  ),
                  const SizedBox(
                    width: sizeBoxWidth,
                  ),
                  Expanded(
                    child: RecipeCard(
                      state[secondIndexCard],
                    ),
                  ),
                  const SizedBox(
                    width: sizeBoxWidth,
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
                    top: NumbersConstants.paddingTopXSmall,
                  ),
                  child: AutoSizeText(
                    StringsConstants.textNoRecipesFound,
                    style: TextStyle(
                      fontSize: textNoRecipesFoundStyleSize,
                      fontFamily: StringsConstants.textFontFamily,
                    ),
                    maxLines: NumbersConstants.autoSizeTextMaxLinesFirst,
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
