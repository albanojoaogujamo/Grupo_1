import 'package:flutter/material.dart';
import '../modelos/pergunta.dart';
import '../servicos/servico_api.dart';
import 'package:vertice_v1/servicos/servico_autenticacao.dart';
import '../componentes/barra_progresso.dart';
import '../utilitarios/tema_app.dart';
import 'ecra_resultado.dart';

class EcraQuiz extends StatefulWidget {
  final String categoria;

  const EcraQuiz({super.key, required this.categoria});

  @override
  State<EcraQuiz> createState() => _EcraQuizState();
}

class _EcraQuizState extends State<EcraQuiz> {
  final ServicoApi _servico = ServicoApi(ServicoAutenticacao());
  List<Pergunta> _perguntas = [];
  int _indiceActual = 0;
  int _pontuacao = 0;
  String? _respostaSelecionada;
  bool _respondeu = false;
  bool _carregando = true;

  @override
  void initState() {
    super.initState();
    _carregarPerguntas();
  }

  Future<void> _carregarPerguntas() async {
    final todas = await _servico.buscarPerguntas();
    // filtra só as perguntas da categoria escolhida
    final filtradas = todas
        .where((p) => p.categoria == widget.categoria)
        .toList();
    setState(() {
      _perguntas = filtradas;
      _carregando = false;
    });
  }

  void _seleccionarResposta(String resposta) {
    if (_respondeu) return;
    setState(() {
      _respostaSelecionada = resposta;
      _respondeu = true;
      if (resposta == _perguntas[_indiceActual].respostaCorreta) {
        _pontuacao += 10;
      }
    });
    Future.delayed(const Duration(seconds: 1), _proximaPergunta);
  }

  void _proximaPergunta() {
    if (_indiceActual < _perguntas.length - 1) {
      setState(() {
        _indiceActual++;
        _respostaSelecionada = null;
        _respondeu = false;
      });
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => EcraResultado(
            pontuacao: _pontuacao,
            categoria: widget.categoria,
          ),
        ),
      );
    }
  }

  Widget cartaoOpcao({
    required String texto,
    required bool correta,
    required bool errada,
    required VoidCallback aoSeleccionar,
  }) {
    return GestureDetector(
      onTap: aoSeleccionar,
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: correta
              ? Colors.green.shade100
              : errada
                  ? Colors.red.shade100
                  : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Text(
          texto,
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_carregando) {
      return const Scaffold(
          body: Center(child: CircularProgressIndicator()));
    }

    if (_perguntas.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: Text(widget.categoria),
          backgroundColor: TemaApp.corPrimaria,
          foregroundColor: Colors.white,
        ),
        body: const Center(
          child: Text('Sem perguntas para esta categoria.'),
        ),
      );
    }

    final pergunta = _perguntas[_indiceActual];

    return Scaffold(
      backgroundColor: TemaApp.corFundo,
      appBar: AppBar(
        title: Text(widget.categoria),
        backgroundColor: TemaApp.corPrimaria,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BarraProgresso(
              perguntaActual: _indiceActual + 1,
              totalPerguntas: _perguntas.length,
            ),
            const SizedBox(height: 30),
            Text(pergunta.texto, style: TemaApp.estiloPergunta),
            const SizedBox(height: 20),
            ...pergunta.opcoes.map((opcao) => cartaoOpcao(
                  texto: opcao,
                  correta: _respondeu &&
                      opcao == pergunta.respostaCorreta,
                  errada: _respondeu &&
                      _respostaSelecionada == opcao &&
                      opcao != pergunta.respostaCorreta,
                  aoSeleccionar: () => _seleccionarResposta(opcao),
                )),
          ],
        ),
      ),
    );
  }
}