import 'dart:convert';

import 'package:email_app/compose_button.dart';
import 'package:email_app/message.dart';
import 'package:email_app/message_compose.dart';
import 'package:email_app/message_detail.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class MessageList extends StatefulWidget {
  final String title;

  const MessageList({Key key, this.title}) : super(key: key);

  @override
  _MessageListState createState() => _MessageListState();
}

class _MessageListState extends State<MessageList> {
  Future<List<Message>> future;
  List<Message> _messages;

  void fetch() async {
    future = Message.browse();
    _messages = await future;
  }

  void initState() {
    fetch();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () async {
              var _messages = await Message.browse();
              setState(() {
                _messages = _messages;
              });
            },
          )
        ],
      ),
      body: FutureBuilder(
        future: future,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
            case ConnectionState.active:
              return Center(child: CircularProgressIndicator());
            case ConnectionState.done:
              if (snapshot.hasError)
                return Text('There was an error : ${snapshot.error}');
              var messages = snapshot.data;
              return ListView.separated(
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
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => MessageDetail(
                                  message.subject, message.body)));
                    },
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Divider();
                },
              );
          }
        },
      ),
      floatingActionButton: ComposeButton(_messages),
    );
  }
}
