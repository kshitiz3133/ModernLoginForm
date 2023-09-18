import "package:firebase_core/firebase_core.dart";
import "package:flutter/material.dart";
import "package:testing/Authentication/auth_page.dart";
import "package:testing/firebase_options.dart";
void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const Home());
}
class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: AuthPage(),
    );
  }
}
