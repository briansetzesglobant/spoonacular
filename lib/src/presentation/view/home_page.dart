import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:spoonacular/src/core/util/assets_constants.dart';
import 'package:spoonacular/src/core/util/numbers_constants.dart';
import 'package:spoonacular/src/core/util/strings_constants.dart';
import 'package:spoonacular/src/data/datasource/remote/recipes_api_service.dart';
import 'package:spoonacular/src/data/repository/recipes_repository.dart';
import 'package:spoonacular/src/domain/entity/recipe_entity.dart';
import 'package:spoonacular/src/domain/use_case/implementation/recipes_use_case.dart';
import 'package:spoonacular/src/presentation/controller/recipes_controller.dart';
import 'package:spoonacular/src/presentation/widget/home_app_bar.dart';
import 'package:spoonacular/src/presentation/widget/recipe_card.dart';

class HomePage extends StatefulWidget {
  const HomePage();

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const String homePageTextRefresh = 'SHOW MORE RECIPES';
  static const String homePageTextNoRecipesFound = 'NO RECIPES FOUND';
  static const double homePageContainerImageRefresh = 40.0;
  static const int homePageFirstIndexCard = 0;
  static const int homePageSecondIndexCard = 1;
  static const int homePageThirdIndexCard = 2;
  static const double homePageSizeBox = 30.0;
  static const double homePageTextNoRecipesFoundStyleSize = 50.0;

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
                left: NumbersConstants.paddingLeftBig,
                top: NumbersConstants.paddingTopMedium,
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
                          height: homePageContainerImageRefresh,
                          width: homePageContainerImageRefresh,
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
                            homePageTextRefresh,
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
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: NumbersConstants.paddingLeftBig,
                top: NumbersConstants.paddingTopMedium,
                right: NumbersConstants.paddingRightBig,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: RecipeCard(
                      state[homePageFirstIndexCard],
                    ),
                  ),
                  const SizedBox(
                    width: homePageSizeBox,
                  ),
                  Expanded(
                    child: RecipeCard(
                      state[homePageSecondIndexCard],
                    ),
                  ),
                  const SizedBox(
                    width: homePageSizeBox,
                  ),
                  Expanded(
                    child: RecipeCard(
                      state[homePageThirdIndexCard],
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
                    top: NumbersConstants.paddingTopMedium,
                  ),
                  child: AutoSizeText(
                    homePageTextNoRecipesFound,
                    style: TextStyle(
                      fontSize: homePageTextNoRecipesFoundStyleSize,
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
