import 'package:mini_project_chat/Data/repository.dart';

class GetChatRoom{
  var repository = ChatRepository();

  Future<List<String>> execute(String username) {
    return repository.getRooms(username);
  }
}