import 'dart:convert';
import 'package:http/http.dart' as http;

class UserDataSource {

    static const URL = 'http://127.0.0.1:8080';

    Future<String> getRoomChat(String username) async{
      var response = await http.get(Uri.parse('${URL}/api/room/${username}'));
      if (response.statusCode == 200) {
        // print('${response.body}');
        return (response.body);
      } else {
        throw Exception('Failed to load user data');
      }
    }

    Future<String> getUser(String username) async{
      var response = await http.get(Uri.parse('${URL}/api/user/${username}'));
      if (response.statusCode == 200) {
        // print('${response.body}');
        return (response.body);
      } else {
        throw Exception('Failed to load user data');
      }
    }

    Future<String> getChat(String id) async{
      var response = await http.get(Uri.parse('${URL}/api/chat/${id}'));
      if (response.statusCode == 200) {
        // print('${response.body}');
        return (response.body);
      } else {
        throw Exception('Failed to load user data');
      }
    }

      Future<String> createMessage(Map<String, dynamic> message) async {
      var response = await http.post(
        Uri.parse('${URL}/api/chat'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'nama': message['nama'],
          'id': message['id'],
          'Pesan': message['Pesan']
        }),
      );
      return jsonDecode(response.body)['data'];
    }
}
