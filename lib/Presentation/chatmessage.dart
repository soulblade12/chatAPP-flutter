// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mini_project_chat/Domain/entitity.dart';
import 'package:mini_project_chat/Domain/getMessage.dart';
import 'package:mini_project_chat/Domain/SendMessage.dart';

class ChatMessage extends StatefulWidget {
  final String roomID;
  final String username;
  const ChatMessage({required this.username, required this.roomID});
  @override
  State<ChatMessage> createState() {
    return _ChatMessage(roomID: this.roomID, username: this.username);
  }

}

class _ChatMessage extends State<ChatMessage>{
  TextEditingController _sendMessageController = TextEditingController();
  final String roomID;
  final String username;
  _ChatMessage({required this.username, required this.roomID});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("username")),
      body: Column(
        children: [
          Expanded(child: FutureBuilder(
              future: GetMessage().execute("${roomID}"),
              builder: (context,snapshot){
                if(snapshot.hasData){
                             var listMessage = snapshot.data!;
                               return ListView(
                          children: List.generate(listMessage.length, (i)
                             {
                               return Container(
                                 child: Card(
                                   child: Column(
                                     children: [
                                       Text('${listMessage[i]['username']}'),
                                       Text('${listMessage[i]['text']}'),
                                       Text('${listMessage[i]['timestamp']}'),
                                     ],
                                   ),
                                 ),
                               );
                             } ));
            }
             else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            } else {
             return const Text('Belum ada chat');
             }
                }
    )),
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _sendMessageController,
                    decoration: InputDecoration.collapsed(
                      hintText: 'Type a message...',
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    CreateMessage().execute(Message(
                        nama: username,
                        id: roomID,
                        Pesan: _sendMessageController.text));
                  },
                ),
              ],
            ),
          ),
    ]
    ),

    );
  }


  }



