import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_app/main.dart';

void main() {
  testWidgets('App loads CategoriesScreen', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    // Проверува дали постои AppBar со наслов "Categories"
    expect(find.text("Categories"), findsOneWidget);
  });
}
