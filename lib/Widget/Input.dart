import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Input extends StatelessWidget {
  const Input({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    const IconData check = IconData(0xe156, fontFamily: 'MaterialIcons');
    print(check.codePoint);
    if (title == "nazwa nawyku") {
      return Container(
        child: TextFormField(
          decoration: const InputDecoration(
            hintText: 'Nazwa nawyku',
          ),
          validator: (String? value) {
            if (value == null || value.isEmpty) {
              return 'Please enter some text';
            }
            return null;
          },
        ),
      );
    } else if (title == "kategoria") {
      return Container(
        child: TextFormField(
          decoration: const InputDecoration(
            hintText: 'Kaegoria',
          ),
          validator: (String? value) {
            if (value == null || value.isEmpty) {
              return 'Please enter some text';
            }
            return null;
          },
        ),
      );
    } else {
      return Container(
        child: TextFormField(
          decoration: const InputDecoration(
            hintText: 'Nazwa nawyku nie może być pusta',
          ),
          validator: (String? value) {
            if (value == null || value.isEmpty) {
              return 'Please enter some text';
            }
            return null;
          },
        ),
      );
    }
  }
}
