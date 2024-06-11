import 'package:flutter/material.dart';

Widget avatar() {
  return Container(
    margin: const EdgeInsets.all(10),
    height: 85,
    width: 85,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: const Color.fromRGBO(250, 188, 154, 1),
        boxShadow:const [
         BoxShadow(
            color: Color.fromARGB(255, 136, 84, 224),
            spreadRadius: 6,
            blurRadius: 90,
            offset: Offset(0, 4)
          )
        ]
        ),
    child: const CircleAvatar(
      backgroundImage: AssetImage('assets/Images/avatar.png'),
      backgroundColor: Color.fromRGBO(250, 188, 154, 1),
      radius: 50,
    ),
  );
}
