
import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:quizzapp/View/quizz_screen.dart";
import "package:quizzapp/components/category_widget.dart";

class History extends StatefulWidget{
  const History({super.key});
  @override
  State createState()=>_HistroyState();
} 

class _HistroyState extends State<History>{
  List categorylist = ["Computer Science","Mathematics","Physics","Chemestry","GK"];
  @override
  Widget build(BuildContext context){
    return  Scaffold(
      body: Column(
        children: [ 
        const SizedBox(
          height: 40,
        ),
        Text(
          "History",
              style: GoogleFonts.dmSans(
                fontSize: 25,
                fontWeight: FontWeight.w700,
                color: const Color.fromRGBO(131, 76, 52, 1),
              )),
              ListView.builder(
              shrinkWrap: true,
              itemCount: 5,
              itemBuilder:(context,index){
                return category(categorylist[index]);
              } 
              ),

        ],
      ),
    );
  }
}