import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medicine/forget_password.dart';
import 'package:medicine/sign_up.dart';
import 'package:medicine/thirdpage.dart';
import 'package:medicine/utils.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'firstpage.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  final auth = FirebaseAuth.instance;

  final formField = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  //final user = auth.currentUser;
  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  googleLogin() async {
    GoogleSignIn _googleSignIn = GoogleSignIn();
    try {
      var reslut = await _googleSignIn.signIn();
      if (reslut == null) {
        return;
      }

      final userData = await reslut.authentication;
      final credential = GoogleAuthProvider.credential(
          accessToken: userData.accessToken, idToken: userData.idToken);
      var finalResult =
          await FirebaseAuth.instance.signInWithCredential(credential);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => FirstPage()));
      // print("Result $reslut");
      //  print(reslut.displayName);
      //  print(reslut.email);
      //  print(reslut.photoUrl);
    } catch (error) {
      Utils().toastMessage(error.toString());
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(35)),
                ),
                child: Image.asset('assets/images/icon.png')),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0, right: 200.0),
              child: Text(
                "Sign In",
                style: TextStyle(fontSize: 32),
              ),
            ),
            SizedBox(height: 10.0),
            Form(
              key: formField,
              child: Column(
                children: [
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      prefixIcon: Icon(Icons.email),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter Email";
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                      keyboardType: TextInputType.text,
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        prefixIcon: Icon(Icons.lock),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter Password";
                        } else {
                          return null;
                        }
                      }),
                ],
              ),
            ),
            SizedBox(height: 5.0),
            Align(
              alignment: Alignment.bottomRight,
              child: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ForgetPassword()));
                  },
                  child: Text('Forget Password?')),
            ),
            SizedBox(height: 10.0),
            InkWell(
              onTap: () {
                if (formField.currentState!.validate()) {
                  auth
                      .signInWithEmailAndPassword(
                          email: emailController.text.toString(),
                          password: passwordController.text.toString())
                      .then((value) {
                    Utils().toastMessage(value.user!.email.toString());
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => FirstPage()));
                  }).onError((error, stackTrace) {
                    debugPrint(error.toString());
                    Utils().toastMessage(error.toString());
                  });
                }
              },
              child: Container(
                  height: 50,
                  child: Center(child: Text('Sign In')),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(50),
                  )),
            ),
            SizedBox(
              height: 10,
            ),
            Divider(
              thickness: 3,
              height: 20,
            ),
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                googleLogin();
              },
              child: Container(
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          margin: EdgeInsets.only(left: 45, right: 25),
                          height: 25,
                          width: 25,
                          decoration: BoxDecoration(
                              //color: Colors.grey.shade200,

                              ),
                          child: Image.asset('assets/images/google.png')),
                      Text(
                        'Continue With Google',
                        style: TextStyle(fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                  decoration: BoxDecoration(
                      //  color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(width: 0))),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('New to Adhicine?'),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignupScreen()));
                    },
                    child: Text("Sign up"))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
