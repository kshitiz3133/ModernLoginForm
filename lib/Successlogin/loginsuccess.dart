import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:testing/Successlogin/successloginanimation/successanimationcirclezoom.dart';
import '../Authentication/auth_page.dart';
import '../circleanimation.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double a = 0;

  @override
  void initState() {
    super.initState();
    // Start a delayed timer
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        a = -1;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  final user = FirebaseAuth.instance.currentUser!;

  void signout() async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (_) => const AuthPage()));
    //Get.offAll(()=>AuthPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      body: Stack(children: [
        MyCircularContainer(),
        AnimatedContainer(
          duration: Duration(seconds: 1),
          alignment: Alignment(0,a),
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: Animatedcircle(),
            )),
        AnimatedContainer(
          alignment: Alignment(0, a),
          duration: const Duration(seconds: 1),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(100, 50, 0, 0),
            child: SizedBox(
              height: 81,
              child: Row(
                children: [
                  Column(
                    children: [
                      Text("Logged In as " + user.email!),
                      const SizedBox(
                        height: 20,
                      ),
                      TextButton(
                          onPressed: () {
                            signout();
                          },
                          child: const Text('Sign Out',
                              style: TextStyle(color: Colors.deepPurple))),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
