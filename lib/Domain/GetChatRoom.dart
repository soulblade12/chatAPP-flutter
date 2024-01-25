import 'package:mini_project_chat/Data/repository.dart';

class GetUser{
  var repository = ChatRepository();

  Future<List> execute(username){
    return repository.getUser(username);
  }
}

class GetRoomChat{
  var repository = ChatRepository();

  Future<List> execute(username){
    return repository.getRoomChat(username);
  }
}