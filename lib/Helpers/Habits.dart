import 'dart:core';

import 'package:tracking_habits/Helpers/habit.dart';

class Habits {
  List<Habit> habits = [];

  addHabit(Habit habit) {
    habits.add(habit);
    print("we funkcji add ${this.habits.length}");
  }

  removeHabit(Habit habit) {
    habits.remove(habit);
  }

  getHabits() {
    return habits;
  }
}
