import 'package:flutter/material.dart';
import '../utilitarios/tema_app.dart';
import '../modelos/pontuacao.dart';

class CartaoPontuacao extends StatelessWidget {
  final Pontuacao pontuacao;
  final int posicao;

  const CartaoPontuacao({
    super.key,
    required this.pontuacao,
    required this.posicao,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: Colors.grey.withOpacity(0.2), blurRadius: 4),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('$posicao.  ${pontuacao.nomeUtilizador}',
              style: TemaApp.estiloOpcao),
          Text('${pontuacao.pontos} pts',
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: TemaApp.corPrimaria)),
        ],
      ),
    );
  }
}