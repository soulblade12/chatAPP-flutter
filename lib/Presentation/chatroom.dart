import 'package:flutter/material.dart';
import 'package:mini_project_chat/Domain/GetChatRoom.dart';

class HomePage extends StatefulWidget {
  final String username;
  const HomePage({super.key, required this.username});
  @override
  State<HomePage> createState() => _HomePageState(this.username);
}

class _HomePageState extends State<HomePage> {
  final String username;
  _HomePageState(this.username);
  // List<String> listChat = [];
  // Map<String, List<Map<String, dynamic>>> roomMessages = {};
  @override
  void initState() {
    super.initState();
    // GetUser().execute(widget.username);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: const CommonAppBar(),
        body: Container(
            // height: MediaQuery.of(context).size.height - kToolbarHeight,
            child: FutureBuilder<List<String>>(
                // future: GetUser().execute(widget.username),
                future: GetChatRoom().execute(username),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    var listChat = snapshot.data!;
                    return ListView(
                      children: List.generate(listChat.length, (i) {
                        return InkWell(
                            onTap: () {},
                            child: ListTile(
                              leading: const CircleAvatar(
                                child: Icon(Icons.person),
                              ),
                              title: Text('${listChat[i]}'),
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
