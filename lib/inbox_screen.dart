import 'package:email_app/app_drawer.dart';
import 'package:email_app/message_list.dart';
import 'package:flutter/material.dart';

class InboxScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Inbox'),
          actions: [
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () async {},
            )
          ],
          bottom: TabBar(
            tabs: [
              Tab(
                text: 'Important',
              ),
              Tab(
                text: 'Others',
              ),
            ],
          ),
        ),
        drawer: AppDrawer(),
        body: TabBarView(
          children: [
            MessageList(status: 'important'),
            MessageList(status: 'other'),
          ],
        ),
      ),
    );
  }
}
