import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medicine/login_page.dart';
import 'package:medicine/utils.dart';
class ForgetPassword extends StatelessWidget {
   ForgetPassword({Key? key}) : super(key: key);

 final emailController=TextEditingController();
 final auth=FirebaseAuth.instance;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Make New Password"),
        centerTitle: true,
      ),
      body: Column(

        children: [
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextFormField(
              keyboardType: TextInputType.text,
              controller: emailController,
              decoration: InputDecoration(
                hintText: "Enter the Email",
                prefixIcon: Icon(Icons.email),

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
          ),
          SizedBox(height: 20,),
          InkWell(
            onTap: (){
              auth.sendPasswordResetEmail(email: emailController.text.toString()).then((value){
                Utils().toastMessage("We sent you an email to recover password");
                Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginScreen()));
              }).onError((error, stackTrace){
                Utils().toastMessage(error.toString());
              });

              //  Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginWithPhoneNumber()));
            },
            child: Container(
                height: 50,
                child: Center(child: Text('Forget')),
                decoration: BoxDecoration(
                  color: Colors.cyan.shade200,
                  borderRadius: BorderRadius.circular(50),
                ),

            ),
          ),

        ],
      ),
    );
  }
}
