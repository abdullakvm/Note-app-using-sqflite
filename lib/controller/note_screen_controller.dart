import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Notescreencontroller {
  static List<Map> notelist = [];
  static String? selectedcategory;
  static const List<String> categories = [
    "Personal",
    "Professional",
    "financial",
    "Educational",
  ];

  static Future<String> dateSelection(BuildContext context) async {
    var selecteddate = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime(2028),
    );

    // date format

    if (selecteddate != null) {
      String formatdate = DateFormat("dd-MM-yyyy").format(selecteddate);
      return formatdate;
    }
    return "";
  }

  static void selectedCategory(String? value) {
    selectedcategory = value;
  }

  static void addNote({required String title , required String des , required String date}) {
    Map note = {"title": title, "des": des, "date": date, "category": selectedcategory};
    notelist.add(note);
  }
}
