import 'dart:math';

import 'package:eat/service/auth.dart';
import 'package:eat/view/sign.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:eat/viewmodel/UserViewModel.dart';
import 'package:flutter/services.dart';

import '../home.dart';
import '../viewmodel/UserViewModel.dart';

class LogPage extends StatefulWidget {
  const LogPage({super.key});

  @override
  State<LogPage> createState() => _LogPageState();
}

class _LogPageState extends State<LogPage> {
  final _formKey = GlobalKey<FormState>();
  static final _emailController = TextEditingController();
  static final _passwordController = TextEditingController();

  get actionCodeSettings => null;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            SystemNavigator.pop();
          },
          icon: Icon(Icons.exit_to_app),
          
        ),

      ),
      body:  Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(child:
        Form(
          key: _formKey,
          child: Column( 
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 100,),
              Text('Login',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
              SizedBox(height: 10,),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email',border:
                OutlineInputBorder( borderRadius: BorderRadius.circular(
                  10,
                ))),

                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10,),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: 'Password', border: OutlineInputBorder(borderRadius: BorderRadius.circular(
                  10,)),),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              ButtonTheme(height:200,buttonColor: Colors.blue,

                child:
              ElevatedButton(

                onPressed: () async {
                  if (_formKey.currentState?.validate() ?? false) {
                    final email = _emailController.text;
                    final password = _passwordController.text;
                    final auth = Provider.of<FireAuth>(context, listen: false);
                    try {
                      await auth.logIn(email, password);
                      print(auth.auth.currentUser!.emailVerified);
                      if (auth.auth.currentUser!.emailVerified != true) {

                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("verify ur email plz")));
                      }
                      else {

                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) =>  MyHomePage()),);

                      }
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("log in not reconized: ${e.toString()}")),
                      );
                    }
                  }

                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(0, 0, 240, 100),

                    fixedSize: Size(400, 40), // specify width, height
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          20,
                        ))),
                child: Text('Log in',style: TextStyle(color: Colors.white),),
              ),),
               TextButton(onPressed: () {
                SystemNavigator.pop();
              },
child: Text('Forgot password?',style:TextStyle(color:Colors.black)),


              ),
              SizedBox(height: 150,),
          ElevatedButton(

          onPressed:() {
             Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SignPage()),);
    },

            style: ElevatedButton.styleFrom(


                fixedSize: Size(400, 40), // specify width, height
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      20,
                    ))),

            child: Text('Create new account',style: TextStyle(color: Colors.blue),),
          ),
          ],
          ),
        ),
      ),),
    );
  }

  get emailController => _emailController;
}
