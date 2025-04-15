class RecipeEntity {
  RecipeEntity({
    required this.title,
    required this.image,
    required this.readyInMinutes,
    required this.summary,
    required this.vegetarian,
    required this.vegan,
    required this.glutenFree,
    required this.dairyFree,
    required this.veryHealthy,
    required this.cheap,
    required this.veryPopular,
    required this.sustainable,
    required this.lowFodmap,
    required this.id,
    required this.aggregateLikes,
    required this.instructions,
  });

  final String title;
  final String image;
  final int readyInMinutes;
  final String summary;
  final bool vegetarian;
  final bool vegan;
  final bool glutenFree;
  final bool dairyFree;
  final bool veryHealthy;
  final bool cheap;
  final bool veryPopular;
  final bool sustainable;
  final bool lowFodmap;
  final int id;
  final int aggregateLikes;
  final String instructions;
}
