class Constantes {
  static const String urlBase          = 'http://servidor:3000/api';
  static const String urlLogin         = '$urlBase/auth/login';
  static const String urlPerguntas     = '$urlBase/quiz/perguntas';
  static const String urlPontuacoes    = '$urlBase/pontuacoes';

  static const int totalPerguntas      = 15;
  static const int segundosPorPergunta = 30;

  static const String erroLigacao      = 'Sem ligação à internet';
  static const String erroLogin        = 'Email ou password incorrectos';
}