import 'dart:convert';
import 'package:http/http.dart' as http;

class UserDataSource {

    static const URL = 'http://127.0.0.1:8080';

    Future<String> getUserData(String username) async{
      var response = await http.get(Uri.parse("${URL}/api/user/$username"));

      if (response.statusCode == 200) {
        print('${response.body}');
        return (response.body);
      } else {
        throw Exception('Failed to load user data');
      }
    }

    Future<String> getChatData(String id) async {
      final response = await http.get(Uri.parse('${URL}/api/chat/$id'));

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to load chat data');
      }
    }

    Future<String> getRoomData(String username) async {
      final response = await http.get(Uri.parse('${URL}/api/room/$username'));

      if (response.statusCode == 200) {
        print('${response.body}');
        return json.decode(response.body)['data'];
      } else {
        throw Exception('Failed to load room data');
      }
    }


}