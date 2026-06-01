import 'package:flutter/material.dart';
import 'utilitarios/tema_app.dart';
import 'ecras/ecra_inicial.dart';

void main() {
  runApp(const QuizApp());
}

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz Mobile',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: TemaApp.corPrimaria,
        scaffoldBackgroundColor: TemaApp.corFundo,
      ),
      home: const EcraInicial(),
    );
  }
}