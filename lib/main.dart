import 'package:flutter/material.dart';


// todo stworzenie klasy pojedyńczego nawyku
// todo stworzenie klasy z listą nawyków
// todo stworzenie klasu user
// todo klasa do wyświetlania nawyków
// todo klasa do dowania nowych nawyków
// todo klasa do logowania użytkownika
void main() {
  runApp(const MyHome());
}

class MyHome extends StatelessWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: const Center(child: Text("Hello World"),),
      ),

    );
  }
}

