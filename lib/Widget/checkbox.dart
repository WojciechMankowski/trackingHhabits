import 'package:flutter/material.dart';

class CheckBox extends StatelessWidget {
  const CheckBox({super.key, required this.isDone});
  final bool isDone;
  @override
  Widget build(BuildContext context) {
    return CheckBox(isDone: isDone);
  }
}
