import 'package:email_app/app_drawer.dart';
import 'package:email_app/contact_counter.dart';
import 'package:email_app/contact_less_builder.dart';
import 'package:email_app/contact_manager.dart';
import 'package:email_app/contact_search_delegate.dart';
import 'package:email_app/models/contact.dart';
import 'package:email_app/provider.dart';
import 'package:flutter/material.dart';

class ContactScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts'),
        actions: [
          ContactCounter(),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: ContactSearchDelegate());
            },
          ),
          Padding(
            padding: EdgeInsets.only(right: 16),
          )
        ],
      ),
      drawer: AppDrawer(),
      body: ContactLessBuilder(
        query: null,
      ),
    );
  }
}
