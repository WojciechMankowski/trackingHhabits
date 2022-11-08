// ignore_for_file: no_logic_in_create_state

import 'package:flutter/material.dart';

class TitleWidget  extends StatefulWidget {
  const TitleWidget ({super.key, required this.title});
  final String title;
  @override
  State<TitleWidget > createState() => _TitleState(title);
}

class _TitleState extends State<TitleWidget > {
  _TitleState(String this.title);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      // ignore: prefer_const_constructors
      style: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: Colors.greenAccent,
      ),
    );
  }
}
