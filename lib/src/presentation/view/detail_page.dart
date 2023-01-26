import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:spoonacular/src/core/parameter/parameter_object.dart';
import 'package:spoonacular/src/core/util/assets_constants.dart';
import 'package:spoonacular/src/core/util/numbers_constants.dart';
import 'package:spoonacular/src/core/util/strings_constants.dart';
import 'package:spoonacular/src/presentation/controller/ingredients_controller.dart';
import 'package:spoonacular/src/presentation/controller/nutrition_facts_controller.dart';
import 'package:spoonacular/src/presentation/controller/similar_recipes_controller.dart';
import 'package:spoonacular/src/presentation/widget/detail_app_bar.dart';
import 'package:spoonacular/src/presentation/widget/ingredients_card.dart';
import 'package:spoonacular/src/presentation/widget/nutrition_facts_card.dart';
import 'package:spoonacular/src/presentation/widget/similar_recipes_card.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({
    required this.parameterDetailPage,
  });

  final ParameterDetailPage parameterDetailPage;

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  static const double textNoRecipesFoundStyleSize = 50.0;
  static const double sizeBoxSize = 20.0;
  static const int flexPageHorizontalNutritionFacts = 3;
  static const int flexPageHorizontalIngredients = 4;
  static const int flexPageHorizontalSimilarRecipes = 2;
  static const int flexPageVerticalNutritionFacts = 5;
  static const int flexPageVerticalSimilarRecipes = 4;
  static const double constraintsMaxWidth = 770.0;
  static const int duration = 100;

  final NutritionFactsController nutritionFactsController =
      Get.find<NutritionFactsController>(
    tag: StringsConstants.textNutritionFactsController,
  );
  final IngredientsController ingredientsController =
      Get.find<IngredientsController>(
    tag: StringsConstants.textIngredientsController,
  );
  final SimilarRecipesController similarRecipesController =
      Get.find<SimilarRecipesController>(
    tag: StringsConstants.textSimilarRecipesController,
  );

  @override
  void initState() {
    super.initState();
    _getEndpoints();
  }

  Future<void> _getEndpoints() async {
    await Future.delayed(
      const Duration(
        milliseconds: duration,
      ),
      () {
        nutritionFactsController.getNutritionFacts(
          id: widget.parameterDetailPage.id,
        );
        ingredientsController.getIngredients(
          id: widget.parameterDetailPage.id,
        );
        similarRecipesController.getSimilarRecipes(
          id: widget.parameterDetailPage.id,
        );
      },
    );
  }

  Widget getDetailPageHorizontal() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: flexPageHorizontalNutritionFacts,
          child: nutritionFactsController.obx(
            (state) => NutritionFactsCard(
              htmlNutritionFactsCard: state!,
              instructions: widget.parameterDetailPage.instructions,
            ),
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
          ),
        ),
        const SizedBox(
          width: sizeBoxSize,
        ),
        Expanded(
          flex: flexPageHorizontalIngredients,
          child: ingredientsController.obx(
            (state) => IngredientsCard(
              ingredients: state!,
            ),
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
                        top: NumbersConstants.paddingXXSmall,
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
        ),
        const SizedBox(
          width: sizeBoxSize,
        ),
        Expanded(
          flex: flexPageHorizontalSimilarRecipes,
          child: similarRecipesController.obx(
            (state) => SimilarRecipesCard(
              similarRecipes: state!,
            ),
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
                        top: NumbersConstants.paddingXXSmall,
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
        ),
      ],
    );
  }

  Widget getDetailPageVertical() {
    return Column(
      children: [
        ingredientsController.obx(
          (state) => IngredientsCard(
            ingredients: state!,
          ),
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
                      top: NumbersConstants.paddingXXSmall,
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
        const SizedBox(
          height: sizeBoxSize,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: flexPageVerticalNutritionFacts,
              child: nutritionFactsController.obx(
                (state) => NutritionFactsCard(
                  htmlNutritionFactsCard: state!,
                  instructions: widget.parameterDetailPage.instructions,
                ),
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
              ),
            ),
            const SizedBox(
              width: sizeBoxSize,
            ),
            Expanded(
              flex: flexPageVerticalSimilarRecipes,
              child: similarRecipesController.obx(
                (state) => SimilarRecipesCard(
                  similarRecipes: state!,
                ),
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
                            top: NumbersConstants.paddingXXSmall,
                          ),
                          child: AutoSizeText(
                            StringsConstants.textNoRecipesFound,
                            style: TextStyle(
                              fontSize: textNoRecipesFoundStyleSize,
                              fontFamily: StringsConstants.textFontFamily,
                            ),
                            maxLines:
                                NumbersConstants.autoSizeTextMaxLinesFirst,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _getPage() {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              left: NumbersConstants.paddingXXXSmall,
              top: NumbersConstants.paddingXXXSmall,
              right: NumbersConstants.paddingXXXSmall,
              bottom: NumbersConstants.paddingMedium,
            ),
            child: constraints.maxWidth > constraintsMaxWidth
                ? getDetailPageHorizontal()
                : getDetailPageVertical(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
        appBar: DetailAppBar(
          title: widget.parameterDetailPage.title,
          aggregateLikes: widget.parameterDetailPage.aggregateLikes,
          image: widget.parameterDetailPage.image,
        ),
        body: _getPage(),
      ),
    );
  }
}
