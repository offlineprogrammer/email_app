import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
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
    );
  }
}
