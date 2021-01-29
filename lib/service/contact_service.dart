import 'package:email_app/models/contact.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class ContactService {
  static String _url = 'https://jsonplaceholder.typicode.com/users';
  static Future<List<Contact>> browse({query}) async {
    List collection;
    Iterable<Contact> _contacts;
    var response = await http.get(_url);
    if (response.statusCode == 200) {
      collection = convert.jsonDecode(response.body);
      _contacts = collection.map((json) => Contact.fromJson(json));

      if (query != null && query.isNotEmpty) {
        _contacts = _contacts.where((contact) =>
            contact.name.toLowerCase().contains(query.toLowerCase()));
      }
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }

    return _contacts.toList();
  }
}
