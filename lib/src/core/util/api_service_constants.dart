abstract class ApiServiceConstants {
  static const String uri = 'https://api.spoonacular.com/recipes/';
  static const String headerKey = 'x-api-key';
  static const String apiKey = 'API_KEY';
  static const String apiKeyParameter = 'apiKey';
  static const String endpointRecipesRandom = 'random';
  static const String numberParameterRecipesRandom = 'number';
  static const int numberParameterValueRecipesRandom = 5;
  static const String endpointNutritionFacts = '/nutritionLabel';
  static const String endpointIngredients = '/ingredientWidget.json';
  static const String urlBaseImageIngredients =
      'https://spoonacular.com/cdn/ingredients_100x100/';
  static const String endpointSimilarRecipes = '/similar';
  static const String urlBaseImageSimilarRecipes =
      'https://spoonacular.com/recipeImages/';
  static const String resolutionImageSimilarRecipes = '-556x370';
  static const String recipeIndex = '<recipeIndex>';
  static const String imageType = '<imageType>';
  static const String endpointRecipeIdInformation = 'information';
  static const String textDataFailed =
      'An error has occurred while loading recipes random';
}
