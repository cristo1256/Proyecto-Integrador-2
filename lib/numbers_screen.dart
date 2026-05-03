import 'package:flutter/material.dart';
import 'detail_screen.dart';

class NumbersScreen extends StatefulWidget {
  @override
  _NumbersScreenState createState() => _NumbersScreenState();
}

class _NumbersScreenState extends State<NumbersScreen> {
  List<Map<String, dynamic>> numeros = List.generate(
    20,
    (index) => {
      "numero": (index + 1).toString().padLeft(2, '0'),
      "reservado": false
    },
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de números'),
      ),
      body: ListView.builder(
        itemCount: numeros.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text('Número ${numeros[index]["numero"]}'),
              subtitle: Text(
                numeros[index]["reservado"]
                    ? 'Reservado'
                    : 'Disponible',
              ),
              trailing: Icon(Icons.arrow_forward),
              onTap: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailScreen(
                      numero: numeros[index]["numero"],
                    ),
                  ),
                );

                if (result == true) {
                  setState(() {
                    numeros[index]["reservado"] = true;
                  });
                }
              },
            ),
          );
        },
      ),
    );
  }
}