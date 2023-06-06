import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:path/path.dart';
import 'package:plant_care/agriculture%20department/homeagri.dart';
import 'package:plant_care/login.dart';
import 'package:plant_care/user/homepage%20user.dart';

class AuthenticationHelper {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final FirebaseFirestore _db = FirebaseFirestore.instance;
  get user => _auth.currentUser;

//SIGN UP METHOD
  Future<String?> signUp({required String email, required String password,required String name,required String phone,}) async {
    try {
      UserCredential result= await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user=result.user;
      await _db.collection('user_Tb').doc(user!.uid).set({
        'fullname': name,
        'phone': phone,

      });
      print("user data${user}");
      await _db.collection('login').doc(user!.uid).set({
        'email': email,
        'password': password,
        'role':"user",
      });
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }
  Future<String?> Signupagri({required String email, required String password,required String name,required String location,required String phone}) async {
    try {
      UserCredential result= await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user=result.user;
      await _db.collection('agriculture').doc(user!.uid).set({
        'name': name,
        'phone': phone,
        'location':location,

      });
      print("user data${user}");
      await _db.collection('login').doc(user!.uid).set({
        'email': email,
        'password': password,
        'role':"agriculture",
      });
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }
  Future<String?> Signupadmin({required String email, required String password,}) async {
    try {
      _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      print("user data${user}");
      await _db.collection('login').doc(user!.uid).set({
        'email': email,
        'password': password,
        'role':"admin",
      });
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  //SIGN IN METHODJ
  Future<String?> signIn({required String email, required String password}) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Retrieve user data from Firestore
      DocumentSnapshot userSnapshot = await FirebaseFirestore.instance
          .collection('user_Tb').doc(userCredential.user!.uid).get();
      DocumentSnapshot userSnapshot2 = await FirebaseFirestore.instance
          .collection('login').doc(userCredential.user!.uid).get();

      // Check role and status
      String role = userSnapshot2['role'].trim();
      String status = userSnapshot['status'].trim();
      print("role${role}");
      print("status${status}");

      print('type ${role.runtimeType}');
      print('typestatus ${status.runtimeType}');

      if (role == 'user' && status == 'accepted') {
        Navigator.push(context as BuildContext,
            MaterialPageRoute(builder: (context) => ho2()));
      } else if (role == 'agriculture' && status == 'accepted') {
        Navigator.push(context as BuildContext,
            MaterialPageRoute(builder: (context) => Homeagri()));
      }
      else {
        if (role == 'user' && status == 'rejected') {
          final snackBar = SnackBar(
            content: Text('You are Rejected'),
            duration: Duration(seconds: 2),
          );
          ScaffoldMessenger.of(context as BuildContext).showSnackBar(snackBar);
        }
        Navigator.push(context as BuildContext,
            MaterialPageRoute(builder: (context) => Login()));
      }
    }catch (e) {
      // Handle login errors
      // ...
    }

  /*  try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
     *//* User? user=result.user;
      await _db.collection('login').doc(user!.uid).set({
        'email': email,
        'password': password,
       // 'role':qualification,
      });
      print("user data${user}");*//*
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }*/
  }

//read
   read() async {
    DocumentSnapshot documentSnapshot;
    try {
      documentSnapshot = await   _db.collection('user_Tb').doc(user!.uid).get();
      print(documentSnapshot.data());
    } catch (e) {
      print(e);
    }
  }


  //SIGN OUT METHOD
  Future<void> signOut() async {
    await _auth.signOut();

    print('signout');
  }
}