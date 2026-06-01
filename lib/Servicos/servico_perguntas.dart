import '../modelos/pergunta.dart';

class ServicoPerguntas {

  List<Pergunta> buscarPerguntas() {
    return [

      // ==========================================
      // CATEGORIA 1 — SISTEMAS OPERATIVOS
      // ==========================================
      Pergunta(
        id: '1',
        categoria: 'Sistemas Operativos',
        texto: 'O que é um sistema operativo?',
        opcoes: [
          'Um programa para navegar na internet',
          'Software que gere os recursos do hardware e software do computador',
          'Um tipo de processador',
          'Um protocolo de rede',
        ],
        respostaCorreta: 'Software que gere os recursos do hardware e software do computador',
      ),
      Pergunta(
        id: '2',
        categoria: 'Sistemas Operativos',
        texto: 'Qual dos seguintes é um sistema operativo de código aberto?',
        opcoes: ['Windows 11', 'macOS', 'Linux', 'iOS'],
        respostaCorreta: 'Linux',
      ),
      Pergunta(
        id: '3',
        categoria: 'Sistemas Operativos',
        texto: 'O que é um processo em sistemas operativos?',
        opcoes: [
          'Um ficheiro guardado no disco',
          'Um programa em execução na memória',
          'Um tipo de sistema de ficheiros',
          'Uma ligação de rede',
        ],
        respostaCorreta: 'Um programa em execução na memória',
      ),
      Pergunta(
        id: '4',
        categoria: 'Sistemas Operativos',
        texto: 'O que significa "deadlock"?',
        opcoes: [
          'Quando o computador desliga sozinho',
          'Quando dois ou mais processos ficam bloqueados à espera um do outro',
          'Quando a memória RAM está cheia',
          'Quando o disco rígido falha',
        ],
        respostaCorreta: 'Quando dois ou mais processos ficam bloqueados à espera um do outro',
      ),
      Pergunta(
        id: '5',
        categoria: 'Sistemas Operativos',
        texto: 'O que é o kernel de um sistema operativo?',
        opcoes: [
          'A interface gráfica do utilizador',
          'O núcleo do sistema que comunica directamente com o hardware',
          'O gestor de ficheiros',
          'O antivírus do sistema',
        ],
        respostaCorreta: 'O núcleo do sistema que comunica directamente com o hardware',
      ),

      // ==========================================
      // CATEGORIA 2 — PROGRAMAÇÃO WEB E MOBILE
      // ==========================================
      Pergunta(
        id: '6',
        categoria: 'Programação Web e Mobile',
        texto: 'O que significa HTML?',
        opcoes: [
          'High Text Markup Language',
          'HyperText Markup Language',
          'Hyper Transfer Markup Language',
          'Home Tool Markup Language',
        ],
        respostaCorreta: 'HyperText Markup Language',
      ),
      Pergunta(
        id: '7',
        categoria: 'Programação Web e Mobile',
        texto: 'Qual linguagem é responsável pelo estilo visual de uma página web?',
        opcoes: ['HTML', 'JavaScript', 'CSS', 'PHP'],
        respostaCorreta: 'CSS',
      ),
      Pergunta(
        id: '8',
        categoria: 'Programação Web e Mobile',
        texto: 'Qual linguagem de programação é usada no Flutter?',
        opcoes: ['Java', 'Kotlin', 'Swift', 'Dart'],
        respostaCorreta: 'Dart',
      ),
      Pergunta(
        id: '9',
        categoria: 'Programação Web e Mobile',
        texto: 'Qual método HTTP é usado para enviar dados ao servidor?',
        opcoes: ['GET', 'DELETE', 'POST', 'HEAD'],
        respostaCorreta: 'POST',
      ),
      Pergunta(
        id: '10',
        categoria: 'Programação Web e Mobile',
        texto: 'O que é o JSON?',
        opcoes: [
          'Uma linguagem de programação',
          'Um formato leve de troca de dados baseado em texto',
          'Um tipo de base de dados',
          'Um protocolo de rede',
        ],
        respostaCorreta: 'Um formato leve de troca de dados baseado em texto',
      ),

      // ==========================================
      // CATEGORIA 3 — PROTOCOLOS DE ROTEAMENTO
      // ==========================================
      Pergunta(
        id: '11',
        categoria: 'Protocolos de Roteamento',
        texto: 'O que é um protocolo de roteamento?',
        opcoes: [
          'Um programa para criar websites',
          'Um conjunto de regras que os routers usam para encaminhar pacotes de dados',
          'Um tipo de cabo de rede',
          'Um sistema operativo para routers',
        ],
        respostaCorreta: 'Um conjunto de regras que os routers usam para encaminhar pacotes de dados',
      ),
      Pergunta(
        id: '12',
        categoria: 'Protocolos de Roteamento',
        texto: 'O que significa RIP?',
        opcoes: [
          'Routing Internet Protocol',
          'Remote Interface Protocol',
          'Routing Information Protocol',
          'Real IP Protocol',
        ],
        respostaCorreta: 'Routing Information Protocol',
      ),
      Pergunta(
        id: '13',
        categoria: 'Protocolos de Roteamento',
        texto: 'Qual protocolo usa o algoritmo de Dijkstra?',
        opcoes: ['RIP', 'BGP', 'OSPF', 'EIGRP'],
        respostaCorreta: 'OSPF',
      ),
      Pergunta(
        id: '14',
        categoria: 'Protocolos de Roteamento',
        texto: 'O RIP usa qual critério como métrica?',
        opcoes: ['Largura de banda', 'Latência', 'Número de saltos (hops)', 'Custo do link'],
        respostaCorreta: 'Número de saltos (hops)',
      ),
      Pergunta(
        id: '15',
        categoria: 'Protocolos de Roteamento',
        texto: 'Qual protocolo é considerado o protocolo de roteamento da internet?',
        opcoes: ['RIP', 'OSPF', 'EIGRP', 'BGP'],
        respostaCorreta: 'BGP',
      ),

    ];
  }
}