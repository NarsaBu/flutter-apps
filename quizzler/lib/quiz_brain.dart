import 'package:quizzler/question.dart';

class QuizBrain {
  int _questionNumber = 0;

  List<Question> _questionBank = [
    Question('Some cats are actually allergic to humans', 'True'),
    Question('You can lead a cow down stairs but not up stairs.', 'False'),
    Question(
        'Approximately one quarter of human bones are in the feet.', 'True'),
    Question('A slug\'s blood is green.', 'True'),
    Question('Buzz Aldrin\'s mother\'s maiden name was \"Moon\".', 'True'),
    Question('It is illegal to pee in the Ocean in Portugal.', 'True'),
    Question(
        'No piece of square dry paper can be folded in half more than 7 times.',
        'False'),
    Question(
        'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
        'True'),
    Question(
        'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        'False'),
    Question(
        'The total surface area of two human lungs is approximately 70 square metres.',
        'True'),
    Question('Google was originally called \"Backrub\".', 'True'),
    Question(
        'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
        'True'),
    Question(
        'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
        'True'),
  ];

  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
    print(_questionNumber);
  }

  String getQuestionText() {
    return _questionBank[_questionNumber].questionText;
  }

  String getQuestionAnswer() {
    return _questionBank[_questionNumber].questionAnswer;
  }

  int getQuestionNumber() {
    return _questionNumber;
  }

  bool isFinished() {
    if (_questionNumber >= _questionBank.length - 1) {
      return true;
    }
    return false;
  }

  void reset() {
    _questionNumber = 0;
  }
}
