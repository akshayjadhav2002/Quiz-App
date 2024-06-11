import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter/widgets.dart";
import "package:google_fonts/google_fonts.dart";
import "package:percent_indicator/circular_percent_indicator.dart";
import 'package:provider/provider.dart';
import "package:quizzapp/View/home_screen.dart";
import "package:quizzapp/View/quizz_histroy.dart";
import "package:quizzapp/components/avatar_widget.dart";
import 'package:quizzapp/Providers/question_provider.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key});

  @override
  State createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    final questionProvider = Provider.of<QuestionsProvider>(context, listen: false);
    
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Image.asset(
                "assets/Images/background.png",
              ),
              Image.asset(
                "assets/Images/background1.png",
              ),
              Expanded(
                child: Image.asset(
                  "assets/Images/background3.png",
                ),
              ),
            ],
          ),
          Positioned(
            top: 350,
            left: 30,
            child: Container(
              height: 350,
              width: 330,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: const Color.fromRGBO(246, 221, 195, 1),
              ),
            ),
          ),
          Positioned(
            top: 300,
            left: 150,
            child: Container(
              height: 90,
              width: 90,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: const Color.fromRGBO(250, 245, 241, 1),
              ),
              child:  Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context, 
                    MaterialPageRoute(builder:(context) {
                      return const History();
                    },)
                    );
                  },
                  child: avatar()),
                // child: Text(
                //   "${questionProvider.marks}",
                //   style: const TextStyle(
                //     fontSize: 40,
                //     fontWeight: FontWeight.w700,
                //     color: Color.fromRGBO(200, 60, 0, 1),
                //   ),
                // ),
              ),
            ),
          ),
          Positioned(
            top: 400,
            left: 45,
            child: Container(
              height: 180,
              width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: const Color.fromRGBO(248, 145, 87, 1),
              ),
              child: Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Total won quiz's till now",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 5),
                        SizedBox(
                          width: 150,
                          child: Text(
                            "Your vast knowledge and quick thinking are truly commendable. Keep up the good work and Best wishes for your future endeavors!",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  CircularPercentIndicator(
                    radius: 50.0,
                    lineWidth: 10.0,
                    percent:  (questionProvider.marks/10*100)/100 ,
                    center:  Text(
                        "${questionProvider.marks/10*100}",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 25.0, color: Colors.white),
                    ),
                    progressColor:const  Color.fromARGB(255, 77, 205, 48),
                    backgroundColor: Colors.red,
                    animation: true,
                    animationDuration: 1000,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 590,
            left: 50,
            child: Row( 
              children: [ 
                Container(
                  height: 95,
                  width: 145,
                  decoration: BoxDecoration( 
                    borderRadius: BorderRadius.circular(15),
                    color:const Color.fromRGBO(250, 245, 241, 1),
                  ),
                  child:  Center( 
                    child: Column(
                      
                      children: [
                         SizedBox(
                          height: 50,
                          width: 90,
                           child: Text(
                              "Solved Questions",
                              style: GoogleFonts.dmSans(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: const Color.fromRGBO(131, 76, 52, 1),
                              ),
                          ),
                         ),
                        Text(
                          "${questionProvider.questionslist.length}",
                            style: GoogleFonts.dmSans(
                                fontSize: 22,
                                fontWeight: FontWeight.w700,
                                color: const Color.fromRGBO(131, 76, 52, 1),
                              ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  height: 95,
                  width: 145,
                  decoration: BoxDecoration( 
                    borderRadius: BorderRadius.circular(15),
                    color:const Color.fromRGBO(26, 181, 134, 1),
                  ),
                  child: Center( 
                    child: Column(
                      children: [
                         SizedBox(
                          height: 50,
                          width: 90,
                           child: Text(
                              "Correct Questions",
                              style: GoogleFonts.dmSans(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: const Color.fromARGB(255, 255, 253, 253),
                              ),
                          ),
                         ),
                        Text(
                          "${questionProvider.marks}",
                            style: GoogleFonts.dmSans(
                                fontSize: 22,
                                fontWeight: FontWeight.w700,
                                color: const Color.fromARGB(255, 255, 255, 255),
                              ),
                        )
                      ],
                    ),
                  ),
                ),

              ],
            )
            ),
           Positioned(
            top: 710,
            left: 130,
            child: ElevatedButton(
              onPressed: () {
                // Reset the quiz state and navigate back to the quiz screen
                questionProvider.resetQuiz();
                Navigator.pushReplacement(context,
                 MaterialPageRoute(
                  builder: (context) {
                    return const HomeScreen();
                  },
                ));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(248, 145, 87, 1), // button color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text(
                "Reset",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
