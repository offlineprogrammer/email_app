import 'dart:convert';

import 'package:email_app/compose_button.dart';
import 'package:email_app/message.dart';
import 'package:email_app/message_compose.dart';
import 'package:email_app/message_detail.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              accountEmail: Text('myemail@gmail.com'),
              accountName: Text('Testing'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://avatars.githubusercontent.com/u/12375969?s=460&u=d32ac8be075c4d569b66c53e1226b74bfe95d6e4&v=4'),
              ),
              otherAccountsPictures: [
                GestureDetector(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('Addinng new account'),
                          );
                        });
                    print('Add Account');
                  },
                  child: CircleAvatar(
                    child: Icon(Icons.add),
                  ),
                )
              ],
            ),
            ListTile(
              leading: Icon(FontAwesomeIcons.inbox),
              title: Text('Inbox'),
              trailing: Chip(
                label: Text(
                  '11',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                backgroundColor: Colors.blue[100],
              ),
            ),
            ListTile(
              leading: Icon(FontAwesomeIcons.edit),
              title: Text('Draft'),
            ),
            ListTile(
              leading: Icon(FontAwesomeIcons.archive),
              title: Text('Archive'),
            ),
            ListTile(
              leading: Icon(FontAwesomeIcons.paperPlane),
              title: Text('Sent'),
            ),
            ListTile(
              leading: Icon(FontAwesomeIcons.trash),
              title: Text('Trash'),
            ),
            Divider(),
            Expanded(
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: ListTile(
                  leading: Icon(FontAwesomeIcons.cog),
                  title: Text('Settings'),
                ),
              ),
            ),
          ],
        ),
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
