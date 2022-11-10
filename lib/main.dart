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
    habits
        .addHabit(Habit("Wypiłem 2 litry wody", "zdrowie", "water", 0, false));
    habits.addHabit(Habit("Czytanie ksiąźki", "samorozwój", "book", 0, false));
    int _selectedIndex = 0;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Habit Tracker'),
          backgroundColor: Colors.greenAccent,
        ),
        body: Column(
          children: [
            for (var i = 0; i < habits.getHabits().length; i++)
              HabitWidget(habit: habits.getHabits()[i]),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          // ignore: prefer_const_literals_to_create_immutables
          items: [
            const BottomNavigationBarItem(
                icon: Icon(Icons.home), label: "Home"),
            const BottomNavigationBarItem(
                icon: Icon(Icons.add), label: "Dodaj nowy nawyk"),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          // onTap: ,
        ),
      ),
    );
  }
}
