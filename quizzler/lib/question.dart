class Question {
  String _questionText;
  String _questionAnswer;

  Question(this._questionText, this._questionAnswer);

  String get questionAnswer => _questionAnswer;

  set questionAnswer(String value) {
    _questionAnswer = value;
  }

  String get questionText => _questionText;

  set questionText(String value) {
    _questionText = value;
  }
}
