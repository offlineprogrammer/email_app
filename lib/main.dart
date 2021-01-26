import 'package:email_app/message_list.dart';
import 'package:flutter/material.dart';

import 'app.dart';

void main() {
  runApp(EmailApp());
}

class EmailApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        accentColor: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: App(), // MessageList(title: 'Flutter Demo Home Page'),
    );
  }
}
