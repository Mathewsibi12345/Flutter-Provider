


import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:flutter_provider/model/model.dart';

class BookProvider extends ChangeNotifier {
  List<Book> _books = [];

  List<Book> get books => _books;

  final String apiUrl =
      'https://crudcrud.com/api/268f8960b7784fb8965902ae2764824e/unicorns';

  Future<void> fetchBooks() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {    
        final List<dynamic> decodedData = json.decode(response.body);
        _books = decodedData.map((json) => Book.fromJson(json)).toList();
        notifyListeners();
      } else {
        throw Exception('Failed to load books from API');
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  Future<void> addBook(String bookName, String year) async {
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({'bookName': bookName, 'year': year}),
      );

      if (response.statusCode == 201) {
        fetchBooks(); // Refresh books after adding
      } else {
        throw Exception('Failed to add book. Status code: ${response.statusCode}');
      }
    } catch (error) {
      print('Error: $error');
    }
  }
Book? getBookById(String id) {
  return _books.firstWhereOrNull((book) => book.id == id);
}

  Future<void> updateBook(String id, String bookName, String year) async {
    try {
      final response = await http.put(
        Uri.parse('$apiUrl/$id'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({'bookName': bookName, 'year': year}),
      );
      

      if (response.statusCode == 200) {
        fetchBooks(); // Refresh books after updating
      } else {
        throw Exception('Failed to update book. Status code: ${response.statusCode}');
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  Future<void> deleteBook(String id) async {
    try {
      final response = await http.delete(
        Uri.parse('$apiUrl/$id'),
      );

      if (response.statusCode == 200) {
        fetchBooks(); // Refresh books after deleting
      } else {
        throw Exception('Failed to delete book. Status code: ${response.statusCode}');
      }
    } catch (error) {
      print('Error: $error');
    }
  }
}
