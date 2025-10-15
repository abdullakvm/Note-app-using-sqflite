import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';

class Notescreencontroller {
  static late Database database;
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

  // static void addNote({
  //   required String title,
  //   required String des,
  //   required String date,
  // }) {
  //   Map note = {
  //     "title": title,
  //     "des": des,
  //     "date": date,
  //     "category": selectedcategory,
  //   };
  //   notelist.add(note);
  // }

  // using Sqflite here

  static Future<void> initDb() async {
    if (kIsWeb) {
      // Change default factory on the web
      databaseFactory = databaseFactoryFfiWeb;
    }
    // open the database
    database = await openDatabase(
      "note.db",
      version: 1,
      onCreate: (Database db, int version) async {
        // When creating the db, create the table
        await db.execute(
          'CREATE TABLE Note (id INTEGER PRIMARY KEY, title TEXT, des TEXT, date TEXT, category TEXT)',
        );
      },
    );
  }

  // add note to the datatbase
  static Future<void> addNote({
    required String title,
    required String des,
    required String date,
  }) async {
    await database.rawInsert(
      'INSERT INTO Note(title, des, date, category) VALUES(?, ?, ?, ?)',
      [title, des, date, selectedcategory],
    );
    await getAllNotes();
  }

  // add the ntoes from the databaase to the list

  static Future<void> getAllNotes() async {
    notelist = await database.rawQuery('SELECT * FROM Note');

    log(notelist.toString());  // to print the list in console
  }
}
