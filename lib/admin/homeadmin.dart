import 'package:flutter/material.dart';
import 'package:plant_care/Login.dart';
import 'package:plant_care/account.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:plant_care/admin/admin%20add%20disease.dart';
import 'package:plant_care/admin/admin%20crop%20add.dart';
import 'package:plant_care/admin/admin%20crop%20desc.dart';
import 'package:plant_care/admin/viewdisease.dart';

import '../agriculture department/maindash agri.dart';
import 'crop description/crop description.dart';

class Homeadmin extends StatefulWidget {



  @override
  State<Homeadmin> createState() => _HomeadminState();
}

class _HomeadminState extends State<Homeadmin

> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal[900],
        title: Text("Crop description"),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(25),
              bottomLeft: Radius.circular(25),
            )),),

   body: Padding(
     padding: const EdgeInsets.all(20),
     child: GridView.count(
         crossAxisCount: 2,
         crossAxisSpacing: 4,
         mainAxisSpacing: 8,
         shrinkWrap: true,
         children: <Widget>[
           InkWell(
             onTap: () {
               Navigator.push(context,
                   MaterialPageRoute(builder: (context) => MainDash()));
             },
             child: Container(
               child: Card(
                 elevation: 10,
                 child: Column(
                   children: <Widget>[
                     Padding(
                       padding: const EdgeInsets.only(top: 15),
                       child: Image.asset(
                         'images/user.png',
                         height: 99,
                         width: 100,
                         fit: BoxFit.cover,
                       ),
                     ),
                     Padding(
                       padding: const EdgeInsets.only(bottom: 30),
                       child: Text(
                         'Manage User',
                         style: TextStyle(
                             fontSize: 15, fontWeight: FontWeight.bold),
                       ),
                     ),
                   ],
                 ),
               ),
             ),
           ),
           InkWell(
             onTap: () {
               Navigator.push(context,
                   MaterialPageRoute(builder: (context) => MainDash2()));
             },
             child: Container(
               child: Card(
                 elevation: 10,
                 child: Column(
                   children: [
                     Image.asset(
                       'images/agri.jpg',
                       height: 120,
                       width: 110,
                       fit: BoxFit.cover,
                     ),
                     Padding(
                       padding: const EdgeInsets.only(),
                       child: Text(
                         'Manage',style: TextStyle(
                           fontSize: 13, fontWeight: FontWeight.bold),),),
                             Text('Agriculture Department',
                         style: TextStyle(
                             fontSize: 13, fontWeight: FontWeight.bold),
                       ),
                   ],
                 ),
               ),
             ),
           ),
           InkWell(
             onTap: () {
               Navigator.push(context,
                   MaterialPageRoute(builder: (context) => cropdesc_admin()));
             },
             child: Container(
               child: Card(
                 elevation: 10,
                 child: Column(
                   children: [
                     Image.asset(
                       'images/crop.jpg',
                       height: 120,
                       width: 250,
                       fit: BoxFit.cover,
                     ),
                     SizedBox(
                       height: 2,
                     ),
                     Padding(
                       padding: const EdgeInsets.only(bottom: 20),
                       child: Text(
                         'Crop Description',
                         style: TextStyle(
                             fontSize: 15, fontWeight: FontWeight.bold),
                       ),
                     ),
                   ],
                 ),
               ),
             ),
           ),
           InkWell(
             onTap: () {
               Navigator.push(context,
                   MaterialPageRoute(builder: (context) => ViewDisease()));
             },
             child: Container(
               child: Card(
                 elevation: 10,
                 child: Column(
                   children: [
                     Image.asset(
                       'images/disease.png',
                       height: 120,
                       width: 100,
                       fit: BoxFit.cover,
                     ),
                     Padding(
                       padding: const EdgeInsets.only(bottom: 10,top: 3),
                       child: Text(
                         'Disease Description',
                         style: TextStyle(
                             fontSize: 15, fontWeight: FontWeight.bold),
                       ),
                     ),
                   ],
                 ),
               ),
             ),
           ),
         ]),
   ),
    );
  }
}
