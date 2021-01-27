import 'package:email_app/calendar_screen.dart';
import 'package:email_app/contact_screen.dart';
import 'package:email_app/inbox_screen.dart';
import 'package:email_app/message_list.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'app_drawer.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: [
        InboxScreen(),
        ContactScreen(),
        CalendarScreen(),
      ].elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(title: Text('Inbox'), icon: Icon(Icons.mail)),
          BottomNavigationBarItem(
              title: Text('Contact'), icon: Icon(Icons.people)),
          BottomNavigationBarItem(
              title: Text('Calendar'), icon: Icon(Icons.calendar_today)),
        ],
        onTap: _onBarItemTap,
        currentIndex: _selectedIndex,
      ),
    );
  }

  void _onBarItemTap(int value) {
    setState(() {
      _selectedIndex = value;
    });
  }
}
