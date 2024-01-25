import 'package:mini_project_chat/Data/repository.dart';

class GetMessage{
  var repository = ChatRepository();

  Future<List> execute(Message){
    return repository.getMessage(Message);
  }
}