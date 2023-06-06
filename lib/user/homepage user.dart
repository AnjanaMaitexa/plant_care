import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:plant_care/admin/crop%20description/crop%20description.dart';
import 'package:plant_care/plants.dart';

import '../agriculture department/chat.dart';
import '../home public.dart';
import 'edit profile user.dart';


class ho2 extends StatefulWidget {


  @override
  State<ho2> createState() => _ho2State();
}

class _ho2State extends State<ho2> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        leading:IconButton(onPressed:(){
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>homepage (),
          ));
        },
            icon: Icon(Icons.arrow_back)),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => edit(),
                    ));},
              icon: Icon(Icons.person)),
        ],
        title: const Text("home"),
        backgroundColor: Colors.teal[900],),
      body: Column(
          children:[
           /* Container(
              height: 260,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    child: Padding(
                      padding: const EdgeInsets.only(top:8.0),
                      child: CircleAvatar(
                        radius: 40.0,
                        backgroundColor: Colors.white,
                        // child: CircleAvatar(
                        // child: Align(
                        // alignment: Alignment.bottomRight,
                        //child: CircleAvatar(
                        //backgroundColor: Colors.green[200],
                        //radius: 12.0,
                        // child: Icon(
                        // Icons.camera_alt,
                        //size: 15.0,
                        //color: Color(0xFF404040),
                        //),
                        //),
                        backgroundImage: AssetImage(
                          'images/acc.png',),
                        //),
                        //),
                      ),
                    ),),
                  Center(
                    child: Container(
                      padding: EdgeInsets.only(top: 16.0),
                      child: Text(
                        'Hello ',
                        style: TextStyle(
                          fontFamily: 'SF Pro',
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      padding: EdgeInsets.only(top: 8.0),
                      child: Text(
                        'Raniya Sherin',
                        style: TextStyle(
                          fontFamily: 'SF Pro',fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => edit()),
                          );
                        },
                        child: Container(
                          padding:
                          EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
                          decoration: BoxDecoration(
                            color: Colors.lightGreen[300],
                            borderRadius:
                            BorderRadius.all(Radius.circular(20.0)),
                          ),
                          child: Text(
                            'Edit Profile',
                            style: TextStyle(
                              fontFamily: 'SF Pro',
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              margin: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.lightGreen[100],
                borderRadius: BorderRadius.circular(16.0),
              ),
            ),*/
            Padding(
              padding: const EdgeInsets.only(left:10,top: 30),
              child: Text("Choose your way!",style: TextStyle(fontWeight:FontWeight.bold,fontSize: 25),),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30,left: 10),
              child: ElevatedButton.icon(
                onPressed: () =>
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const plants())),
                icon: const Icon(
                  Icons.upload,
                  color: Colors.white,size: 50,
                ),
                label: Text(
                  "Upload",
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(250, 45, 186, 239),
                  fixedSize: const Size(360, 140),
                  shadowColor: Colors.teal[900],
                  backgroundColor: Colors.lightGreen[200],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.only(top: 20,left:
              10),
              child: ElevatedButton.icon(
                onPressed: () =>
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const admin())),
                icon: const Icon(
                  Icons.chat,
                  color: Colors.white,size: 50,
                ),
                label: Text(
                  "Chat",
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(250, 45, 186, 239),
                  fixedSize: const Size(360, 140),
                  backgroundColor: Colors.lightGreen[200],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),

            //Padding(
            // padding: const EdgeInsets.only(top: 400),
            //child: Container(
            //decoration: BoxDecoration(
            //image: DecorationImage(
            //image: AssetImage("images/ki.jpg")
            //)
            //),
            //),
            //),
            // Padding(
            //padding: const EdgeInsets.only(left: 8.0,right: 10,top: 10),
            //child: Container(
            // height: 160,
            //width: double.infinity,
            //decoration: BoxDecoration(
            //color: Colors.green[100],
            //borderRadius: BorderRadius.only(
            //bottomRight: Radius.circular(25),
            //bottomLeft: Radius.circular(25),
            //topRight: Radius.circular(25),
            //topLeft: Radius.circular(25),
            //)),
            //),),

          ]),
    );

  }
}
