import 'package:flutter/material.dart';
import 'package:mini_project_chat/Domain/GetChatRoom.dart';
import 'package:mini_project_chat/Presentation/chatmessage.dart';

class HomePage extends StatefulWidget {
  final String username;
  const HomePage({super.key, required this.username});
  @override
  State<HomePage> createState() => _HomePageState(this.username);
}

class _HomePageState extends State<HomePage> {
  final String username;
  _HomePageState(this.username);


  // Map<String,List<Map<String, dynamic>>> chatRoom = {};
  @override
  List<String> roomList = [];
  void initState() {
    // super.initState();
    GetUser().execute(this.username).then((result) {
      setState(() {
        roomList = result.cast<String>();
      });
    });
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
        appBar: AppBar(
            title: const Text("Home Page")),
        body: Container(

            child: FutureBuilder<List>(

                future: GetRoomChat().execute(widget.username),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    var listChat = snapshot.data!;
                    return ListView(
                      children: List.generate(listChat.length, (i) {
                        return InkWell(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => ChatMessage(
                                    roomID: roomList[i],
                                    username: '${widget.username}',)));
                            },
                            child: ListTile(
                              leading: const CircleAvatar(
                                child: Icon(Icons.person),
                              ),
                              title: Text('${listChat[i]['users'][1]}'),
                            ));
                      }),
                    );
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  } else {
                    return const Text('Belum ada chat');
                  }
                })));
  }
}
