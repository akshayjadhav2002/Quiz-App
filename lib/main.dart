import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:quizzapp/Controllers/get_data_from_api.dart';
import 'package:quizzapp/View/home_screen.dart';
import 'package:quizzapp/View/quizz_screen.dart';
import 'package:quizzapp/View/splash_screen.dart';
import 'package:quizzapp/Providers/question_provider.dart';

void main() {
  getData();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return QuestionsProvider();
      },
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home:SplashScreen()
      ),
    );
  }
}
