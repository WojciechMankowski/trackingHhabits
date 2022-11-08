import 'package:flutter/material.dart';
import 'package:tracking_habits/Helpers/Habits.dart';
import 'package:tracking_habits/Helpers/habit.dart';
import 'package:tracking_habits/Widget/HabitWidget.dart';

// todo klasa do wyświetlania nawyków
// todo klasa do dowania nowych nawyków
// todo klasa do logowania użytkownika
void main() {
  runApp(const MyHome());
}

class MyHome extends StatelessWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Habits habits = Habits();
    habits.addHabit(Habit("name", "category", "icon", 0, false));
    habits.addHabit(Habit("name", "category", "icon", 0, false));

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Habit Tracker'),
          backgroundColor: Colors.greenAccent,
        ),
        body: HabitWidget(habit: habits),
      ),
    );
  }
}
