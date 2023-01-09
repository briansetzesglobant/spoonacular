import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:spoonacular/src/core/util/assets_constants.dart';
import 'package:spoonacular/src/core/util/numbers_constants.dart';
import 'package:spoonacular/src/core/util/strings_constants.dart';
import 'package:spoonacular/src/data/datasource/local/get_storage_local.dart';
import 'package:spoonacular/src/presentation/controller/ingredients_controller.dart';
import 'package:spoonacular/src/presentation/controller/nutrition_facts_controller.dart';
import 'package:spoonacular/src/presentation/controller/similar_recipes_controller.dart';
import 'package:spoonacular/src/presentation/widget/detail_app_bar.dart';
import 'package:spoonacular/src/presentation/widget/ingredients_card.dart';
import 'package:spoonacular/src/presentation/widget/nutrition_facts_card.dart';
import 'package:spoonacular/src/presentation/widget/similar_recipes_card.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({
    required this.id,
    required this.title,
    required this.aggregateLikes,
    required this.instructions,
    required this.image,
    required this.storage,
  });

  final int id;
  final String title;
  final int aggregateLikes;
  final String instructions;
  final String image;
  final GetStorageLocal storage;

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  static const double textNoRecipesFoundStyleSize = 50.0;
  static const double sizeBoxWidth = 20.0;
  static const double sizeBoxHeight = 20.0;
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
          id: widget.id,
        );
        ingredientsController.getIngredients(
          id: widget.id,
        );
        similarRecipesController.getSimilarRecipes(
          id: widget.id,
        );
      },
    );
  }

  Widget getDetailPageHorizontal() {
    return Row(
      children: [
        Expanded(
          flex: flexPageHorizontalNutritionFacts,
          child: nutritionFactsController.obx(
            (state) => NutritionFactsCard(
              state!,
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
          width: sizeBoxWidth,
        ),
        Expanded(
          flex: flexPageHorizontalIngredients,
          child: ingredientsController.obx(
            (state) => IngredientsCard(
              ingredients: state!,
              instructions: widget.instructions,
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
        ),
        const SizedBox(
          width: sizeBoxWidth,
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
            instructions: widget.instructions,
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
        const SizedBox(
          height: sizeBoxHeight,
        ),
        Row(
          children: [
            Expanded(
              flex: flexPageVerticalNutritionFacts,
              child: nutritionFactsController.obx(
                (state) => NutritionFactsCard(
                  state!,
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
              width: sizeBoxWidth,
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
                            top: NumbersConstants.paddingTopXSmall,
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
              left: NumbersConstants.paddingLeftMedium,
              top: NumbersConstants.paddingTopXXSmall,
              right: NumbersConstants.paddingRightMedium,
              bottom: NumbersConstants.paddingBottomMedium,
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
          title: widget.title,
          aggregateLikes: widget.aggregateLikes,
          image: widget.image,
          storage: widget.storage,
        ),
        body: _getPage(),
      ),
    );
  }
}
