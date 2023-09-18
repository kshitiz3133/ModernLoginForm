import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:testing/Anonymous/anonymous_logic_login.dart';
import 'package:testing/Register/registerpage.dart';
import 'package:get/get.dart';
import '../Authentication/auth_page.dart';
import '../Successlogin/loginsuccess.dart';
class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailController=TextEditingController();

  final passwordController=TextEditingController();

  void signUserIn()async{
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text
      );
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => AuthPage()));

    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
    //Get.to(()=>Home());
  }

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 600,
            width: 300,
            child: Center(
              child: Column(
                children: [
                  SizedBox(height: 70),
                  Icon(Icons.account_circle,size: 90,),
                  SizedBox(height: 10),
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)
                        ),
                        hintText: 'Email'
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)
                        ),
                        hintText: 'Password',

                    ),
                  ),
                  SizedBox(height: 20),
                  TextButton(onPressed: (){
                    signUserIn();
                  }, child: Text("Login",style: TextStyle(color: Colors.deepPurple))),
                  TextButton(onPressed: (){}, child: Text("Cancel",style: TextStyle(color: Colors.deepPurple))),
                  SizedBox(height: 40),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [Text("Forget Password?"),GestureDetector(child: Text("Sign Up"),onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Register()));
                  },)],),
                  SizedBox(height: 20,),
                  TextButton(onPressed: (){
                    Anonymous();
                  }, child: Text("Login As Guest",style: TextStyle(color: Colors.deepPurple))),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
