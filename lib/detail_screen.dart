import 'package:flutter/material.dart';
import 'confirm_screen.dart';

class DetailScreen extends StatelessWidget {
  final String numero;

  DetailScreen({required this.numero});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalle'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Número seleccionado: $numero'),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('Reservar'),
              onPressed: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ConfirmScreen(),
                  ),
                );

                if (result == true) {
                  Navigator.pop(context, true);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}