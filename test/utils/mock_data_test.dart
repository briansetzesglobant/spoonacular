final recipesListModelJsonSuccess = {
  'recipes': [recipeModelJsonSuccess]
};

final recipesListModelJsonEmpty = {'recipes': []};

final errorModelJsonFailed = {'error': []};

const nutritionFactsSuccess = '''
<style>
	#spoonacular-nutrition-label,
	#spoonacular-nutrition-ingredient-list {
		border: 1px solid black;
		margin: 0 auto;
		width: 300px;
		padding: .5rem;
		font-family: Helvetica, Arial, sans-serif, sans-serif;
		font-size: 14px;
		color: #333;
		background-color: #fff
	}

	#spoonacular-nutrition-ingredient-list {
		text-transform: uppercase
	}

	#spoonacular-nutrition-label div.separator {
		border-bottom: 10px solid black
	}

	#spoonacular-nutrition-label>div:first-of-type {
		border-bottom: 10px solid black;
		padding: 0 0 .25rem 0;
		margin: 0 0 .5rem 0
	}

	#spoonacular-nutrition-label>div:first-of-type p {
		margin: 0;
		font-size: 16px
	}

	#spoonacular-nutrition-label table {
		border-collapse: unset;
		border-spacing: 0;
		font-size: 14px;
		width: 100%
	}

	#spoonacular-nutrition-label table td {
		font-weight: normal;
		text-align: left;
		padding: .3rem 0;
		border-top: 1px solid black;
		vertical-align: middle
	}

	#spoonacular-nutrition-label table .empty {
		width: 1rem;
		border-top: 0
	}

	#spoonacular-nutrition-label table #calorie-summary td {
		font-size: 33px;
		border: 0 none !important
	}

	#spoonacular-nutrition-label b {
		font-weight: 900
	}

	#spoonacular-nutrition-label .separator td {
		border-top-width: 5px
	}

	#spoonacular-nutrition-label table:first-of-type td:last-child {
		text-align: right !important
	}

	#spoonacular-nutrition-label table:nth-of-type(2) td:first-child {
		text-align: left !important
	}

	#spoonacular-nutrition-label table:nth-of-type(2) td:nth-of-type(2) {
		text-align: right !important
	}

	#spoonacular-nutrition-label .small {
		font-size: 11px
	}

	#spoonacular-nutrition-label h1.separator {
		border-bottom: 1px solid black
	}

	#spoonacular-nutrition-label h1 {
		font-size: 35px;
		margin: 0 0 .25rem 0
	}
</style>
<section id=spoonacular-nutrition-label>
	<div>
		<h1><b>Nutrition Facts</b></h1>
	</div><b>Amount Per Serving</b>
	<table>
		<tr id=calorie-summary>
			<td colspan=2><b>Calories</b>
			<td><b>787</b>
		<tr class=separator>
			<td colspan=3 class=small><b>% Daily Value*</b>
		<tr>
			<td colspan=2><b>Total Fat</b> 33g
			<td><b>43%</b>
		<tr>
			<td class=empty>
			<td>Saturated Fat 8g
			<td><b>39%</b>
		<tr>
			<td class=empty>
			<td><i>Trans</i> Fat 0.09g
			<td>
		<tr>
			<td colspan=2><b>Cholesterol</b> 96mg
			<td><b>32%</b>
		<tr>
			<td colspan=2><b>Sodium</b> 964mg
			<td><b>42%</b>
		<tr>
			<td colspan=2><b>Total Carbohydrate</b> 81g
			<td><b>30%</b>
		<tr>
			<td class=empty>
			<td>Dietary Fiber 10g
			<td><b>36%</b>
		<tr>
			<td class=empty>
			<td>Total Sugars 8g
			<td>
		<tr>
			<td colspan=2><b>Protein</b> 41g
			<td><b>81%</b>
	</table>
	<div class=separator></div>
	<table>
		<tr>
			<td>Vitamin D 0.95mcg
			<td>5%
		<tr>
			<td>Calcium 180mg
			<td>14%
		<tr>
			<td>Iron 5mg
			<td>28%
		<tr>
			<td>Potassium 2396mg
			<td>51%
		<tr class=separator>
			<td colspan=2 class=small>*The % Daily Value tells you how much a nutrient in a serving of food contributes
				to a daily diet. 2,000 calories a day is used for general nutrition advice.
	</table>
</section>
''';

final ingredientsListModelJsonSuccess = {
  'ingredients': [
    {
      'image': 'blueberries.jpg',
      'name': 'name',
    }
  ]
};

final ingredientsListModelJsonEmpty = {'ingredients': []};

final similarRecipesModelJsonSuccess = {
  'imageType': 'jpg',
  'title': 'title',
  'id': 000000,
};

final similarRecipesModelJsonEmpty = [];

final recipeModelJsonSuccess = {
  'title': 'title',
  'image': 'https://spoonacular.com/recipeImages/1043339-556x370.jpg',
  'readyInMinutes': 45,
  'summary': 'summary',
  'vegetarian': false,
  'vegan': false,
  'glutenFree': false,
  'dairyFree': false,
  'veryHealthy': false,
  'cheap': false,
  'veryPopular': false,
  'sustainable': false,
  'lowFodmap': false,
  'id': 000000,
  'aggregateLikes': 1,
  'instructions': 'instructions',
};
