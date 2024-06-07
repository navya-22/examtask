import 'package:examtask/screens/register_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../services/firebase_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailcontroller =TextEditingController();
  TextEditingController _passwordcontroller=TextEditingController();
  bool _passwordVisible =false;
  final authService = AuthServices();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[100],
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin:EdgeInsets.all(8.0) ,
                padding: EdgeInsets.all(16.0),
                height: 80,
                width: 350,
                child: const Text(' login to continue',
                  style: TextStyle(fontSize: 40,color: Colors.white,fontWeight: FontWeight.bold),),
              ),
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Enter your Email :',style: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.bold),),
                    Container(
                      margin: const EdgeInsets.all(10),
                      height: 60,
                      width: 400,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16)
                      ),
                     
                      child: TextFormField(
                        controller: _emailcontroller,
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
                    Container(
                      margin: EdgeInsets.all(10),
                      height: 150,
                      width: 400,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(' Enter your Password :',style: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.bold),),
                          Container(

                            width: 400,
                            margin: EdgeInsets.all(6.0),
                            padding: EdgeInsets.all(6.0),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16)
                            ),

                            child: TextFormField(
                              controller: _passwordcontroller,
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
                  ],
                ),
              ),

                    SizedBox(height: 20,),
                    Container(
                      height: 50,
                    //  margin: EdgeInsets.all(10),
                      alignment: Alignment
                          .centerRight, // Aligns the child to the right of the container
                      //padding: const EdgeInsets.all(10.0), // Adds some padding around the text
                      child: const Text(
                        'Forgot Password ?',
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                        textAlign: TextAlign.right,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(18),
                      width: 390,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            backgroundColor: Colors.blueAccent),
                        onPressed: () {
                          String email= _emailcontroller.text;
                          String password =_passwordcontroller.text;
                          if(_formKey.currentState!.validate()){
                            authService.login(email: email, password: password,context: context);
                          }
                        }, child: Text('login',style: TextStyle(color: Colors.white),),
                      ),
                    ),
                    const SizedBox(height: 50,),

                    Row(
                      children: [
                        const SizedBox(width: 80,),
                        const Text(" Didn't have an account ?",style: TextStyle(fontSize: 15),),
                        TextButton(
                          onPressed:() {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterScreen(),));
                          },
                          child:  const Text(
                            '     Register',
                            style: TextStyle(color: Colors.blueAccent),
                          ),
                        ),
                      ],
                    ),

                  ],
                ),

            ],
          ),
        ),
      ),
    );
  }
}
