import 'dart:convert' as convert;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/sheetModel.dart';

/// FormController is a class which does work of saving leaderBoard in Google Sheets using
/// HTTP GET request on Google App Script Web URL and parses response and sends result callback.
class SheetController {
  // Google App Script Web URL.
  final String
      url; // "https://script.google.com/macros/s/AKfycbzC5oD76-DeNi37F5tXGXm0_Kw4P5ysEoRvLVy9_c8MWspZDseNDS1f/exec";

  SheetController({@required this.url});

  // Success Status Message
  static const STATUS_SUCCESS = "SUCCESS";

  /// Async function which saves feedback, parses [leaderBoard] parameters
  /// and sends HTTP GET request on [URL]. On successful response, [callback] is called.
  // void submitForm(
  //     LeaderBoardModel leaderBoard, void Function(String) callback) async {
  //   try {
  //     await http.post(url, body: leaderBoard.toJson()).then((response) async {
  //       if (response.statusCode == 302) {
  //         var url = response.headers['location'];
  //         await http.get(url).then((response) {
  //           callback(convert.jsonDecode(response.body)['status']);
  //         });
  //       } else {
  //         callback(convert.jsonDecode(response.body)['status']);
  //       }
  //     });
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  /// Async function which loads feedback from endpoint URL and returns List.
  Future<List<LeaderBoardModel>> getRankingList() async {
    return await http.get(url).then((response) {
      var jsonFeedback = convert.jsonDecode(response.body) as List;
      print(jsonFeedback[3]);
      return jsonFeedback
          .map((json) => LeaderBoardModel.fromJson(json))
          .toList();
    });
  }
}
