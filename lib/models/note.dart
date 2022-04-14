import 'package:flutter/material.dart';

class Note {
  final String id;
  final String title;
  final String note;
  final DateTime date;

  Note(
      {required this.id,
      required this.title,
      required this.note,
      required this.date});
}
