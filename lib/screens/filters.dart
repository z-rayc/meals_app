import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/providers/filters_provider.dart';

/// This screen is used to display the filters.
/// The user can toggle allergen filters and complexity filters.
class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textStyleTitle = Theme.of(context).textTheme.titleLarge!.copyWith(
          color: Theme.of(context).colorScheme.onBackground,
        );
    final textStyleSubtitle = Theme.of(context).textTheme.labelMedium!.copyWith(
          color: Theme.of(context).colorScheme.onBackground,
        );
    final activeFilters = ref.watch(allergenFiltersProvider);
    final activeComplexityFilters = ref.watch(complexityFiltersProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Toggle buttons for the allergen filters
            Text('Allergen Filters', style: textStyleTitle),
            SwitchListTile(
              value: activeFilters[AllergenFilter.glutenFree]!,
              onChanged: (isChecked) {
                ref
                    .read(allergenFiltersProvider.notifier)
                    .setAllergenFilter(AllergenFilter.glutenFree, isChecked);
              },
              title: Text('Gluten-free', style: textStyleTitle),
              subtitle: Text(
                'Only include gluten-free meals.',
                style: textStyleSubtitle,
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: activeFilters[AllergenFilter.lactoseFree]!,
              onChanged: (isChecked) {
                ref
                    .read(allergenFiltersProvider.notifier)
                    .setAllergenFilter(AllergenFilter.lactoseFree, isChecked);
              },
              title: Text('Lactose-free', style: textStyleTitle),
              subtitle: Text(
                'Only include lactose-free meals.',
                style: textStyleSubtitle,
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: activeFilters[AllergenFilter.vegetarian]!,
              onChanged: (isChecked) {
                ref
                    .read(allergenFiltersProvider.notifier)
                    .setAllergenFilter(AllergenFilter.vegetarian, isChecked);
              },
              title: Text('Vegetarian', style: textStyleTitle),
              subtitle: Text(
                'Only include vegetarian meals.',
                style: textStyleSubtitle,
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: activeFilters[AllergenFilter.vegan]!,
              onChanged: (isChecked) {
                ref
                    .read(allergenFiltersProvider.notifier)
                    .setAllergenFilter(AllergenFilter.vegan, isChecked);
              },
              title: Text('Vegan', style: textStyleTitle),
              subtitle: Text(
                'Only include vegan meals.',
                style: textStyleSubtitle,
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            const SizedBox(height: 20),
            // Radio buttons for the complexity filter
            Text('Complexity Filters', style: textStyleTitle),
            RadioListTile<List<Complexity>>(
              title: Text('All', style: textStyleTitle),
              subtitle: Text(
                'Include all complexity levels.',
                style: textStyleSubtitle,
              ),
              value: const [],
              groupValue: activeComplexityFilters,
              onChanged: (value) {
                ref.read(complexityFiltersProvider.notifier).setFilters(value!);
              },
            ),
            RadioListTile<List<Complexity>>(
              title: Text('Simple', style: textStyleTitle),
              subtitle: Text(
                'Only include simple meals.',
                style: textStyleSubtitle,
              ),
              value: const [Complexity.simple],
              groupValue: activeComplexityFilters,
              onChanged: (value) {
                ref.read(complexityFiltersProvider.notifier).setFilters(value!);
              },
            ),
            RadioListTile<List<Complexity>>(
              title: Text('Challenging', style: textStyleTitle),
              subtitle: Text(
                'Only include challenging meals.',
                style: textStyleSubtitle,
              ),
              value: const [Complexity.challenging],
              groupValue: activeComplexityFilters,
              onChanged: (value) {
                ref.read(complexityFiltersProvider.notifier).setFilters(value!);
              },
            ),
            RadioListTile<List<Complexity>>(
              title: Text('Hard', style: textStyleTitle),
              subtitle: Text(
                'Only include hard meals.',
                style: textStyleSubtitle,
              ),
              value: const [Complexity.hard],
              groupValue: activeComplexityFilters,
              onChanged: (value) {
                ref.read(complexityFiltersProvider.notifier).setFilters(value!);
              },
            ),
          ],
        ),
      ),
    );
  }
}
