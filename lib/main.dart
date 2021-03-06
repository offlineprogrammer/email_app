import 'package:email_app/contact_manager.dart';
import 'package:email_app/message_list.dart';
import 'package:email_app/provider.dart';
import 'package:flutter/material.dart';

import 'app.dart';

void main() {
  runApp(EmailApp());
}

class EmailApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider(
      data: ContactManager(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          accentColor: Colors.red,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: App(), // MessageList(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}
