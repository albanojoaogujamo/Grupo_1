import 'dart:convert';
import 'package:http/http.dart' as http;
import '../modelos/utilizador.dart';
import '../utilitarios/constantes.dart';

class ServicoAutenticacao {
  String? _token;
  Utilizador? _utilizadorActual;

  String? get token => _token;
  Utilizador? get utilizadorActual => _utilizadorActual;
  bool get estaAutenticado => _token != null;

  Future<bool> entrar(String email, String password) async {
    try {
      final resposta = await http.post(
        Uri.parse(Constantes.urlLogin),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email, 'password': password}),
      );

      if (resposta.statusCode == 200) {
        final dados = jsonDecode(resposta.body);
        _token = dados['token'];
        _utilizadorActual = Utilizador.fromJson(dados['utilizador']);
        return true;
      }
      return false;
    } catch (e) {
      throw Exception(Constantes.erroLigacao);
    }
  }

  Future<void> sair() async {
    _token = null;
    _utilizadorActual = null;
  }
}