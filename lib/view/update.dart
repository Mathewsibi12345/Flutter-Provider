

import 'package:flutter/material.dart';
import 'package:flutter_provider/provider/provider.dart';
import 'package:provider/provider.dart';

class UpdatePage extends StatelessWidget {
  final String id;
  final TextEditingController _bookNameController = TextEditingController();
  final TextEditingController _yearController = TextEditingController();

  UpdatePage({required this.id});

  @override
  Widget build(BuildContext context) {
    final bookProvider = Provider.of<BookProvider>(context);

    // Find the book by ID
    final book = bookProvider.getBookById(id);

    // Set initial values for text controllers
    _bookNameController.text = book?.bookName ?? '';
    _yearController.text = book?.year ?? '';

    return Scaffold(
      appBar: AppBar(
        title: Text('Update Book'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
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
            // ElevatedButton(
            //   onPressed: () {
            //     final bookProvider = Provider.of<BookProvider>(context, listen: false);
            //     bookProvider.updateBook(
            //       id,
            //       _bookNameController.text,
            //       _yearController.text,
            //     );
            //     Navigator.pop(context);
            //   },
            //   child: Text('Update'),
            // ),

            ElevatedButton(
  onPressed: () async {
    final bookProvider = Provider.of<BookProvider>(context, listen: false);
    await bookProvider.updateBook(
      id,
      _bookNameController.text,
      _yearController.text,
    );
    Navigator.pop(context);
    // Notify listeners to trigger rebuild of widgets listening to changes in BookProvider
    bookProvider.notifyListeners();
  },
  child: Text('Update'),
),

          ],
        ),
      ),
    );
  }
}

