class Pergunta {
  final String id;
  final String texto;
  final List<String> opcoes;
  final String respostaCorreta;
  final String categoria;

  Pergunta({
    required this.id,
    required this.texto,
    required this.opcoes,
    required this.respostaCorreta,
    required this.categoria,
  });

  factory Pergunta.fromJson(Map<String, dynamic> json) {
    return Pergunta(
      id: json['id'].toString(),
      texto: json['texto'],
      opcoes: List<String>.from(json['opcoes']),
      respostaCorreta: json['respostaCorreta'],
      categoria: json['categoria'],
    );
  }
}