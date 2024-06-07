import 'package:examtask/screens/add_screen.dart';
import 'package:examtask/services/db_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../services/user_model.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  List<User> userlist =[];
  @override
  void initState(){
    super.initState();
  loadUser();
  }
Future<void>loadUser()async{
    final users = await getUser();
    setState(() {

      userlist =users;
    });
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.blueGrey[100],
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: userlist.length,
              itemBuilder: (BuildContext context, int index) {
                return listContainer(userlist[index],index);
              },),
          ),

          ElevatedButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) =>const AddScreen() ,));
          }, child: const Text('Add'))
        ],
      ),
    );
  }

  Widget listContainer( User user, int index ) => Container(
          height: 200,
          width: 350,
          padding: const EdgeInsets.all(16.0),
          margin: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
          color: Colors.white),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('id : ${user.id}'),
              Text('name : ${ user.name}'),
              Text('age : ${ user.age}')
            ],
          ),
        );
}
