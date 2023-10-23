import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/data/dummy_data.dart';

/// This provider is used to store the meals.
final mealsProvider = Provider((ref) {
  return dummyMeals;
});
