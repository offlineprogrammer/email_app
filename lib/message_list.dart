import 'dart:convert';

import 'package:email_app/message.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MessageList extends StatefulWidget {
  final String title;

  const MessageList({Key key, this.title}) : super(key: key);

  @override
  _MessageListState createState() => _MessageListState();
}

class _MessageListState extends State<MessageList> {
  var messages = const [];

  Future loadMessageList() async {
    var content = await rootBundle.loadString('data/message.json');
    List collection = json.decode(content);
    List<Message> _messages =
        collection.map((json) => Message.fromJson(json)).toList();
    setState(() {
      messages = _messages;
    });
  }

  void initState() {
    loadMessageList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.separated(
        itemCount: messages.length,
        itemBuilder: (BuildContext context, int index) {
          Message message = messages[index];
          return ListTile(
            title: Text(message.subject),
            isThreeLine: true,
            leading: CircleAvatar(
              child: Text('PJ'),
            ),
            subtitle: Text(
              message.body,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider();
        },
      ),
    );
  }
}
