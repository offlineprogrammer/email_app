import 'package:email_app/contact_manager.dart';
import 'package:flutter/material.dart';

class Provider extends InheritedWidget {
  final ContactManager data;

  Provider({Key key, Widget child, this.data}) : super(key: key, child: child);

  static ContactManager of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Provider>().data;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    // TODO: implement updateShouldNotify
    return false;
  }
}
