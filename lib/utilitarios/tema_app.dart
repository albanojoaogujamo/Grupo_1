import 'package:flutter/material.dart';

class TemaApp {
  static const Color corPrimaria   = Color(0xFF6200EA);
  static const Color corSecundaria = Color(0xFF03DAC6);
  static const Color corFundo      = Color(0xFFF5F5F5);
  static const Color corCerta      = Color(0xFF4CAF50);
  static const Color corErrada     = Color(0xFFF44336);

  static const TextStyle estiloTitulo = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: corPrimaria,
  );

  static const TextStyle estiloPergunta = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: Colors.black87,
  );

  static const TextStyle estiloOpcao = TextStyle(
    fontSize: 16,
    color: Colors.black87,
  );
}