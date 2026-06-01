import 'package:flutter/material.dart';
import '../utilitarios/tema_app.dart';

class BarraProgresso extends StatelessWidget {
  final int perguntaActual;
  final int totalPerguntas;

  const BarraProgresso({
    super.key,
    required this.perguntaActual,
    required this.totalPerguntas,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Pergunta $perguntaActual de $totalPerguntas',
          style: const TextStyle(fontSize: 14, color: Colors.grey),
        ),
        const SizedBox(height: 6),
        LinearProgressIndicator(
          value: perguntaActual / totalPerguntas,
          backgroundColor: Colors.grey[300],
          color: TemaApp.corPrimaria,
          minHeight: 8,
        ),
      ],
    );
  }
}