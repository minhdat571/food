import 'package:flutter/material.dart';
import 'package:food/data/dummy_data.dart';
import 'package:food/models/meal.dart';
import 'package:food/screen/meals.dart';
import 'package:food/widgets/category_grid_item.dart';
import 'package:food/models/category.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key, required this.availableMeals});
  final List<Meal> availableMeals;

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  // sẽ đc gán giá trị sau khi gọi initState
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
      lowerBound: 0,
      upperBound: 1, // default
    );
    _animationController.forward(); // chạy animation
  }

  @override
  void dispose() {
    _animationController.dispose(); // xóa sau wiget để tránh tràn bộ nhớ
    super.dispose();
  }

  void _selectCatergory(BuildContext context, Category category) {
    final filteredMeals = widget.availableMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();
    //Navigator.push(context, route);
    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => MealsScreen(
              meals: filteredMeals,
              title: category.title,
            )));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _animationController,
        child: SafeArea(
          child: GridView(
            padding: const EdgeInsets.all(24),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
            ),
            children: [
              //availableCategories.map((category) => CategoryGridItem(category: category,)).toList()
              for (final category in availableCategories)
                CategoryGridItem(
                  category: category,
                  onSelectedCategory: () {
                    _selectCatergory(context, category);
                  },
                )
            ],
          ),
        ),
        builder: (context, child) => SlideTransition(
              position: Tween(
                begin: const Offset(0, 0.3),
                end: const Offset(0, 0),
              ).animate(CurvedAnimation(
                  parent: _animationController, curve: Curves.easeInOut)),
              child: child,
            ));
  }
}
