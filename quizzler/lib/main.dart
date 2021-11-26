import 'package:flutter/material.dart';
import 'package:quizzler/quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizBrain quizBrain = QuizBrain();

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> _scoreKeeper = [];

  void checkAnswer(String text) {
    setState(() {
      if (quizBrain.isFinished()) {
        Alert(
          context: context,
          title: 'Finished',
          desc: 'You\'ve reached the end of the quiz.',
        ).show();

        quizBrain.reset();
        _scoreKeeper = [];
      } else {
        text == quizBrain.getQuestionAnswer()
            ? _scoreKeeper.add(_createCheck())
            : _scoreKeeper.add(_createClose());
        quizBrain.nextQuestion();
      }
    });
  }

  @override
  Column build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _createQuestion(),
        _createButton(Colors.green, 'True'),
        _createButton(Colors.red, 'False'),
        Row(
          children: _scoreKeeper,
        ),
      ],
    );
  }

  Expanded _createQuestion() {
    return Expanded(
      flex: 5,
      child: Padding(
        padding: EdgeInsets.all(15.0),
        child: Container(
          alignment: Alignment.center,
          child: Text(
            quizBrain.getQuestionText(),
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 25.0),
          ),
        ),
      ),
    );
  }

  Expanded _createButton(MaterialColor color, String text) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(15.0),
        child: ElevatedButton(
          onPressed: () {
            checkAnswer(text);
          },
          child: Text(
            text,
            style: TextStyle(fontSize: 20.0, color: Colors.white),
          ),
          style: ElevatedButton.styleFrom(primary: color),
        ),
      ),
    );
  }

  Icon _createCheck() {
    return Icon(
      Icons.check,
      color: Colors.green,
    );
  }

  Icon _createClose() {
    return Icon(
      Icons.close,
      color: Colors.red,
    );
  }
}
