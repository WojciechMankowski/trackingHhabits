import 'dart:core';

class Habit {
  late String name;
  late String category;
  late String icon;
  late int howday;
  late bool isDone;

  Habit(String name, String category, String icon, int howday, bool isDone) {
    this.name = name;
    this.category = category;
    this.icon = icon;
    this.howday = howday;
    this.isDone = isDone;
  }
  isSucceedHabits() {
    isDone = true;
  }
}
