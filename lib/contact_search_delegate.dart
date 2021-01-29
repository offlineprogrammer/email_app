import 'package:email_app/contact_less_builder.dart';
import 'package:email_app/contact_manager.dart';
import 'package:email_app/models/contact.dart';
import 'package:flutter/material.dart';

class ContactSearchDelegate extends SearchDelegate {
  final ContactManager manager;

  ContactSearchDelegate(this.manager);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.length < 3) {
      return Center(
        child: Text('We need more'),
      );
    }
    return ContactLessBuilder(manager: manager, query: query);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }
}
