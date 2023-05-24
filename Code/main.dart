import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:medicine/firstpage.dart';
import 'package:medicine/login_page.dart';
import 'package:medicine/sign_up.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());

}
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  FirebaseAuth auth =  FirebaseAuth.instance;
  User? user;
  @override
  void initState() {
    user = auth.currentUser;
    setState(() {

    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: "Medicine App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: SignupScreen(),
      home:user != null ? FirstPage() : LoginScreen(),
    );
  }
}

