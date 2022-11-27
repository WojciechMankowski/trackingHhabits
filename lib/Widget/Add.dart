import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:tracking_habits/Helpers/habit.dart';
import 'package:flutter/material.dart';
import 'package:tracking_habits/Widget/Icon.dart';
import 'package:tracking_habits/Widget/IconWidget.dart';
import 'package:tracking_habits/Widget/Input.dart';
import '../Helpers/Habits.dart';

class MyForm extends StatelessWidget {
  const MyForm({super.key, required this.habits});
  final Habits habits;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: const Text('Habit Tracker'),
              backgroundColor: Colors.greenAccent,
            ),
            body: Column(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const Text("SecondRoute"),
                const Input(title: "nazwa nawyku"),
                const Input(title: "Kategoria"),
                IconsWidget(),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Wróć do strony głównej'),
                )
              ],
            )));
  }
}
