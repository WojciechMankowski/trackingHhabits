import 'dart:core';

class Habit {
  late String name;
  late String category;
  late String icon;
  late int howday;
  late bool isDone;

  Habit(this.name, this.category, this.howday, this.isDone) {}
  isSucceedHabits() {
    isDone = true;
  }

  // Habit.fromMap(Map<String, dynamic> data) {
  //   name = data['name'];
  //   category = data['category'];
  //   howday = data['howday'];
  //   isDone = data['isDone'];
  // }
}
