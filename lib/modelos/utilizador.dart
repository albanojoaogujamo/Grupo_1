class Utilizador {
  final String id;
  final String nome;
  final String email;

  Utilizador({
    required this.id,
    required this.nome,
    required this.email,
  });

  factory Utilizador.fromJson(Map<String, dynamic> json) {
    return Utilizador(
      id: json['id'].toString(),
      nome: json['nome'],
      email: json['email'],
    );
  }
}