import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medicine/secondpage.dart';
import 'package:medicine/thirdpage.dart';
class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: Scaffold(
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
            Navigator.push(context, MaterialPageRoute(builder: (context)=> ThirdPage()));
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
                    )
                  ],
                ),
                SizedBox(height: 60,),
                Text("Morning 08:00 am",style: TextStyle(
                    fontWeight: FontWeight.bold,fontSize: 18
                ),),
                Container(
                  padding: EdgeInsets.all(14),
                  decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(15)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        alignment:Alignment.center,
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                          color: Colors.pink.shade300,
                          borderRadius: BorderRadius.circular(11),
                        ),
                        child: Icon(CupertinoIcons.drop_fill,color: Colors.white,),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Calpol 500mg Tablet",style: TextStyle(
                              fontSize: 18,fontWeight: FontWeight.bold
                          ),),
                          SizedBox(height: 2,),
                          Text("Before Breakfast  Day 01",style: TextStyle(
                            fontSize: 14,
                          ),)
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(CupertinoIcons.bell,color: Colors.green,),
                          Text("Taken",style: TextStyle(fontSize: 13),)
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  padding: EdgeInsets.all(14),
                  decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(15)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        alignment:Alignment.center,
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                          color: Colors.blue.shade200,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Icon(CupertinoIcons.capsule_fill,color: Colors.white,),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Calpol 500mg Tablet",style: TextStyle(
                              fontSize: 18,fontWeight: FontWeight.bold
                          ),),
                          SizedBox(height: 2,),
                          Text("Before Breakfast  Day 01",style: TextStyle(
                            fontSize: 14,
                          ),)
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(CupertinoIcons.bell,color: Colors.red,),
                          Text("Missed",style: TextStyle(fontSize: 13),),
                        ],

                      ),

                    ],
                  ),
                ),
                SizedBox(height: 20,),
                Text("Aternoon 02:00 pm",style: TextStyle(
                    fontWeight: FontWeight.bold,fontSize: 18
                ),),
                Container(
                  padding: EdgeInsets.all(14),
                  decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(15)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        alignment:Alignment.center,
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                          color: Colors.purple.shade200,
                          borderRadius: BorderRadius.circular(11),
                        ),
                        child: Icon(CupertinoIcons.drop_fill,color: Colors.white,),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Calpol 500mg Tablet",style: TextStyle(
                              fontSize: 18,fontWeight: FontWeight.bold
                          ),),
                          SizedBox(height: 2,),
                          Text("After Food             Day 01",style: TextStyle(
                            fontSize: 14,
                          ),)
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(CupertinoIcons.bell,color: Colors.orange,),
                          Text("Taken",style: TextStyle(fontSize: 13),)
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(height: 60,),
                Text("Night 09:00 pm",style: TextStyle(
                    fontWeight: FontWeight.bold,fontSize: 18
                ),),
                Container(
                  padding: EdgeInsets.all(14),
                  decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(15)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        alignment:Alignment.center,
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                          color: Colors.deepOrangeAccent.shade400,
                          borderRadius: BorderRadius.circular(11),
                        ),
                        child: Icon(CupertinoIcons.bandage,color: Colors.white,),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Calpol 500mg Tablet",style: TextStyle(
                              fontSize: 18,fontWeight: FontWeight.bold
                          ),),
                          SizedBox(height: 2,),
                          Text("Before Sleep             Day 03",style: TextStyle(
                            fontSize: 14,
                          ),)
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(CupertinoIcons.bell,color: Colors.grey,),
                          Text("Left",style: TextStyle(fontSize: 13),)
                        ],
                      )
                    ],
                  ),
                ),



              ],

            ),

          ),

        ),

      ),

    );
  }
}

