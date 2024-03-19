import 'package:flutter/material.dart';
import 'package:flutter_provider/provider/provider.dart';
import 'package:flutter_provider/view/update.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Library Management System'),
      ),
      body: Consumer<BookProvider>(
        // The builder function receives the context, the current value of BookProvider, and a child widget
        builder: (context, bookProvider, _) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/add');
                  },
                  child: Text('Add Book'),
                ),
                SizedBox(height: 20),
                Text('Books Added:'),
                Expanded(
                  child: ListView.builder(
                    itemCount: bookProvider.books.length,
                    itemBuilder: (context, index) {
                      final book = bookProvider.books[index];
                      // Get the book at the current index
                      return ListTile(
                        title: Text(book.bookName),
                        subtitle: Text(book.year),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Icon(Icons.edit),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          UpdatePage(id: book.id),
                                    ));
                                // Handle update operation
                                // Navigator.pushNamed(context, '/update', arguments: book.id);
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () {
                                // Handle delete operation
                                bookProvider.deleteBook(book.id);
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
