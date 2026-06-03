import 'package:flutter/material.dart';
import '../utilitarios/tema_app.dart';
import 'ecra_quiz.dart';

class EcraCategorias extends StatelessWidget {
  const EcraCategorias({super.key});

  static const List<Map<String, dynamic>> categorias = [
    {
      'nome': 'Sistemas Operativos',
      'icone': Icons.computer,
      'cor': Color(0xFF6200EA),
      'descricao': '5 perguntas',
    },
    {
      'nome': 'Programação Web e Mobile',
      'icone': Icons.code,
      'cor': Color(0xFF0097A7),
      'descricao': '5 perguntas',
    },
    {
      'nome': 'Protocolos de Roteamento',
      'icone': Icons.router,
      'cor': Color(0xFFE65100),
      'descricao': '5 perguntas',
    },
    {
      'nome': 'Bases de Dados',
      'icone': Icons.storage,
      'cor': Color(0xFF2E7D32),
      'descricao': '5 perguntas',
    },
    {
      'nome': 'Redes de Computadores',
      'icone': Icons.lan,
      'cor': Color(0xFFC62828),
      'descricao': '5 perguntas',
    },
    {
      'nome': 'Segurança Informática',
      'icone': Icons.security,
      'cor': Color(0xFF4527A0),
      'descricao': '5 perguntas',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TemaApp.corFundo,
      appBar: AppBar(
        title: const Text('Escolhe uma Categoria'),
        backgroundColor: TemaApp.corPrimaria,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Selecciona o tema do quiz:',
              style: TextStyle(
                fontSize: 15,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: GridView.builder(
                itemCount: categorias.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 14,
                  mainAxisSpacing: 14,
                  childAspectRatio: 1.1,
                ),
                itemBuilder: (context, index) {
                  final cat = categorias[index];
                  return _QuadroCategoria(
                    nome: cat['nome'],
                    icone: cat['icone'],
                    cor: cat['cor'],
                    descricao: cat['descricao'],
                    aoClicar: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => EcraQuiz(
                          categoria: cat['nome'],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _QuadroCategoria extends StatelessWidget {
  final String nome;
  final IconData icone;
  final Color cor;
  final String descricao;
  final VoidCallback aoClicar;

  const _QuadroCategoria({
    required this.nome,
    required this.icone,
    required this.cor,
    required this.descricao,
    required this.aoClicar,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: aoClicar,
      child: Container(
        decoration: BoxDecoration(
          color: cor,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: cor.withValues(alpha:0.5),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icone, size: 38, color: Colors.white),
              const SizedBox(height: 10),
              Text(
                nome,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 4),
              Text(
                descricao,
                style: const TextStyle(
                  fontSize: 11,
                  color: Colors.white70,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}