import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class IconWidget extends StatelessWidget {
  const IconWidget({super.key, required this.icon});
  final String icon;
  @override
  Widget build(BuildContext context) {
    if (icon == "book") {
      return const Icon(
        Icons.book,
        size: 50,
        color: Colors.green,
      );
    } else if (icon == "water") {
      return const Icon(
        Icons.local_drink,
        size: 50,
        color: Colors.green,
      );
    } else {
      return const Icon(
        Icons.no_cell,
        size: 50,
      );
    }

    // return const Icon(
    //   Icons.ac_unit,
    //   size: 50,
    // );
  }
}
