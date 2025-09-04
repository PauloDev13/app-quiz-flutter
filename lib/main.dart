import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'helper.dart';

void main() => runApp(QuizApp());

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  // Cria o array para os ícones e atribui vazio
  List<Widget> marcadorDePontos = [];

  void conferirResposta(bool respostaDoUsuario) {
    bool respostaCerta = Helper().obterRespostaCorreta();

    setState(() {
      // Se chegou na última pergunta
      if (Helper().conferirFimDaExecucao() == true) {
        // Emite aletar
        Alert(
          context: context,
          title: 'QUIZ',
          desc: 'Você respondeu todas as perguntas!',
        ).show();

        // Reinicia o valor da propriedade _numeroDaQuestaoAtual
        Helper().resetaQuiz();

        // Limpa o array marcadoresDePontos para uma nova rodada de perguntas
        marcadorDePontos.clear();
      }
      // Se não chegou na última pergunta ainda
      else {
        // E se a resposta do usuário estiver correta
        if (respostaDoUsuario = respostaCerta) {
          // Adiciona ícones de check no array marcadorDePontos
          marcadorDePontos.add(
              Icon(
                Icons.check,
                color: Colors.green,
              )
          );
          // Se a resposta estiver errada
        } else {
          // Adiciona ícones de close no array marcadorDePontos
          marcadorDePontos.add(
            Icon(
              Icons.close,
              color: Colors.red,
            ),
          );
        }
        // Exibe a próxima pergunta
        Helper().proximaPergunta();
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                Helper().obterQuestao(),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25.0),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.zero,
                ),
              ),
              child: Text(
                'Verdadeiro',
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              ),
              onPressed: () {
                conferirResposta(true);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.grey.shade800,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.zero,
                ),
              ),
              child: Text(
                'Falso',
                style: TextStyle(fontSize: 20.0, color: Colors.white),
              ),
              onPressed: () {
                //O usuário clica no botão falso.
                conferirResposta(false);
              },
            ),
          ),
        ),
        Row(children: marcadorDePontos),
      ],
    );
  }
}

/*
pergunta1: 'O metrô é um dos meios de transporte mais seguros do mundo', verdadeiro,
pergunta2: 'A culinária brasileira é uma das melhores do mundo.', verdadeiro,
pergunta3: 'Vacas podem voar, assim como peixes utilizam os pés para andar.', falso,
*/
