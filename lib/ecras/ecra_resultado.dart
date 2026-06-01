import 'package:flutter/material.dart';
import '../utilitarios/tema_app.dart';
import 'ecra_principal.dart';
import 'ecra_categorias.dart';

class EcraResultado extends StatelessWidget {
  final int pontuacao;
  final String categoria;

  const EcraResultado({
    super.key,
    required this.pontuacao,
    required this.categoria,
  });

  String get _mensagem {
    if (pontuacao >= 40) return 'Excelente! 🏆';
    if (pontuacao >= 30) return 'Muito Bom! 👏';
    if (pontuacao >= 20) return 'Bom trabalho! 💪';
    return 'Continua a tentar! 📚';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TemaApp.corFundo,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.emoji_events,
                  size: 100, color: TemaApp.corPrimaria),
              const SizedBox(height: 20),
              const Text('Quiz Concluído!', style: TemaApp.estiloTitulo),
              const SizedBox(height: 6),
              Text(categoria,
                  style: const TextStyle(color: Colors.grey, fontSize: 14)),
              const SizedBox(height: 16),
              Text('$pontuacao pontos',
                  style: const TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: TemaApp.corPrimaria)),
              const SizedBox(height: 8),
              Text(_mensagem,
                  style: const TextStyle(fontSize: 20, color: Colors.grey)),
              const SizedBox(height: 40),

              // jogar outra categoria
              ElevatedButton.icon(
                onPressed: () => Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (_) => const EcraCategorias()),
                  (route) => route.isFirst,
                ),
                icon: const Icon(Icons.replay),
                label: const Text('Jogar Outra Categoria'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: TemaApp.corPrimaria,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
              ),
              const SizedBox(height: 16),

              // voltar ao início
              OutlinedButton.icon(
                onPressed: () => Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (_) => const EcraPrincipal()),
                  (route) => false,
                ),
                icon: const Icon(Icons.home),
                label: const Text('Início'),
                style: OutlinedButton.styleFrom(
                  foregroundColor: TemaApp.corPrimaria,
                  side: const BorderSide(color: TemaApp.corPrimaria),
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}