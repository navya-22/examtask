import 'package:examtask/services/db_service.dart';
import 'package:examtask/services/user_model.dart';
import 'package:flutter/material.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  final TextEditingController _idController =TextEditingController();
  final TextEditingController _nameController =TextEditingController();
  final TextEditingController _ageController =TextEditingController();
  final _formKey =GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 50,),
              Text('  Enter your Details', style: TextStyle(fontSize: 38,color: Colors.white,fontWeight: FontWeight.bold),),
              SizedBox(height: 50,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('  Enter your Id :', style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
                  Container(
                    margin: EdgeInsets.all(15.0),
                    height: 60,
                    width: 380,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
                    color: Colors.white),
                    child: TextFormField(
                            controller:_idController,
                            decoration: InputDecoration(focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              border: InputBorder.none,
                              ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return ' Please Enter User id ';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('  Enter your Name :', style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
                  Container(
                    margin: EdgeInsets.all(15.0),
                    height: 60,
                    width: 380,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
                        color: Colors.white),
                    child: TextFormField(
                      controller:_nameController,
                      decoration: const InputDecoration(focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        border: InputBorder.none,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return ' Please Enter User Name ';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('  Enter your Age :', style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
                  Container(
                    margin: const EdgeInsets.all(15.0),
                    height: 60,
                    width: 380,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
                        color: Colors.white),
                    child: TextFormField(
                      controller:_ageController,
                      decoration: const InputDecoration(focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        border: InputBorder.none,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return ' Please Enter User Age ';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 100,),
              ElevatedButton(
                style: const ButtonStyle(
                  fixedSize: MaterialStatePropertyAll(Size(300, 50))
                ),
                  onPressed: () async {
                  String id =_idController.text;
                  String name =_nameController.text;
                  String age = _ageController.text;
                  if( _formKey.currentState!.validate()){
                  User data=  User(id: id, name: name, age: age);
                   print(data);
                   await  insertUser(data);
                    Navigator.pop(context);
                  }

              }, child: Text('Save',style: TextStyle(fontSize: 20),))
            ],
          ),
        ),
      ),
    );
  }
}
