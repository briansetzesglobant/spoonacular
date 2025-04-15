import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:spoonacular/src/core/parameter/parameter_object.dart';
import 'package:spoonacular/src/core/util/api_service_constants.dart';
import 'package:spoonacular/src/core/util/assets_constants.dart';
import 'package:spoonacular/src/core/util/numbers_constants.dart';
import 'package:spoonacular/src/core/util/routes_constants.dart';
import 'package:spoonacular/src/core/util/strings_constants.dart';
import 'package:spoonacular/src/domain/entity/similar_recipes/similar_recipes_entity.dart';
import 'package:spoonacular/src/presentation/controller/recipe_id_controller.dart';

class SimilarRecipesCard extends StatefulWidget {
  const SimilarRecipesCard({
    required this.similarRecipes,
  });

  final List<SimilarRecipesEntity> similarRecipes;

  @override
  State<SimilarRecipesCard> createState() => _SimilarRecipesCardState();
}

class _SimilarRecipesCardState extends State<SimilarRecipesCard> {
  static const String textSimilarRecipes = 'SIMILAR RECIPES';
  static const double textSimilarRecipesFontSize = 17.0;
  static const double textTextTitleFontSize = 11.0;
  static const double sizeBoxWidthImageUrl = 300.0;
  static const double sizeBoxHeightImageUrl = 200.0;
  static const double sizedBoxHeightListView = 700.0;
  static String imageUrl =
      '${ApiServiceConstants.urlBaseImageSimilarRecipes}${ApiServiceConstants.recipeIndex}${ApiServiceConstants.resolutionImageSimilarRecipes}.${ApiServiceConstants.imageType}';

  final RecipeIdController controller = Get.find<RecipeIdController>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.teal,
        border: Border.all(
          width: NumbersConstants.borderWith,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: NumbersConstants.paddingMedium,
          horizontal: NumbersConstants.paddingXXXSmall,
        ),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(
                bottom: NumbersConstants.paddingXMedium,
              ),
              child: AutoSizeText(
                textSimilarRecipes,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: textSimilarRecipesFontSize,
                  fontWeight: FontWeight.w900,
                  fontFamily: StringsConstants.textFontFamily,
                ),
                textAlign: TextAlign.center,
                maxLines: NumbersConstants.autoSizeTextMaxLinesSecond,
              ),
            ),
            SizedBox(
              height: sizedBoxHeightListView,
              child: ListView.builder(
                itemCount: widget.similarRecipes.length,
                itemBuilder: (
                  context,
                  index,
                ) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          bottom: NumbersConstants.paddingXXXSmall,
                        ),
                        child: InkWell(
                          onTap: () async {
                            await controller.getRecipeId(
                              id: widget.similarRecipes[index].id,
                            );
                            Navigator.of(context).pushReplacementNamed(
                              RoutesConstants.detailRoute,
                              arguments: ParameterDetailPage(
                                id: controller.state!.id,
                                title: controller.state!.title,
                                aggregateLikes:
                                    controller.state!.aggregateLikes,
                                instructions: controller.state!.instructions,
                                image: controller.state!.image,
                              ),
                            );
                          },
                          child: SizedBox(
                            width: sizeBoxWidthImageUrl,
                            height: sizeBoxHeightImageUrl,
                            child: CachedNetworkImage(
                              imageUrl: imageUrl
                                  .replaceAll(
                                    ApiServiceConstants.recipeIndex,
                                    '${widget.similarRecipes[index].id}',
                                  )
                                  .replaceAll(
                                    ApiServiceConstants.imageType,
                                    widget.similarRecipes[index].imageType,
                                  ),
                              imageBuilder: (
                                context,
                                imageProvider,
                              ) =>
                                  DecoratedBox(
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
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          bottom: NumbersConstants.paddingXXXSmall,
                        ),
                        child: Text(
                          widget.similarRecipes[index].title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: textTextTitleFontSize,
                            fontWeight: FontWeight.w900,
                            fontFamily: StringsConstants.textFontFamily,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
