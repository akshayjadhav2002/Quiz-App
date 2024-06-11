import 'dart:developer' as dev;
import "package:flutter/material.dart";
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:quizzapp/View/result_screen.dart';
import 'package:quizzapp/components/navigation_button.dart';
import 'package:quizzapp/Providers/question_provider.dart';

class QuizzScreen extends StatefulWidget{
  const QuizzScreen({super.key});
  
  @override
  State createState()=>_QuizzScreenState();
}

class _QuizzScreenState extends State{
  @override
  Widget build(BuildContext context){
    final questionProvider = Provider.of<QuestionsProvider>(context);
    int questionIndex = questionProvider.questionIndex;
                
    return Scaffold(
      body:Padding(
        padding:  const EdgeInsets.all(20),
        child: Column( 
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [ 
            const SizedBox(
              height: 70,
            ),
             Container(
              alignment: Alignment.center,
               child: Text("Technical Quiz",
                  style: GoogleFonts.dmSans(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: const Color.fromRGBO(131, 76, 52, 1),
                  ),
                  ),
             ),
                const SizedBox(
              height: 10,
            ),
           Consumer<QuestionsProvider>(
            builder: (context, questionsProvider, child) {
              return LinearPercentIndicator(
                progressColor:const Color.fromRGBO(42, 135, 63, 1),
                backgroundColor:const Color.fromRGBO(245, 216, 186, 1),
                lineHeight: 5,
                percent: (questionIndex + 1) / questionsProvider.questionslist.length,
                barRadius: const Radius.circular(6),
              );
            },         
           ),
            const SizedBox(
              height: 20,
            ),
            Consumer<QuestionsProvider>(
              builder: (context, questionProvider, child) {
                //  if (questionProvider.questionslist.isEmpty) {
                //   return const Center(child: CircularProgressIndicator());
                // }
                return Container(
                  alignment: Alignment.centerLeft,
                  height: 108,
                  width: 380,
                  child: Text(
                    "${questionProvider.questionslist[questionIndex]
                        .question}",
                    style: GoogleFonts.dmSans(
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                      color: const Color.fromRGBO(131, 76, 52, 1),
                    ),
                  ),
                );
              },
            ),
              Consumer<QuestionsProvider>(
                builder: (context, questionsProvider, child) {
                  return ListView.builder(
                  shrinkWrap: true,
                  itemCount: 4,
                  itemBuilder:(context, index) {
                     dev.log("correct answer ${questionProvider.questionslist[questionIndex].correctAnswer}"); 
                    return GestureDetector(
                      onTap: (){
                        questionProvider.selectOption(index);
                      },
                      child: Container(
                        margin:const EdgeInsets.all(10),
                        height: 70,
                        width: 300,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color:questionProvider.checkColor(questionProvider.questionslist[questionIndex].optionsList![index]),
                      
                        ),
                        child: Center(
                          child: ListTile(
                            leading: SizedBox(
                              height: 70,
                               width: 300,
                              child: Center(
                                child: Text(questionProvider.questionslist[questionIndex].optionsList![index],
                                style: GoogleFonts.dmSans(
                                  fontSize:20,
                                  fontWeight:FontWeight.w700,
                                  color:Colors.white
                                ),
                                ),
                              ),
                            ),
                            trailing:  questionProvider.pressedOption == index
                              ? Icon(
                                  questionProvider.questionslist[questionIndex].optionsList![index] ==
                                          questionProvider.questionslist[questionIndex].correctAnswer
                                      ? Icons.check
                                      : Icons.close,
                                  color: Colors.white,
                                )
                              : null,
                          ),
                        ),
                      
                      ),
                    );
                
                  },
                );
                },
                
              ),
              const SizedBox(
                height: 10,
              ),
            //  Text( 
            //   "Explanation",
            //       style: GoogleFonts.dmSans(
            //         fontSize: 16,
            //         fontWeight: FontWeight.w700,
            //         color: const Color.fromRGBO(131, 76, 52, 1),
            //       ),
            // ),
            //  SizedBox(
            //   height: 75,
            //   width: 290,
            //    child: Text( 
            //     "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum is simply dummy text of the printing ",
            //         style: GoogleFonts.dmSans(
            //           fontSize: 14,
            //           fontWeight: FontWeight.w400,
            //           color: const Color.fromRGBO(131, 76, 52, 1),
            //         ),
            //     ),
            //  ),
           Consumer<QuestionsProvider>(
              builder: (context, questionProvider, child) {
                return GestureDetector(
                  onTap: () {
                    questionProvider.nextScreen(context);
                  },
                  child: NavigationButton("Next"),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}