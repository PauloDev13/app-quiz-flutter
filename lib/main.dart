import 'package:flutter/material.dart';
import 'package:quizapp/perguntas.dart';

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
  List<Widget> marcadorDePontos = [];

  // List<String> perguntas = [
  //   'O metrô é um dos meios de transporte mais seguros do mundo',
  //   'A culinária brasileira é uma das melhores do mundo.',
  //   'Vacas podem voar, assim como peixes d\'água utilizam os pés para andar.',
  // ];

  // List<bool> respostas = [true, true, false];

  List<Perguntas> perguntasERepostas = [
    Perguntas(
      q: 'O metrô é um dos meios de transporte mais seguros do mundo.',
      r: true,
    ),

    Perguntas(
      q: 'A culinária brasileira é uma das melhores do mundo.',
      r: true,
    ),

    Perguntas(
      q: 'Vacas podem voar, assim como peixes d\'água utilizam os pés para andar.',
      r: false,
    ),
  ];

  int indiceQuestaoAtual = 0;

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
                perguntasERepostas[indiceQuestaoAtual].questao,
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
                bool respostaCerta =
                    perguntasERepostas[indiceQuestaoAtual].respostaDaQuestao;

                if (respostaCerta) {
                  marcadorDePontos.add(Icon(Icons.check));
                } else {
                  marcadorDePontos.add(Icon(Icons.close));
                }
                //O usuário clica no botão verdadeiro.
                setState(() {
                  if (indiceQuestaoAtual <= perguntasERepostas.length - 2) {
                    indiceQuestaoAtual++;
                  } else {
                    indiceQuestaoAtual = 0;
                    marcadorDePontos.clear();
                  }
                });
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
                bool respostaCerta =
                    perguntasERepostas[indiceQuestaoAtual].respostaDaQuestao;

                if (!respostaCerta) {
                  marcadorDePontos.add(Icon(Icons.check));
                } else {
                  marcadorDePontos.add(Icon(Icons.close));
                }

                setState(() {
                  if (indiceQuestaoAtual <= perguntasERepostas.length - 2) {
                    indiceQuestaoAtual++;
                  } else {
                    indiceQuestaoAtual = 0;
                  }
                });
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
