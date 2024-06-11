import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:math' as math;
import 'package:http/http.dart' as http;
import 'package:quizzapp/models/question.dart';

List<Questions> listOfQuestions = [];

void getData() async {
  try {
    Uri url = Uri.parse("https://opentdb.com/api.php?amount=10&category=18&type=multiple");

    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);
      List<dynamic> results = responseData['results'];
      listOfQuestions = results.map((result) => Questions.fromJson(result)).toList();
      log("Successfully fetched ${listOfQuestions.length} questions");
    } else {
      log("API request failed with status code: ${response.statusCode}");
    }
  } catch (err) {
    if (err is SocketException) {
      log("Network error occurred: $err");
    } else if (err is FormatException) {
      log("Failed to parse JSON response: $err");
    } else {
      log("An error occurred: $err");
    }
  }
}


