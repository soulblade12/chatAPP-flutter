import 'package:flutter/material.dart';
import 'package:mini_project_chat/Domain/GetChatRoom.dart';
import 'package:mini_project_chat/Presentation/chatmessage.dart';

class HomePage extends StatefulWidget {
  final String username;
  const HomePage({Key? key, required this.username}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState(this.username);
}

class _HomePageState extends State<HomePage> {
  final String username;
  _HomePageState(this.username);

  List<String> roomList = [];

  @override
  void initState() {
    super.initState();
    GetUser().execute(this.username).then((result) {
      setState(() {
        roomList = result.cast<String>();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("WhatsApp", style: TextStyle(fontWeight: FontWeight.bold)),
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
              },
            ),
            IconButton(
              icon: Icon(Icons.chat),
              onPressed: () {
              },
            ),
            IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {

              },
            ),
          ],
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.chat)),
              Tab(icon: Icon(Icons.call)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // First tab content
            Container(
              child: FutureBuilder<List>(
                future: GetRoomChat().execute(widget.username),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    var listChat = snapshot.data!;
                    return ListView.builder(
                      itemCount: listChat.length,
                      itemBuilder: (context, i) {
                        return Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ChatMessage(
                                      roomID: roomList[i],
                                      username: '${widget.username}',
                                    ),
                                  ),
                                );
                              },
                              child: ListTile(
                                leading: CircleAvatar(
                                  radius: 30,
                                  backgroundImage: AssetImage('assets/images/avatar.jpg'), // Replace with user avatar
                                ),
                                title: Text('${listChat[i]['users'][1]}', style: TextStyle(fontWeight: FontWeight.bold)),
                                subtitle: Text('${listChat[i]['messages'].last['text'].toString()}'),
                                trailing: Text('${listChat[i]['messages'].last['timestamp'].toString()}'),
                              ),
                            ),
                            Divider(
                              height: 1.0,
                              color: Colors.grey[300],
                            ),
                          ],
                        );
                      },
                    );
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  } else {
                    return const Text('Belum ada chat');
                  }
                },
              ),
            ),

            Container(
              child: Center(child: Text('Calls tab content')),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {

          },
          child: Icon(Icons.chat),
        ),
      ),
    );
  }
}
