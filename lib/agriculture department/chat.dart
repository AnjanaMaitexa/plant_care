import 'package:flutter/material.dart';
class admin extends StatefulWidget {
  const admin({Key? key}) : super(key: key);

  @override
  State<admin> createState() => _adminState();
}

class _adminState extends State<admin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Chat "),
        backgroundColor: Colors.teal[900],
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(25),
              bottomLeft: Radius.circular(25),
            )),

      ),
      body: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: [ Padding(
            padding: const EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.topRight,

              child:Container(

                width: 100,
                height:60,
                child: TextField(
                  decoration: InputDecoration(enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)
                  ),
                    hintText: "hi",
                  ),
                ),
              ),
            ),
          ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.topLeft,

                child:Container(

                  width: 100,
                  height:60,
                  child: TextField(
                    decoration: InputDecoration(enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)
                    ),
                      hintText: "hello ! how can i help you",
                    ),
                  ),
                ),
              ),
            ),


            Container(
              child: Padding(
                padding: const EdgeInsets.only(top: 320),
                child: new Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      border:OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                      suffixIcon: Icon(Icons.send,color: Colors.teal[900],),
                      hintText: "Type here",
                    ),
                  ),
                ),
              ),


            ),
          ]),
    );
  }
}
