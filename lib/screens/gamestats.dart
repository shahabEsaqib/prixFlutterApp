// ignore_for_file: unused_field

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_loginpage/screens/Olduser.dart';
import 'package:flutter_loginpage/screens/spetial.dart';
import 'package:flutter_loginpage/shared/helperfunction.dart';


class Gamestats extends StatefulWidget {
  @override
  _GamestatsState createState() => _GamestatsState();

}

class _GamestatsState extends State<Gamestats> with WidgetsBindingObserver {
  Map<String, dynamic> userMap;
  bool isLoading = false;
  String error ='';
  final TextEditingController _search = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  var myfriends = [];
  String roomName='';
  var statsTab = [];
  var realstatsTab = [];
  bool testtest ;







  @override


  // ignore: must_call_super
  initState() {
    listMaking();
  }


  Future<void>listMaking() async {



    setState(() {
      isLoading = false;
    });
    testtest = await HelperFunctions.getgameSharedPreference();
    // ignore: unused_local_variable
    String myUsername = await HelperFunctions.getUserNameSharedPreference();
    roomName= await HelperFunctions.getRoomSharedPreference();
    await _firestore
        .collection(roomName)
        .get()
        .then((value) {
      setState(() {
        if (value != null) {
          userMap = value.docs[0].data();
          statsTab = userMap["statsTab"];


        }
      });
    });
    for(int i=0;i<statsTab.length;i++){

      realstatsTab[i]=statsTab[statsTab.length-1-i];

    }



  }



  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final size = MediaQuery
        .of(context)
        .size;


    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.grey.shade600,
        elevation: 0,
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.grey.shade600),
            onPressed: () {
              if(testtest=true){Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Olduser()),);}
              else{Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Spetial()),);}
              }),

        title: Text("Game Stats"),

      ),
      body:ListView.builder(
          itemCount:realstatsTab.length,
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
                  title: Text(realstatsTab[index],style: TextStyle(color:Colors.green,),textAlign: TextAlign.center,),



                ),

              ),
            );
          }
      ),
    );
  }
}
