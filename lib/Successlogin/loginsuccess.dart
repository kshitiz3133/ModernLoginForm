import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../Authentication/auth_page.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double a = 0;
  double b = 250;
  double c = 250;
  int d = 0;
  bool f = false;
  BoxShape e = BoxShape.circle;

  @override
  void initState() {
    super.initState();
    // Start a delayed timer
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        a = -1;
        b += 900;
        c += 900;
        d = 1;
        e = BoxShape.rectangle;
        f = true;
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
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
        AnimatedContainer(
          alignment: Alignment(0, a),
          duration: const Duration(seconds: 1),
          child: AnimatedSize(
            duration: const Duration(milliseconds: 400),
            child: Container(
              height: b,
              width: c,
              decoration: BoxDecoration(
                shape: e,
                color: Colors.deepPurple[50],
              ),
            ),
          ),
        ),
        AnimatedContainer(
          alignment: Alignment(0, a),
          duration: const Duration(seconds: 1),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(125, 10, 0, 0),
            child: SizedBox(
              height: 65,
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
