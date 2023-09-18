import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food/models/meal.dart';

class FavoritesMealsNotifier extends StateNotifier<List<Meal>> {
  FavoritesMealsNotifier() : super([]);

  bool toggleMealFavoriteStatus(Meal meal) {
    final mealIsfavorite = state.contains(meal);
    // khi mealIsfavorite trả về true thì đã có món đó trong list
    //duyệt các món m khác , nếu thỏa mãn khác id thì add vào list mới
    if (mealIsfavorite) {
      state = state.where((m) => m.id != meal.id).toList(); // xóa
      return false;
    } else {
      state = [...state, meal]; // spread set mở rộng ra,add new meal vào
      return true;
    }
  }
}

final favoriteMealsProvider =
    StateNotifierProvider<FavoritesMealsNotifier, List<Meal>>((ref) {
  return FavoritesMealsNotifier();
});
