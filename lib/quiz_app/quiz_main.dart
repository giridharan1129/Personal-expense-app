import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

class QuizApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<QuizApp> {
  final _questions = const [
    {
      'questionText': 'What\'s your favourite colour ?',
      'answer': [
        {'text': 'black', 'score': 0},
        {'text': 'red', 'score': 1},
        {'text': 'green', 'score': 2},
        {'text': 'white', 'score': 3}
      ]
    },
    {
      'questionText': 'What\'s your favourite animal ?',
      'answer': [
        {'text': 'snake', 'score': 0},
        {'text': 'wolf', 'score': 1},
        {'text': 'cat', 'score': 2},
        {'text': 'dog', 'score': 3}
      ]
    },
    {
      'questionText': 'Who\'s your favourite movie genre ?',
      'answer': [
        {'text': 'crime', 'score': 0},
        {'text': 'horror', 'score': 1},
        {'text': 'love', 'score': 2},
        {'text': 'Comedy', 'score': 3}
      ]
    }
  ];

  var _questionIndex = 0;
  var _totalScore =0;

  void _resetQuiz(){
    setState(() {
      _questionIndex=0;
      _totalScore=0;
    });
  }



  void _answerQuestion(int score) {
    _totalScore+=score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });

    if (_questionIndex < _questions.length) {
      print('more question are there');
    } else {
      print('no more questions');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('My first app',),centerTitle: true,backgroundColor: Colors.redAccent,),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore,_resetQuiz),
      ),
    );
  }
}
