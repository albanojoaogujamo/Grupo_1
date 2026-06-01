import 'package:flutter/material.dart';
import '../utilitarios/tema_app.dart';
import 'ecra_categorias.dart';       // ← mudou aqui
import 'ecra_classificacao.dart';
import 'ecra_perfil.dart';

class EcraPrincipal extends StatelessWidget {
  const EcraPrincipal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TemaApp.corFundo,
      appBar: AppBar(
        title: const Text('Quiz Mobile'),
        backgroundColor: TemaApp.corPrimaria,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.quiz, size: 80, color: TemaApp.corPrimaria),
            const SizedBox(height: 20),
            const Text('Bem-vindo ao Quiz!', style: TemaApp.estiloTitulo),
            const SizedBox(height: 8),
            const Text('6 categorias · 5 perguntas cada',
                style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 40),
            ElevatedButton.icon(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const EcraCategorias())),
              icon: const Icon(Icons.play_arrow),
              label: const Text('Iniciar Quiz'),
              style: ElevatedButton.styleFrom(
                backgroundColor: TemaApp.corPrimaria,
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(
                      builder: (_) => const EcraClassificacao())),
              icon: const Icon(Icons.leaderboard),
              label: const Text('Classificação'),
              style: ElevatedButton.styleFrom(
                backgroundColor: TemaApp.corSecundaria,
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const EcraPerfil())),
              icon: const Icon(Icons.person),
              label: const Text('Perfil'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey,
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}