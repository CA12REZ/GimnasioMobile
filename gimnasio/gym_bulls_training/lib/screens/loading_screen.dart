import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[900], // Fondo rojo oscuro
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white), // Indicador de progreso en blanco
              strokeWidth: 4.0, // Grosor del indicador
            ),
            const SizedBox(height: 20), // Espaciado entre el indicador y el texto
            const Text(
              'Cargando...', // Texto debajo del indicador
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2, // Espaciado entre letras
              ),
            ),
          ],
        ),
      ),
    );
  }
}
