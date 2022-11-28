import 'package:flutter/material.dart';
import 'package:tracking_habits/Helpers/Habits.dart';
import 'package:tracking_habits/Helpers/habit.dart';
import 'package:tracking_habits/Widget/Add.dart';
import 'package:tracking_habits/Widget/HabitWidget.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_database/firebase_database.dart';

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
    habits
        .addHabit(Habit("Wypiłem 2 litry wody", "zdrowie", "water", 0, false));
    habits.addHabit(Habit("Czytanie ksiąźki", "samorozwój", "book", 0, false));
    FirebaseDatabase database = FirebaseDatabase.instance;
    DatabaseReference starCountRef = FirebaseDatabase.instance.ref('habits/');
    starCountRef.onValue.listen((DatabaseEvent event) {
      final data = event.snapshot.value;
      print(data);
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
