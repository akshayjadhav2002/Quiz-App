

import 'package:flutter/material.dart';

Widget NavigationButton(String name) {
  return Container(
    alignment: Alignment.bottomRight,
    height: 30,
    width: 90,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: const Color.fromRGBO(26, 181, 134, 1)),
    child: Center(
        child: Text(
      name,
    )),
  );
}