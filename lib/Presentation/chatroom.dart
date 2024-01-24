import 'package:flutter/material.dart';
import 'package:mini_project_chat/Domain/GetChatRoom.dart';
import 'package:mini_project_chat/Presentation/Login.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

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
        child: FutureBuilder<List>(
            // future: GetUser().execute(widget.username),
            future: GetChatRoom().execute(username),
            builder: (context, snapshot) {
              return Text("data");
    }
    )
      )
    );
  }
}