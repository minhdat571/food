import 'package:flutter/material.dart';
import 'package:food/models/meal.dart';
import 'package:food/screen/meal_details.dart';
import 'package:food/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({
    super.key,
    required this.meals,
    this.title,
  });

  final String? title;
  final List<Meal> meals;

  void selectMeal(BuildContext context, Meal meal) {
    Navigator.pop(context);
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealDetailsScreen(
          meal: meal,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content =
        ListView.builder(itemBuilder: (ctx, index) => Text(meals[index].title));
    if (meals.isEmpty) {
      content = Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('oh .. không có món nào cả',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground)),
          const SizedBox(
            height: 16,
          ),
          Text(
            'Thử chọn cái khác xem!',
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          )
        ],
      ));
    }

    if (meals.isNotEmpty) {
      content = ListView.builder(
          itemCount: meals.length, //cho biết độ dài để tùy chọn chế độ xem
          itemBuilder: (ctx, index) => MealItem(
                meal: meals[index],
                onSelectMeal: (meal) {
                  selectMeal(context, meal);
                },
              ));
    }
    if (title == null) {
      return content;
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(title!),
        ),
        body: content);
  }
}
