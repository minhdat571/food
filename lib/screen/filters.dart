import 'package:flutter/material.dart';
import 'package:food/widgets/filer_switch.dart';
import 'package:food/providers/filters_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filtersProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      body: Column(
        children: [
          FilterSwitch(
            title: "Fluten-free",
            subtitle: "Only gluten-free meals.",
            value: activeFilters[Filter.glutenFree]!,
            onChange: (newValue) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.glutenFree, newValue);
            },
          ),
          FilterSwitch(
            title: "Lactose-free",
            subtitle: "Only lactose-free meals.",
            value: activeFilters[Filter.lactoseFree]!,
            onChange: (newValue) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.lactoseFree, newValue);
            },
          ),
          FilterSwitch(
            title: "Vegetarian",
            subtitle: "Only vegetarian meals.",
            value: activeFilters[Filter.vegetarian]!,
            onChange: (newValue) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.vegetarian, newValue);
            },
          ),
          FilterSwitch(
            title: "Vegan",
            subtitle: "Only vegan meals.",
            value: activeFilters[Filter.vegan]!,
            onChange: (newValue) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.vegan, newValue);
            },
          ),
        ],
      ),
    );
  }
}
