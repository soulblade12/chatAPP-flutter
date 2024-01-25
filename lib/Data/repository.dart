

import 'package:mini_project_chat/Data/datasource.dart';
import 'package:mini_project_chat/Domain/entitity.dart';
import 'dart:convert';


class ChatRepository{
  var remoteChatDataSource = UserDataSource();

  Future<List> getUser(String username) async{
    var jsonArray = jsonDecode(await remoteChatDataSource.getUser(username));
    var listChat = jsonArray['data']['rooms'];

    return listChat;
  }

  Future<List> getRoomChat(String username) async{
    var listRoomChat = jsonDecode(await remoteChatDataSource.getRoomChat(username))['data'];
    // print(listRoomChat);
    return listRoomChat;
  }

  Future<List> getMessage(String room_id) async{
    var listChat = jsonDecode(await remoteChatDataSource.getChat(room_id))['data']['messages'];
    List listChatting = List.from(listChat);
    return
         listChatting;

  }

  Future<bool> createMessage(Message message) async {
    var response =
        await remoteChatDataSource.createMessage(message.toJson() );
    return jsonDecode(response)['data'];
  }
  }





