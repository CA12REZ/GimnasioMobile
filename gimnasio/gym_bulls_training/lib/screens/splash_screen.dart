import 'package:flutter/material.dart';
import 'dart:async'; // Para temporizador

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navega automáticamente después de 3 segundos
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/login');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 252, 252, 252), // Color de fondo del splash screen
      body: Center(
        child: Image.asset(
          'assets/imagenes/mdtraining.png', // Ruta del logo del splash screen
          width: 150, // Ajusta el tamaño del logo
        ),
      ),
    );
  }
}
