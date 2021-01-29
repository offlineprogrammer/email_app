import 'dart:async';

import 'package:email_app/models/contact.dart';
import 'package:email_app/service/contact_service.dart';

List<String> CONTACTS = ['User 1', 'User 2', 'User 3', 'User 4'];

class ContactManager {
  Stream<List<Contact>> get contactListNow =>
      Stream.fromFuture(ContactService.browse());

  Stream<List<Contact>> filteredCollection({query}) =>
      Stream.fromFuture(ContactService.browse(query: query));

  final StreamController<int> _contactCounter = StreamController<int>();

  Stream<int> get contactCounter => _contactCounter.stream;

  ContactManager() {
    contactListNow.listen((list) => _contactCounter.add(list.length));
  }
}
