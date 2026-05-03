import 'package:flutter/material.dart';
import 'numbers_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inicio'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Ver números'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NumbersScreen()),
            );
          },
        ),
      ),
    );
  }
}