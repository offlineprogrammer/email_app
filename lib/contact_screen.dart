import 'package:email_app/app_drawer.dart';
import 'package:flutter/material.dart';

class ContactScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts'),
      ),
      drawer: AppDrawer(),
      body: StreamBuilder<Object>(builder: (context, snapshot) {
        return Center(
          child: Text('Contacts'),
        );
      }),
    );
  }
}
