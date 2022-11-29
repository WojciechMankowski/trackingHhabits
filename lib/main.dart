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

class MyHome extends StatefulWidget {
  MyHome({Key? key}) : super(key: key);

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    Habits habits = Habits();
    habits.addHabit(Habit("Wypiłem 2 litry wody", "zdrowie", 0, false));
    habits.addHabit(Habit("Czytanie ksiąźki", "samorozwój", 0, false));
    List<Habit> listHabits = habits.getHabits();
    FirebaseDatabase database = FirebaseDatabase.instance;
    readDate() {
      DatabaseReference starCountRef =
          FirebaseDatabase.instance.ref().child("habits");

      starCountRef.onValue.listen((DatabaseEvent event) {
        Map items = event.snapshot.value as Map;
        final keys = items.keys.toList();
        for (var i in keys) {
          var item = items[i] as Map;
          String name_map = item["name"];
          String category_map = item['category'];
          var howday = 0;
          var isDone = false;
          Habit habit = Habit(name_map, category_map, howday, isDone);
          habits.addHabit(habit);
        }
      });
    }

    readDate();
    void _refresh() {
      setState(() {
        listHabits = habits.getHabits();
        print(listHabits);
      });
    }

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Text('Habit Tracker'),
            backgroundColor: Colors.greenAccent,
          ),
          body: Column(children: [
            for (var i = 0; i < listHabits.length; i++)
              HabitWidget(habit: listHabits[i]),
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
                ElevatedButton(
                  child: Text('Odśwież'),
                  onPressed: () {
                    setState(() {
                      listHabits = habits.getHabits();
                      for (var item in listHabits) {
                        print(item.name);
                      }
                    });
                  },
                ),
              ],
            ),
          ]),
        ));
  }
}
