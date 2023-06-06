import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:plant_care/accounts.dart';
import 'package:plant_care/admin/homeadmin.dart';
import 'package:plant_care/agriculture%20department/homeagri.dart';
import 'package:plant_care/firebase/authentication.dart';
import 'package:plant_care/user/forgot.dart';
import 'package:plant_care/user/homepage%20user.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        /* padding: EdgeInsets.all(8.0),*/
        children: <Widget>[
          /*SizedBox(height: 80),*/
          // logo
          Padding(
            padding: const EdgeInsets.only(bottom: 350),
            child: Column(
              children: [
                /* FlutterLogo(
                  size: 55,
                ),*/
                Padding(
                  padding: const EdgeInsets.only(bottom: 36),
                  child: Container(
                      height: 330,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("images/my.jpg"),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.vertical(
                            bottom: Radius.elliptical(
                                MediaQuery.of(context).size.width, 150)),
                      )),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.only(bottomRight: Radius.circular(30))),
                ),
                Column(
                  children: [
                    /* SizedBox(height: 50),*/
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Text(
                        'Welcome back!',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(
                      'LogIn to your Account',
                      style: TextStyle(fontSize: 12),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: LoginForm(),
                ),
                SizedBox(height: 10),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Forgotpwd()));
                        },
                        child: Text(
                          "Forgot your Password?",
                          style: TextStyle(fontSize: 16, color: Colors.purple),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    SizedBox(width: 30),
                    Text('New here ? ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20)),
                    GestureDetector(
                      onTap: () {
                        // Navigator.pushNamed(context, '/signup');
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => account()));
                      },
                      child: Text('Get Registered Now!!',
                          style: TextStyle(fontSize: 20, color: Colors.green)),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  String? email;
  String? password;

  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          // email
          TextFormField(
            controller: emailController,
            // initialValue: 'Input text',
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.email_outlined),
              labelText: 'Email',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  const Radius.circular(100.0),
                ),
              ),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            onSaved: (val) {
              email = val;
            },
          ),
          SizedBox(
            height: 20,
          ),

          // password
          TextFormField(
            controller: passwordController,
            // initialValue: 'Input text',
            decoration: InputDecoration(
              labelText: 'Password',
              prefixIcon: Icon(Icons.lock_outline),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  const Radius.circular(100.0),
                ),
              ),
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
                child: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                ),
              ),
            ),
            obscureText: _obscureText,
            onSaved: (val) {
              password = val;
            },
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),

          SizedBox(height: 30),

          SizedBox(
            height: 54,
            width: 184,
            child: ElevatedButton(
              onPressed: () async {
                await AuthenticationHelper().signIn(
                    email: emailController.text,
                    password: passwordController.text);
                /* AuthenticationHelper()
                    .signIn(email: emailController.text, password: passwordController.text)
                    .then((result) {
                  if (result == null) {
                    */ /*if (_passwordcontroller.text.trim() ==
                                                name) {
                                              Navigator.of(context)
                                                  .push(MaterialPageRoute(
                                                builder: (context) => Homeuser(),
                                              ));
                                              _passwordcontroller.clear();
                                             // _usernamecontroller.clear();
                                            }
                                            //  if(password.text="admin")
                                            else if (_passwordcontroller.text
                                                .trim() ==
                                                name1) {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        home_admin(),
                                                  ));
                                              _passwordcontroller.clear();
                                             // _usernamecontroller.clear();
                                            } else if (_passwordcontroller.text
                                                .trim() ==
                                                name2) {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        home_doctor(),
                                                  ));
                                              _passwordcontroller.clear();
                                             // _usernamecontroller.clear();
                                            }*/ /*route();
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                        result,
                        style: TextStyle(fontSize: 16),
                      ),
                    ));
                  }
                });*/
              },
              style: ElevatedButton.styleFrom(
                  primary: Colors.teal[900],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(24.0)))),
              child: Text(
                'Login',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void route() {
    User? user = FirebaseAuth.instance.currentUser;
    var kk = FirebaseFirestore.instance
        .collection('login')
        .doc(user!.uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        if (documentSnapshot.get('role') == "user") {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => ho2(),
            ),
          );
        } else if (documentSnapshot.get('role') == "agriculture") {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => Homeagri(),
            ),
          );
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => Homeadmin(),
            ),
          );
        }
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Homeadmin(),
          ),
        );
      }
    });
  }
}
