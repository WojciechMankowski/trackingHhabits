import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:tracking_habits/Helpers/habit.dart';
import 'package:tracking_habits/Widget/checkbox.dart';
import 'package:tracking_habits/Widget/title.dart';

class HabitWidget extends StatelessWidget {
  const HabitWidget({super.key, required this.habit});
  final Habit? habit;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CheckBox(
          isDone: habit!.isDone,
        ),
        TitleWidget(title: habit!.name)
      ],
    );
  }
}
