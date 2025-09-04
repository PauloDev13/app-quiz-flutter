import 'perguntas.dart';

class Helper {

  int _numeroDaQuestaoAtual = 0;

  final List<Perguntas> _bancoDePerguntas = [
    Perguntas(
        questao: 'O metrô é um dos meios de transporte mais seguros do mundo.',
        respostaDaQuestao: true,
    ),
    Perguntas(
        questao: 'A culinária brasileira é uma das melhores do mundo.',
        respostaDaQuestao: true,
    ),
    Perguntas(
        questao: 'Vacas podem voar, assim como peixes utilizam os pés para andar.',
        respostaDaQuestao: false,
    ),
    Perguntas(
        questao: 'A maioria dos peixes podem viver fora da água.',
        respostaDaQuestao: false,
    ),
    Perguntas(
      questao: 'A lâmpada foi inventada por um brasileiro.',
      respostaDaQuestao: false,
    ),
    Perguntas(
        questao: 'É possível utilizar a carteira de habilitação de carro para dirigir um avião.',
        respostaDaQuestao: false
    ),
    Perguntas(
        questao: 'O Brasil possui 26 estados e 1 Distrito Federal.',
        respostaDaQuestao: true
    ),
    Perguntas(
        questao: 'Bitcoin é o nome dado a uma das moedas virtuais mais famosas.',
        respostaDaQuestao: true
    ),
    Perguntas(
        questao: '1 minuto equivale a 60 segundos.',
        respostaDaQuestao: true
    ),
    Perguntas(
        questao: '1 segundo equivale a 200 milissegundos.',
        respostaDaQuestao: false
    ),
    Perguntas(
        questao: 'O Burj Khalifa, em Dubai, é considerado o maior prédio do mundo.',
        respostaDaQuestao: true
    ),
    Perguntas(
        questao: 'Ler após uma refeição prejudica a visão humana.',
        respostaDaQuestao: false
    ),
    Perguntas(
        questao: 'O cartão de crédito pode ser considerado uma moeda virtual.',
        respostaDaQuestao: false
    ),
  ];

  void proximaPergunta() {
    if (_numeroDaQuestaoAtual < _bancoDePerguntas.length - 1){
      _numeroDaQuestaoAtual++;
    }

    print(_numeroDaQuestaoAtual);
    print(_bancoDePerguntas.length);

  }

  String obterQuestao() {
    return _bancoDePerguntas[_numeroDaQuestaoAtual].questao;
  }

  bool obterRespostaCorreta() {
    return _bancoDePerguntas[_numeroDaQuestaoAtual].respostaDaQuestao;
  }

  bool conferirFimDaExecucao() {
    if (_numeroDaQuestaoAtual >= _bancoDePerguntas.length -1){
      print('Chegou na última pergunta');
      return true;
    } else {
      return false;
    }
  }

  void resetaQuiz(){
    _numeroDaQuestaoAtual = 0;
  }
}