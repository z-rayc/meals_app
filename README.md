# Meals App

## App specification

This app is a simple meal app that allows you to view, filter and favorite meals. It has a page for all categories, and a list for meals of each category. In the list you can see a summary of the meal. Each meal shows you the ingredients and steps to prepare it.

## App architecture

The app is built using Flutter and Dart.

## User stories

- As a user, I want to see a list of all categories of meals.
- As a user, I want to see a list of all meals of a category.
- As a user, I want to see the details of a meal.
- As a user, I want to favorite a meal.
- As a user, I want to add and remove meals.
- As a user, I want to edit meals.
- As a user, I want to filter meals by allergens.
- As a user, I want to filter meals by complexity.
- As a user, I want to filter meals by affordability.
- As a user, I want to filter meals by ingredients.
- As a user, I want to filter meals by duration to make.
- As a user, I want to see my favorite meals.
- As a user, I want to favorite and unfavorite meals.

## File and folder structure

```bash
├── lib
│   ├── data
│   │   └── dummy_data.dart
│   ├── models
│   │   ├── category.dart
│   │   └── meal.dart
│   ├── providers
│   │   ├── favorites_provider.dart
│   │   ├── filters_provider.dart
│   │   └── meals_provider.dart
│   ├── screens
│   │   ├── categories.dart
│   │   ├── filters.dart
│   │   ├── meal_details.dart
│   │   ├── meals.dart
│   │   └── tabs.dart
│   ├── widgets
│   │   ├── category_grid_item.dart
│   │   ├── main_drawer.dart
│   │   ├── meal_item_trait.dart
│   │   └── meal_item.dart
│   └── main.dart
├── pubspec.lock
├── pubspec.yaml
└── README.md
```

## Additional functionality

You can filter meal by complexity.
