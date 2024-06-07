import 'package:flutter/material.dart';

import '../services/firebase_service.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _passwordVisible=false;
  final TextEditingController _emailController=TextEditingController();
  final TextEditingController _passwordController1 =TextEditingController();
  final TextEditingController _passwordController =TextEditingController();
  final authService = AuthServices();

//  String _email;
  // String _password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: Colors.blueGrey[100],
      body:  SafeArea(
      child: SingleChildScrollView(
        child: Column(children: [
          const SizedBox(height: 10,),
          const Text('REGISTER YOUR ACCOUNT',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 36,color: Colors.white),),
          const SizedBox(height: 30,),
          Form(
            key: _formKey,
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30,),
                Text('Enter your email :',style: TextStyle(fontSize: 18,color: Colors.white),),
                SizedBox(height: 20,),
                Container(
                  margin: EdgeInsets.all(10),
                  height: 60,
                  width: 400,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16)
                  ),
                  child: TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      border: InputBorder.none,
                      hintText: '  abc@gmail.com',),
                    validator:(value) {
                      RegExp regex = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~)]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                      if(value!.isEmpty){
                        return'Please enter your email';
                      }else{
                        if(!regex.hasMatch(value)){
                          return'Please enter a valid email';
                        }
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 40,),
                Text('Enter your password :',style: TextStyle(fontSize: 18,color: Colors.white),),
                SizedBox(height: 20,),
                Container(
                  margin: EdgeInsets.all(10),
                  height: 60,
                  width: 400,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16)
                  ),
                  child: TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      border: InputBorder.none,
                      suffixIcon: IconButton(
                        icon: Icon(
                          _passwordVisible ?Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          setState(() {
                            _passwordVisible =!_passwordVisible;
                          });
                        },
                      ),
                    ),
                    validator: (value) {
                      RegExp regex =
                      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#*/$&~]).{8,}$');
                      if (value!.isEmpty){
                        return 'Please enter the password';
                      }else{
                        if(!regex.hasMatch(value)){
                          return 'Enter a valid password';
                        }
                      }
                      return null;
                    },
                    obscureText: !_passwordVisible,
                  ),
                ),
                SizedBox(height: 30,),
                Text('conform  your password :',style: TextStyle(fontSize: 18,color: Colors.white),),
                SizedBox(height: 20,),
                Container(
                  margin: EdgeInsets.all(10),
                  height: 60,
                  width: 400,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16)
                  ),
                  child: TextFormField(
                    controller: _passwordController1,
                    decoration: InputDecoration(focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      border: InputBorder.none,
                      suffixIcon: IconButton(
                        icon: Icon(
                          _passwordVisible ?Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          setState(() {
                            _passwordVisible =!_passwordVisible;
                          });
                        },
                      ),
                    ),
                    validator: (value) {

    RegExp regex2=
    RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#*/$&~]).{8,}$');
    if (value!.isEmpty){
    return 'Please  re enter the password';
    }
    return null;
    },
                    obscureText: !_passwordVisible,
                  ),
                ),],
            ),
          ),
          SizedBox(height: 30,),
          Container(
            width: MediaQuery.of(context).size.width-4.0,
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  backgroundColor: Colors.blueAccent),
              onPressed: () async {
                String email =_emailController.text;
                String password =_passwordController.text;
                String conform = _passwordController1.text;
                if(_formKey.currentState!.validate()){
                  await  authService.register(email:email,password: password,conform: conform, context: context );
                  print('hai');
                }
              },
              child:const Text(
                '     Register',
                style: TextStyle(color: Colors.white,fontSize: 18),
              ),
            ),

          ),

        ],),
      ),
    ),
    );
  }
}

