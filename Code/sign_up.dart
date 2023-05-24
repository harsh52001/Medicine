import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medicine/login_page.dart';
import 'package:medicine/utils.dart';

class SignupScreen extends StatefulWidget {
  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  FirebaseAuth auth =FirebaseAuth.instance;

  final formField=GlobalKey<FormState>();
  final emailController=TextEditingController();
  final passwordController=TextEditingController();
  @override
  void dispose()
  {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();

  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

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
                    validator: (value){
                      if(value!.isEmpty)
                      {
                        return "Enter Email Please";
                      }
                      else
                      {
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
                        }
                        else {
                          return null;
                        }
                      }
                  ),

                ],
              ),

            ),
            SizedBox(height: 5.0),




            SizedBox(height: 20.0),
            InkWell(
              onTap: (){
                //Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginWithPhoneNumber()));
              },
              child: Container(
                  height: 50,
                  child: Center(child: Text('Sign Up')),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(50),
                  )
              ),
            ),
            SizedBox(height: 10,),





            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                    'Already member of Adhicine?'
                ),
                TextButton(onPressed:(){
                  auth.createUserWithEmailAndPassword(
                      email: emailController.text.toString(),
                      password: passwordController.text.toString()
                  ).then((value){
                    Utils().toastMessage("Registered");
                  }).onError((error, stackTrace){
                    Utils().toastMessage(error.toString());
                  });
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginScreen()));

                }, child: Text("Sign In"))
              ],
            ),

          ],
        ),
      ),
    );
  }
}