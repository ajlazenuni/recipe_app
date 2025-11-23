import 'package:flutter/material.dart';
import '../services/meal_api_service.dart';
import '../widgets/meal_card.dart';
import '../models/meal.dart';
import 'meal_detail_screen.dart';

class MealsScreen extends StatefulWidget {
  final String category;

  MealsScreen({required this.category});

  @override
  _MealsScreenState createState() => _MealsScreenState();
}

class _MealsScreenState extends State<MealsScreen> {
  final MealApiService api = MealApiService();
  List<Meal> meals = [];
  List<Meal> filtered = [];
  String search = "";

  @override
  void initState() {
    super.initState();
    loadMeals();
  }

  void loadMeals() async {
    meals = await api.getMealsByCategory(widget.category);
    filtered = meals;
    setState(() {});
  }

  void searchMeals(String query) async {
    if (query.isEmpty) {
      filtered = meals;
    } else {
      filtered = await api.searchMeals(query);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.category)),
      body: Column(
        children: [
          TextField(
            decoration: InputDecoration(labelText: "Search meals"),
            onChanged: searchMeals,
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              children: filtered
                  .map(
                    (m) => MealCard(
                      meal: m,
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => MealDetailScreen(mealId: m.id),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          )
        ],
      ),
    );
  }
}
