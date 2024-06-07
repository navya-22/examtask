import 'package:examtask/screens/detail_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AuthServices{

  Future<void>register({
    required String email,
    required String password,
    required String conform,
    required BuildContext context
})async{
    try{
      await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
      Navigator.push(context,MaterialPageRoute(builder: (context) => DetailScreen(),) );
    }catch(e){
     print(e);
    }
  }

Future<void>login({
    required String email,
  required String password,
  required BuildContext context
})
async{
try{
 await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
 Navigator.push(context,MaterialPageRoute(builder: (context) => DetailScreen(),) );
}catch(e){

}
}
}