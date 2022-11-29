import 'dart:core';

import 'package:tracking_habits/Helpers/habit.dart';

class Habits {
  List<Habit> habits = [];

  addHabit(Habit habit) {
    print(habit.name);
    habits.add(habit);
  }

  removeHabit(Habit habit) {
    habits.remove(habit);
  }

  getHabits() {
    return habits;
  }
}
