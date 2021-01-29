import 'package:email_app/contact_manager.dart';
import 'package:email_app/provider.dart';
import 'package:flutter/material.dart';

class ContactCounter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ContactManager manager = Provider.of(context);
    return StreamBuilder<int>(
      stream: manager.contactCounter,
      builder: (context, snapshot) {
        return Chip(
          label: Text(
            (snapshot.data ?? 0).toString(),
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.red,
        );
      },
    );
  }
}
