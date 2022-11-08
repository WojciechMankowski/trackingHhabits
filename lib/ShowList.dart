import 'package:flutter/material.dart';
import 'package:tracking_habits/Helpers/Habits.dart';
import 'package:tracking_habits/Widget/HabitWidget.dart';

class ShowListHabit extends StatelessWidget {
  const ShowListHabit({super.key, required this.habits});
  final List<Habits> habits;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (var i = 0; i < habits.length; i++) HabitWidget(habit: habits[i])
      ],
    );
  }
}
