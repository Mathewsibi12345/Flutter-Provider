
import 'package:flutter/material.dart';
import 'package:flutter_provider/view/add.dart';
import 'package:flutter_provider/view/homepage.dart';

import 'package:flutter_provider/provider/provider.dart';
import 'package:flutter_provider/view/update.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => BookProvider(),
      child: MaterialApp(
        title: 'Library Management System',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => HomePage(),
          '/add': (context) => AddPage(),
          '/update': (context) => UpdatePage(id: '',),
        },
      ),
    );
  }
}

