import 'package:flutter/material.dart';

class ChecBox extends StatefulWidget {
  const ChecBox({super.key, required this.isDone});
  final bool isDone;

  @override
  State<ChecBox> createState() => _ChecBoxState(isDone);
}

class _ChecBoxState extends State<ChecBox> {
  _ChecBoxState(this.isDone);
  final bool isDone;
  bool isCheck = false;
  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      return Colors.lightGreen;
    }

    return Checkbox(
      checkColor: Colors.yellow,
      fillColor: MaterialStateProperty.resolveWith(getColor),
      value: isCheck,
      onChanged: (bool? value) {
        setState(() {
          isCheck = value!;
        });
      },
    );
  }
}
