import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:get/get.dart';
import '../Anonymous/anonymous_logic_login.dart';
import '../Authentication/auth_page.dart';
import '../Login/loginpage.dart';
import '../Successlogin/loginsuccess.dart';
class Register extends StatefulWidget {
  Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final emailController=TextEditingController();

  final passwordController=TextEditingController();

  void register()async{
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => AuthPage()));

    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
    //Get.to(()=>Home());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [Container(
          height: double.maxFinite,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.deepPurple.shade50,Colors.deepPurple.shade100,Colors.deepPurple.shade200,],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
            )
          ),
          child: Row(
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
                        register();
                      }, child: Text("Register",style: TextStyle(color: Colors.deepPurple))),
                      TextButton(onPressed: (){}, child: Text("Cancel",style: TextStyle(color: Colors.deepPurple))),
                      SizedBox(height: 40),
                      Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [Text("Forget Password?"),GestureDetector(onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));},child: Text("Log In"))],),
                      SizedBox(height: 20,),
                      TextButton(onPressed: (){
                        Anonymous();
                      }, child: Text("Login As Guest",style: TextStyle(color: Colors.deepPurple),)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
