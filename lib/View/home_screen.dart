
import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:quizzapp/View/quizz_screen.dart";
import "package:quizzapp/components/avatar_widget.dart";
import "package:quizzapp/components/category_widget.dart";

class HomeScreen extends StatefulWidget{
  const HomeScreen({super.key});

  @override
  State createState()=>_HomeScreenState();
}

class _HomeScreenState extends State{
List categorylist = ["Computer Science","Mathematics","Physics","Chemestry","GK"];
  @override
  Widget build(BuildContext context){
      return Scaffold(
      body:Center(
        // child: (listOfQuestions.isEmpty)? 
        //      const CircularProgressIndicator():
          child:   Column(
          children: [ 
             const SizedBox(
              height: 80,
             ),
            Row( 
              children: [ 
                Column( 
                 crossAxisAlignment: CrossAxisAlignment.start,
                  children: [ 
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 10
                      ),
                      child: Text(
                        "Hi Akshay,",
                      style: GoogleFonts.dmSans(
                        fontSize:25,
                        fontWeight:FontWeight.w700,
                        color:const Color.fromRGBO(131, 76, 52, 1),
                      )
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 10
                      ),
                      child: Text(
                        "Great to see you again!",
                      style: GoogleFonts.dmSans(
                        fontSize:16,
                        fontWeight:FontWeight.w400,
                        color:const Color.fromRGBO(131, 76, 52, 1),
                      )
                      ),
                    )
                  ],
                ),
                const Spacer(),
                  avatar(),
              ],
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: 5,
              itemBuilder:(context,index){
                return GestureDetector(
                  onTap:() {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder:(context) {
                        return  const QuizzScreen();
                      },)
                    );
                  },
                  child: category(categorylist[index]),
                );
              } 
              ),
          ],
        ),
      ),
    );
  }
}