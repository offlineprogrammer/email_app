import 'package:email_app/app_drawer.dart';
import 'package:email_app/contact_less_builder.dart';
import 'package:email_app/contact_manager.dart';
import 'package:email_app/contact_search_delegate.dart';
import 'package:email_app/models/contact.dart';
import 'package:flutter/material.dart';

class ContactScreen extends StatelessWidget {
  ContactManager manager = new ContactManager();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts'),
        actions: [
          Chip(
            label: StreamBuilder<int>(
                stream: manager.contactCounter,
                builder: (context, snapshot) {
                  return Text(
                    (snapshot.data ?? 0).toString(),
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  );
                }),
            backgroundColor: Colors.red,
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                  context: context, delegate: ContactSearchDelegate(manager));
            },
          ),
          Padding(
            padding: EdgeInsets.only(right: 16),
          )
        ],
      ),
      drawer: AppDrawer(),
      body: ContactLessBuilder(
        manager: manager,
        query: null,
      ),
    );
  }
}
