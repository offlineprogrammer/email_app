import 'package:email_app/message.dart';
import 'package:flutter/material.dart';

class MessageCompose extends StatefulWidget {
  @override
  _MessageComposeState createState() => _MessageComposeState();
}

class _MessageComposeState extends State<MessageCompose> {
  String to = '';
  String subject = '';
  String body = '';

  final key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Compose New Message'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: key,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                title: TextFormField(
                  validator: (value) =>
                      !value.contains('@') ? 'Must be a valid email' : null,
                  onSaved: (value) => to = value,
                  decoration: InputDecoration(
                      labelText: 'To',
                      labelStyle: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ),
              ListTile(
                title: TextFormField(
                  validator: (value) {
                    int len = value.length;
                    if (len == 0) {
                      return 'Must include a value';
                    } else if (len < 4) {
                      return 'Must be at least 4';
                    }
                    return null;
                  },
                  onSaved: (value) => subject = value,
                  decoration: InputDecoration(
                      labelText: 'Subject',
                      labelStyle: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ),
              Divider(),
              ListTile(
                title: TextFormField(
                  onSaved: (value) => body = value,
                  decoration: InputDecoration(
                      labelText: 'Body',
                      labelStyle: TextStyle(fontWeight: FontWeight.bold)),
                  maxLines: 9,
                ),
              ),
              ListTile(
                title: RaisedButton(
                  child: Text('Send'),
                  onPressed: () {
                    if (this.key.currentState.validate()) {
                      this.key.currentState.save();
                      Message message = Message(subject, body);

                      Navigator.pop(context, message);
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
