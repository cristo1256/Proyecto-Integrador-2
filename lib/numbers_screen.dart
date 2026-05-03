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
        title: Text('Selecciona tu número'),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: GridView.builder(
          itemCount: numeros.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 1.1,
          ),
          itemBuilder: (context, index) {
            bool reservado = numeros[index]["reservado"];

            return GestureDetector(
              onTap: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => DetailScreen(
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
              child: Card(
                color: reservado ? Colors.grey : Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 4,
                child: Center(
                  child: Text(
                    numeros[index]["numero"],
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: reservado ? Colors.white : Color.fromARGB(255, 61, 41, 239),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}