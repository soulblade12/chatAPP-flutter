import 'package:mini_project_chat/Data/repository.dart';
import 'package:mini_project_chat/Domain/entitity.dart';

class CreateMessage {
  var repository = ChatRepository();
  Future<bool> execute(Message message) {
    return repository.createMessage(message);
  }
}