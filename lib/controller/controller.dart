import 'package:flutter/material.dart';
import 'package:flutter_provider/provider/provider.dart';
import 'package:provider/provider.dart';

class DeletePage extends StatelessWidget {
  final String id;

  DeletePage({required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Delete Book'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Are you sure you want to delete this book?',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final bookProvider = Provider.of<BookProvider>(context, listen: false);
                bookProvider.deleteBook(id);
                Navigator.pop(context);
              },
              child: Text('Delete'),
            ),
          ],
        ),
      ),
    );
  }
}
