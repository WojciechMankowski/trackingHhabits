import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:tracking_habits/Helpers/Habits.dart';
import 'package:tracking_habits/Helpers/habit.dart';
import 'package:tracking_habits/Widget/Add.dart';
import 'package:tracking_habits/Widget/HabitWidget.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// todo klasa do wyświetlania nawyków
// todo klasa do dowania nowych nawyków
// todo klasa do logowania użytkownika
Future<void> main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyHome());
}

class MyHome extends StatelessWidget {
  MyHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Habits habits = Habits();
    habits.addHabit(Habit("Wypiłem 2 litry wody", "zdrowie", 0, false));
    habits.addHabit(Habit("Czytanie ksiąźki", "samorozwój", 0, false));
    FirebaseDatabase database = FirebaseDatabase.instance;
    DatabaseReference starCountRef =
        FirebaseDatabase.instance.ref().child("habits");

    starCountRef.onValue.listen((DatabaseEvent event) {
      Map items = event.snapshot.value as Map;
      final keys = items.keys.toList();
      for (var i in keys) {
        var item = items[i] as Map;
        String name_map = items['nane'];
        String category_map = item['category'];
        String name = "";
        String category = "";
        if (name_map.runtimeType == String &&
            category_map.runtimeType == String) {
          name = name_map;
          category = category_map;
        }
        var howday = 0;
        var isDone = false;
        Habit habit = Habit(name, category, howday, isDone);
        habits.addHabit(habit);
      }
      for (var i = 0; i < habits.getHabits().length; i++) {
        print(habits.getHabits()[i].name);
      }

      // for (int i = 0; i < keys.length; i++) print(keys[i]);
    });

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
                ), 
                
              ],
            ),
          ]),
        ));
  }
}
