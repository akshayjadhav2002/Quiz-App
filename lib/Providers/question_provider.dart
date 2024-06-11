import 'package:flutter/material.dart';
import 'package:quizzapp/Controllers/get_data_from_api.dart';
import 'package:quizzapp/View/result_screen.dart';
import 'package:quizzapp/models/question.dart';

class QuestionsProvider extends ChangeNotifier {
  List<Questions> questionslist = listOfQuestions;
  int questionIndex = 0;
  int? pressedOption;
  int marks = 0;
  bool isQuestion = true;


  // Function decides the color of buttons
  Color checkColor(String option) {
    if (pressedOption != null) {
      if (option == questionslist[questionIndex].correctAnswer) {
        return Colors.green; // Correct answer
      } else if (pressedOption! >= 0 &&
          pressedOption! < questionslist[questionIndex].optionsList!.length &&
          questionslist[questionIndex].wrongAnswer!.contains( option)) {
        return Colors.red; // Wrong answer
      } else {
        return Colors.blueGrey; // Default color for other options
      }
    } else {
      return Colors.blueGrey; // Default color if nothing is selected
    }
  }

  // Handle the selection of an option
  void selectOption(int index) {
    pressedOption = index;
    notifyListeners();
  }

  // Navigation to the next question or result screen
  void nextScreen(BuildContext context) {
    if (pressedOption != null) {
     if (questionslist[questionIndex].optionsList![pressedOption!] ==
    questionslist[questionIndex].correctAnswer) {
    marks += 1;
      }
      if (questionIndex < questionslist.length - 1) {
        questionIndex++;
      } else {
        isQuestion = false;
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return const ResultScreen();
        }));
      }
      pressedOption = null;
      notifyListeners();
    }
  }

  // Reset the quiz state
  void resetQuiz() {
    questionIndex = 0;
    pressedOption = null;
    marks = 0;
    isQuestion = true;
    notifyListeners();
  }
}
