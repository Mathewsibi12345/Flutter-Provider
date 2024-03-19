


import 'package:flutter/material.dart';
import 'package:flutter_provider/provider/provider.dart';
import 'package:provider/provider.dart';

class AddPage extends StatelessWidget {
  final TextEditingController _bookNameController = TextEditingController();
  final TextEditingController _yearController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Book'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: _bookNameController,
              decoration: InputDecoration(labelText: 'Book Name'),
            ),
            TextFormField(
              controller: _yearController,
              decoration: InputDecoration(labelText: 'Year'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final bookProvider = Provider.of<BookProvider>(context, listen: false);
                // Access the BookProvider from the context
                bookProvider.addBook(
                  // Call the addBook method of BookProvider to add a new book
                  _bookNameController.text,
                  _yearController.text,
                  // Get the text from the year text field
                );
                Navigator.pop(context);
              },
              child: Text('Add'),
            ),
          ],
        ),
      ),
    );
  }
}

