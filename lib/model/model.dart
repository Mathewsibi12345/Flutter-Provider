

import 'package:flutter/foundation.dart';

class Book {
  final String id;
  final String bookName;
  final String year;

  Book({required this.id, required this.bookName, required this.year});

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      id: json['_id'],
      bookName: json['bookName'],
      year: json['year'],
    );
  }
}
