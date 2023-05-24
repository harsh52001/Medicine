import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:medicine/login_page.dart';
import 'package:medicine/utils.dart';
class ThirdPage extends StatefulWidget {
  const ThirdPage({Key? key}) : super(key: key);

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  final FirebaseAuth auth =FirebaseAuth.instance;
  Future<void> logout() async {
    await GoogleSignIn().disconnect();
    FirebaseAuth.instance.signOut();
  }

  Future<bool> checkInternetConnectivityWifi() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    return connectivityResult != ConnectivityResult.wifi;
  }
  Future<bool> checkInternetConnectivityBlu() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    return connectivityResult != ConnectivityResult.bluetooth;
  }

  void initState()
  {
    super.initState();
    checkInternetConnectivityWifi().then((value){

    }).onError((error, stackTrace){
      Utils().toastMessage(error.toString());
    });

    checkInternetConnectivityBlu().then((value){}).onError((error, stackTrace){
      Utils().toastMessage(error.toString());
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("First Page"),
        centerTitle: true,

        actions: [
          IconButton(onPressed: (){
            auth.signOut();
            logout();

            Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginScreen()));
          }, icon: Icon(Icons.logout),),

          SizedBox(width: 10,),


        ],
      ),
      body: Column(
        children: [
          TextButton(onPressed: (){
            checkInternetConnectivityWifi().then((isWifiConnected) {
              if (isWifiConnected) {
                Utils().toastMessage("Wi-Fi is connected");
              } else {
                Utils().toastMessage("Wi-Fi is not connected");
              }
            }).onError((error, stackTrace) {
              Utils().toastMessage(error.toString());
            });
            checkInternetConnectivityBlu().then((isBluetoothConnected) {
              if (isBluetoothConnected) {
                Utils().toastMessage("Bluetooth is connected");
              } else {
                Utils().toastMessage("Bluetooth is not connected");
              }
            }).onError((error, stackTrace) {
              Utils().toastMessage(error.toString());
            });



          }, child: Text("Connection Checker")),
          AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40)
            ),
            title: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Padding(
                  padding: const EdgeInsets.only(left:45.0),
                  child: Text("Your Device is not connected"),
                ),
                SizedBox(height: 20,),
                Image.asset("assets/images/robo.jpg",height: 150,),
                SizedBox(height: 20,),

                Text("Connect your device with"),

              ],
            ),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(

                    onTap: (){},
                    child: Container(

                        decoration: BoxDecoration(
                            color: Colors.blueAccent,
                            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30))
                        ),
                        width: 131,
                        height: 50,
                        child:Icon(Icons.bluetooth,color: Colors.white)
                    ),

                  ),



                  InkWell(
                      child: Container(

                          decoration: BoxDecoration(
                              color: Colors.blueAccent,
                              borderRadius: BorderRadius.only(bottomRight: Radius.circular(30))
                          ),
                          height: 50,
                          width: 131,
                          child:Icon(Icons.wifi,color: Colors.white,)
                      )
                  ),

                ],
              )
            ],
          )


        ],
      ),
    );
  }
}

