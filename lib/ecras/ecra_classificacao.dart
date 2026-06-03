import 'package:flutter/material.dart';
import '../servicos/servico_api.dart';
import '../servicos/servico_autenticacao.dart';
import '../componentes/cartao_pontuacao.dart';
import '../utilitarios/tema_app.dart';

class EcraClassificacao extends StatelessWidget {
  const EcraClassificacao({super.key});

  @override
  Widget build(BuildContext context) {
    final servico = ServicoApi(ServicoAutenticacao());

    return Scaffold(
      backgroundColor: TemaApp.corFundo,
      appBar: AppBar(
        title: const Text('Classificação'),
        backgroundColor: TemaApp.corPrimaria,
        foregroundColor: Colors.white,
      ),
      body: FutureBuilder(
        future: servico.buscarClassificacao(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          final lista = snapshot.data ?? [];
          if (lista.isEmpty) {
            return const Center(
                child: Text('Sem pontuações ainda',
                    style: TextStyle(color: Colors.grey)));
          }
          return ListView.builder(
            itemCount: lista.length,
            itemBuilder: (context, index) => CartaoPontuacao(
              pontuacao: lista[index],
              posicao: index + 1,
            ),
          );
        },
      ),
    );
  }
}