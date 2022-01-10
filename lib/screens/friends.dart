// ignore_for_file: unused_field, unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_loginpage/shared/helperfunction.dart';


class Friends extends StatefulWidget {
  @override
  _FriendsState createState() => _FriendsState();

}

class _FriendsState extends State<Friends> with WidgetsBindingObserver {
  Map<String, dynamic> userMap;
  bool isLoading = false;
  String error ='';
  final TextEditingController _search = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  var myfriends = [];






  @override


  // ignore: must_call_super
  initState() {
    listMaking();
  }


  Future<void>listMaking() async {



    setState(() {
      isLoading = false;
    });
    String myUsername = await HelperFunctions.getUserNameSharedPreference();

    await _firestore
        .collection('users')
        .where("userName", isEqualTo: myUsername)
        .get()
        .then((value) {
      setState(() {
        if (value != null) {
          userMap = value.docs[0].data();
          myfriends = userMap["friends"];


        }
      });
    });



  }


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery
        .of(context)
        .size;


    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.grey.shade600,
        elevation: 0,


        title: Text("Friends List"),

      ),
      body:ListView.builder(
          itemCount:myfriends.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                child: ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  tileColor: Colors.green,
                  onTap: () async {

                  },
                  title: Text("            "+myfriends[index],style: TextStyle(color:Colors.black),),



                ),

              ),
            );
          }
      ),
    );
  }
}



