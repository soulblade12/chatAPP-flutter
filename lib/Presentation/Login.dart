import 'package:flutter/material.dart';
import 'package:mini_project_chat/Presentation/chatroom.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage>{
  TextEditingController _usernameController = TextEditingController();
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  Map<String, dynamic> listUser = {};

  @override
  void initState() {
    super.initState();
    fetchListUserData();
  }
  static const URL = 'http://127.0.0.1:8080';

  Future<void> fetchListUserData() async {
    final response = await http.get(Uri.parse('http://127.0.0.1:8080/api/user/'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      setState(() {
        listUser = data['data'];
      });
    } else {
      throw Exception('Failed to load listUser data');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,

      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
            children: [
            Text("Login Page",style: TextStyle(
              fontSize: 45,
              fontWeight: FontWeight.bold,
              color: Colors.white),),
            SizedBox(
              height: 20,
            )]),flex: 1),
          Expanded(child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:BorderRadius.only(topLeft:  Radius.circular(40),topRight:  Radius.circular(40),
                ), ),
            child:Column(
              children: [
                Form(key: _formkey,
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: _usernameController,
                          decoration: InputDecoration(
                              labelText: "Username", border: OutlineInputBorder()),
                        ),
                        SizedBox(
                          height: 12,
                        ),

                        SizedBox(
                          height: 12,
                        ),
                        ElevatedButton(
                            child: Text('Login'),
                            onPressed: () {
                              Navigator.push(context,
                              MaterialPageRoute(builder: (context) => HomePage(
                                  username: _usernameController.text)));
                                }),
                      ],
                    ),
                  ),)
              ],
            ) ,
          ),flex: 2,)

        ],
      ),      
    );
  }



}