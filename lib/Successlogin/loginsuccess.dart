import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:get/get.dart';

import '../Authentication/auth_page.dart';
class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final user=FirebaseAuth.instance.currentUser!;

  void signout()async{
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => AuthPage()));
    //Get.offAll(()=>AuthPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[50],
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Logged In as "+user.email!
                ),
                SizedBox(height: 20,),
                TextButton(onPressed: (){
                  signout();
                }, child: Text('Sign Out',style: TextStyle(color: Colors.deepPurple)))
              ],
            ),
          ],
        ),
    );
  }
}
