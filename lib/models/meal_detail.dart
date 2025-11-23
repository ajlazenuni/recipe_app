class MealDetail {
  final String id;
  final String name;
  final String thumbnail;
  final String instructions;
  final String youtube;
  final Map<String, String> ingredients;

  MealDetail({
    required this.id,
    required this.name,
    required this.thumbnail,
    required this.instructions,
    required this.youtube,
    required this.ingredients,
  });

  factory MealDetail.fromJson(Map<String, dynamic> json) {
    Map<String, String> ingredients = {};

    for (int i = 1; i <= 20; i++) {
      final ing = json["strIngredient$i"];
      final measure = json["strMeasure$i"];

      if (ing != null && ing.toString().trim().isNotEmpty) {
        ingredients[ing] = measure ?? "";
      }
    }

    return MealDetail(
      id: json["idMeal"],
      name: json["strMeal"],
      thumbnail: json["strMealThumb"],
      instructions: json["strInstructions"],
      youtube: json["strYoutube"] ?? "",
      ingredients: ingredients,
    );
  }
}
