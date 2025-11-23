import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/category.dart';
import '../models/meal.dart';
import '../models/meal_detail.dart';

class MealApiService {
  final String baseUrl = "https://www.themealdb.com/api/json/v1/1/";

  Future<List<Category>> getCategories() async {
    final response = await http.get(Uri.parse("${baseUrl}categories.php"));

    final data = jsonDecode(response.body);
    return (data["categories"] as List)
        .map((cat) => Category.fromJson(cat))
        .toList();
  }

  Future<List<Meal>> getMealsByCategory(String category) async {
    final response =
        await http.get(Uri.parse("${baseUrl}filter.php?c=$category"));

    final data = jsonDecode(response.body);
    return (data["meals"] as List).map((meal) => Meal.fromJson(meal)).toList();
  }

  Future<List<Meal>> searchMeals(String query) async {
    final response = await http.get(Uri.parse("${baseUrl}search.php?s=$query"));

    final data = jsonDecode(response.body);

    if (data["meals"] == null) return [];

    return (data["meals"] as List).map((meal) => Meal.fromJson(meal)).toList();
  }

  Future<MealDetail> getMealDetail(String id) async {
    final response = await http.get(Uri.parse("${baseUrl}lookup.php?i=$id"));

    final data = jsonDecode(response.body);
    return MealDetail.fromJson(data["meals"][0]);
  }

  Future<MealDetail> getRandomMeal() async {
    final response = await http.get(Uri.parse("${baseUrl}random.php"));
    final data = jsonDecode(response.body);
    return MealDetail.fromJson(data["meals"][0]);
  }
}
