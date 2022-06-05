import 'package:flutter/material.dart';
import 'package:quiz/result.dart';

import './quiz.dart';
import './result.dart';

/*void main() {
  runApp(MyApp());
}*/
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;
  final _questions = const [
    {
      'questionText': 'What is the capital of Turkey?',
      'answers': [
        {'text': 'Mumbai', 'score': 0},
        {'text': 'Jerusalem', 'score': 0},
        {'text': 'Istanbul', 'score': 10},
        {'text': 'Damascus', 'score': 0}
      ]
    },
    {
      'questionText': 'What is the fruit that fell on the scientist Newton?',
      'answers': [
        {'text': 'banana', 'score': 0},
        {'text': 'apricot', 'score': 0},
        {'text': 'melon', 'score': 0},
        {'text': 'apple', 'score':10}
      ]
    }, {
      'questionText': 'Who\'s prime ministor of India?',
      'answers': [
        {'text': 'Narendra Modi', 'score': 10},
        {'text': 'Amit Shah', 'score': 0},
        {'text': 'Sonia Gandhi', 'score': 0},
        {'text': 'Rahul Gandhi', 'score': 0}
      ]
    },{
      'questionText': 'What is the capital of Palestine?',
      'answers': [
        {'text': 'Mumbai', 'score': 0},
        {'text': 'Istanbul', 'score': 0},
        {'text': 'Jerusalem', 'score': 10},
        {'text': 'Damascus', 'score': 0}
      ]
    },{
      'questionText': 'What store does the iPhone use?',
      'answers': [
        {'text': 'google play', 'score': 0},
        {'text': 'app store', 'score': 10},
        {'text': 'google', 'score': 0},

      ]
    },

  ];

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestions(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print('_questionIndex:$_questionIndex');
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text('Quiz App'),
          backgroundColor: Colors.red,
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
            questions: _questions,
            answerQuestions: _answerQuestions,
            questionIndex: _questionIndex)
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}