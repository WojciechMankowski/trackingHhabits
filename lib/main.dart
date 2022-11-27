import 'package:flutter/material.dart';
import 'package:tracking_habits/Helpers/Habits.dart';
import 'package:tracking_habits/Helpers/habit.dart';
import 'package:tracking_habits/Widget/Add.dart';
import 'package:tracking_habits/Widget/HabitWidget.dart';

// todo klasa do wyświetlania nawyków
// todo klasa do dowania nowych nawyków
// todo klasa do logowania użytkownika
void main() {
  runApp(MyHome());
}

class MyHome extends StatelessWidget {
  MyHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Habits habits = Habits();
    habits
        .addHabit(Habit("Wypiłem 2 litry wody", "zdrowie", "water", 0, false));
    habits.addHabit(Habit("Czytanie ksiąźki", "samorozwój", "book", 0, false));

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Text('Habit Tracker'),
            backgroundColor: Colors.greenAccent,
          ),
          body: Column(children: [
            for (var i = 0; i < habits.getHabits().length; i++)
              HabitWidget(habit: habits.getHabits()[i]),
            Row(
              children: [
                Builder(
                  builder: (context) => ElevatedButton(
                    child: Text('Open route'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MyForm(habits: habits)),
                      );
                    },
                  ),
                )
              ],
            ),
          ]),
        ));
  }
}

class SecondRoute extends StatelessWidget {
  SecondRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("SecondRoute"),
    );
  }
}
