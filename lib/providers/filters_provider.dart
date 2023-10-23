import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/providers/meals_provider.dart';
import 'package:meals_app/models/meal.dart';

/// AllergenFilter represents the allergen filters that can be applied.
enum AllergenFilter {
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan,
}

/// This provider is used to store the which allergen filters are active.
class AllergenFiltersNotifier extends StateNotifier<Map<AllergenFilter, bool>> {
  // If a filter is active, the meal must match the filter
  AllergenFiltersNotifier()
      : super({
          AllergenFilter.glutenFree: false,
          AllergenFilter.lactoseFree: false,
          AllergenFilter.vegetarian: false,
          AllergenFilter.vegan: false,
        });

  void setAllergenFilters(Map<AllergenFilter, bool> chosenFilters) {
    state = chosenFilters;
  }

  void setAllergenFilter(AllergenFilter filter, bool isActive) {
    state = {
      ...state,
      filter: isActive,
    };
  }
}

final allergenFiltersProvider =
    StateNotifierProvider<AllergenFiltersNotifier, Map<AllergenFilter, bool>>(
        (ref) => AllergenFiltersNotifier());

/// This provider is used to store the which complexity filters are active.
class ComplexityFiltersNotifier extends StateNotifier<List<Complexity>> {
  // If a complexity filter is active, the meal must match the filter
  ComplexityFiltersNotifier() : super([]);

  void setFilters(List<Complexity> chosenFilters) {
    state = chosenFilters;
  }
}

final complexityFiltersProvider =
    StateNotifierProvider<ComplexityFiltersNotifier, List<Complexity>>(
        (ref) => ComplexityFiltersNotifier());

final filteredMealsProvider = Provider((ref) {
  final meals = ref.watch(mealsProvider);
  final activeAllergenFilters = ref.watch(allergenFiltersProvider);
  final activeComplexityFilters = ref.watch(complexityFiltersProvider);

  return meals.where((meal) {
    // Do not include meal if the filter is set
    // and the meal does not match the filter
    if (activeAllergenFilters[AllergenFilter.glutenFree]! &&
        !meal.isGlutenFree) {
      return false;
    }
    if (activeAllergenFilters[AllergenFilter.lactoseFree]! &&
        !meal.isLactoseFree) {
      return false;
    }
    if (activeAllergenFilters[AllergenFilter.vegetarian]! &&
        !meal.isVegetarian) {
      return false;
    }
    if (activeAllergenFilters[AllergenFilter.vegan]! && !meal.isVegan) {
      return false;
    }
    if (activeComplexityFilters.contains(Complexity.simple) &&
        meal.complexity != Complexity.simple) {
      return false;
    }
    if (activeComplexityFilters.contains(Complexity.challenging) &&
        meal.complexity != Complexity.challenging) {
      return false;
    }
    if (activeComplexityFilters.contains(Complexity.hard) &&
        meal.complexity != Complexity.hard) {
      return false;
    }
    return true;
  }).toList();
});
