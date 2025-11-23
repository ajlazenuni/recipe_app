import 'package:flutter/material.dart';
import '../services/meal_api_service.dart';
import '../models/meal_detail.dart';

class MealDetailScreen extends StatefulWidget {
  final String mealId;

  MealDetailScreen({required this.mealId});

  @override
  _MealDetailScreenState createState() => _MealDetailScreenState();
}

class _MealDetailScreenState extends State<MealDetailScreen> {
  MealDetail? meal;
  final api = MealApiService();

  @override
  void initState() {
    super.initState();
    loadMeal();
  }

  void loadMeal() async {
    meal = await api.getMealDetail(widget.mealId);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (meal == null) return Center(child: CircularProgressIndicator());

    return Scaffold(
      appBar: AppBar(title: Text(meal!.name)),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Image.network(meal!.thumbnail),
            SizedBox(height: 16),
            Text(meal!.instructions),
            SizedBox(height: 16),
            Text("Ingredients", style: TextStyle(fontSize: 20)),
            ...meal!.ingredients.entries
                .map((e) => Text("${e.key}: ${e.value}")),
            if (meal!.youtube.isNotEmpty)
              ElevatedButton(
                child: Text("Watch on YouTube"),
                onPressed: () {},
              )
          ],
        ),
      ),
    );
  }
}
