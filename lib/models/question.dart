import 'dart:math';

class Questions {
  String? question;
  String? correctAnswer;
  List<String>? wrongAnswer;
  List<String>? optionsList;

  Questions({
    this.question,
    this.correctAnswer,
    this.wrongAnswer,
    this.optionsList,
  });

  factory Questions.fromJson(Map<String, dynamic> json) {
    List<String> wrongAnswers = List<String>.from(json['incorrect_answers']);
    String correctAnswer = json['correct_answer'];
    List<String> options = List<String>.from(wrongAnswers);
    options.add(correctAnswer);
    options.shuffle(Random());

    return Questions(
      question: json['question'],
      correctAnswer: correctAnswer,
      wrongAnswer: wrongAnswers,
      optionsList: options,
    );
  }
}