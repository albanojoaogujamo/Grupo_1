class Pontuacao {
  final String idUtilizador;
  final String nomeUtilizador;
  final int pontos;
  final DateTime data;

  Pontuacao({
    required this.idUtilizador,
    required this.nomeUtilizador,
    required this.pontos,
    required this.data,
  });

  factory Pontuacao.fromJson(Map<String, dynamic> json) {
    return Pontuacao(
      idUtilizador: json['idUtilizador'],
      nomeUtilizador: json['nomeUtilizador'],
      pontos: json['pontos'],
      data: DateTime.parse(json['data']),
    );
  }
}