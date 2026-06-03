import 'package:flutter/material.dart';
import '../utilitarios/tema_app.dart';
import 'ecra_principal.dart';

class EcraInicial extends StatefulWidget {
  const EcraInicial({super.key});

  @override
  State<EcraInicial> createState() => _EcraInicialState();
}

class _EcraInicialState extends State<EcraInicial> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const EcraPrincipal()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TemaApp.corPrimaria,
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.quiz, size: 80, color: Colors.white),
            SizedBox(height: 20),
            Text('Quiz Mobile',
                style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
            SizedBox(height: 10),
            Text('Sistemas Operativos · Web e Mobile · Roteamento',
                style: TextStyle(fontSize: 13, color: Colors.white70),
                textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }