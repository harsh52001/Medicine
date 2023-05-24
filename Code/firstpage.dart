import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medicine/secondpage.dart';
class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
          elevation: 3,
          height: 62,
          destinations: [
            NavigationDestination(icon: Icon(Icons.home), label: "Home"),
            NavigationDestination(icon: Icon(Icons.add_chart), label: "Report"),
          ]),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton:FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> SecondPage()));
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.black,

      ),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 15,horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Hi Harry!",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                      Text("5 Medicines left",style: TextStyle(fontSize: 15,),),
                    ],
                  ),
                  Row(
                    children: [
                      Image.asset("assets/images/firstAid.png",height: 30,width: 30,),
                      SizedBox(width: 20,),
                      CircleAvatar(
                        backgroundImage: NetworkImage("https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8dXNlcnxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80"),
                        radius: 25,
                      )
                    ],
                  ),
                ],

              ),
              SizedBox(height: 120,),
              Center(

                child: Container(

                    child: Image.asset("assets/images/emptybox.jpg")),
              ),
              SizedBox(height: 15,),
              Center(child: Text('Nothing is Here,Add a Medicine',style: TextStyle(fontStyle: FontStyle.italic,fontSize: 15),)),




            ],

          ),

        ),

      ),

    );
  }
}
