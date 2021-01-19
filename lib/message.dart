import 'package:json_annotation/json_annotation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
part 'message.g.dart';

@JsonSerializable()
class Message {
  final String subject;
  final String body;

  Message(this.subject, this.body);

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);

  static Future<List<Message>> browse() async {
    List collection;
    List<Message> _messages;
    var url = 'https://run.mocky.io/v3/72602836-4b7c-435c-97d2-ace363ece212';

    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    if (response.statusCode == 200) {
      collection = convert.jsonDecode(response.body);
      _messages = collection.map((json) => Message.fromJson(json)).toList();
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
    return _messages;
  }
}
