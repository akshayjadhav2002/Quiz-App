import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget category(String category) {
  return Container(
    margin: const EdgeInsets.all(10),
    height: 90,
    width: 306,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      color: const Color.fromRGBO(255, 237, 217, 1),
    ),
    child: Center(
      child: ListTile(
        leading: Container(
          height: 45,
          width: 45,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8), color: Colors.white),
          child: Center(
            child: Text(
              category[0],
              style: GoogleFonts.dmSans(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: const Color.fromRGBO(200, 60, 0, 1),
              ),
            ),
          ),
        ),
        title: Row(children: [
          Text(
            category,
            style: GoogleFonts.dmSans(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: const Color.fromRGBO(131, 76, 52, 1),
            ),
          ),
          const Spacer()
        ]),
        trailing: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_forward_ios),
        ),
      ),
    ),
  );
}
