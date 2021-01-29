import 'package:email_app/contact_manager.dart';
import 'package:email_app/models/contact.dart';
import 'package:email_app/provider.dart';
import 'package:flutter/material.dart';

class ContactLessBuilder extends StatelessWidget {
  const ContactLessBuilder({
    Key key,
    @required this.query,
  }) : super(key: key);

  final String query;

  @override
  Widget build(BuildContext context) {
    ContactManager manager = Provider.of(context);
    return StreamBuilder(
        stream: manager.filteredCollection(query: query),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
            case ConnectionState.active:
              return Center(child: CircularProgressIndicator());
            case ConnectionState.done:
              if (snapshot.hasError)
                return Text('There was an error : ${snapshot.error}');
              List<Contact> contacts = snapshot.data;

              return ListView.separated(
                itemCount: contacts?.length ?? 0,
                itemBuilder: (BuildContext context, int index) {
                  Contact _contact = contacts[index];
                  return ListTile(
                    title: Text(_contact.name),
                    subtitle: Text(_contact.email),
                    leading: CircleAvatar(),
                  );
                },
                separatorBuilder: (context, index) => Divider(),
              );
          }
        });
  }
}
