

import 'package:mini_project_chat/Data/datasource.dart';
// import 'package:mini_project_chat/Domain/entitity.dart';
import 'dart:convert';

class ChatRepository{
  var remoteChatDataSource = UserDataSource();

  Future<List<String>> getRooms(String username) async {
    var listChatRoom =
    jsonDecode(await remoteChatDataSource.getUserData(username))['data'];
    List<String> listUserData = List<String>.from(listChatRoom);
    return listUserData;
  }




}