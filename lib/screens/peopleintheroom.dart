// ignore_for_file: camel_case_types, unused_field, must_call_super

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_loginpage/screens/Olduser.dart';
import 'package:flutter_loginpage/shared/helperfunction.dart';


class Peopleintheroom extends StatefulWidget {
  @override
  _PeopleintheroomState createState() => _PeopleintheroomState();

}

class _PeopleintheroomState extends State<Peopleintheroom> {
  Map<String, dynamic> userMap;
  bool isLoading = false;
  String error ='';
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  var myfriends = [];
  String myUsername='';
  String roomName ='';
  int i = 0;
  var peopleintherome = [];
  int size =0;






  @override


  initState() {
    listMaking();
  }


  Future<void>listMaking() async {




    myUsername = await HelperFunctions.getUserNameSharedPreference();
    roomName = await HelperFunctions.getRoomSharedPreference();
    print(roomName);
    await _firestore
        .collection(roomName).where("identifier", isEqualTo : "Player")
        .get()
        .then((value) {
      setState(() {
        if (value != null) {
          size = value.size;
          for(int index = 0 ; index < size; index++){
            peopleintherome.add(value.docs[index].data()["userName"]);

          }
        }
      });
    });
    print(peopleintherome.length);
    for(int index = 0 ; index < peopleintherome.length; index++){
      print(peopleintherome[index]);

    }




  }


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Color.fromARGB(255, 30, 30, 30),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 153, 0, 0),
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Olduser()),)),
        actions: [
          ElevatedButton(//height: 5,
            //padding: EdgeInsets.symmetric(
            //vertical: 10, horizontal: 10),


            //shape: StadiumBorder(),
            onPressed: () async {Navigator.of(context).pushNamed(
                'Loading3', arguments: '');



            },
            child: Text('Start Game', style: TextStyle(color: Colors
                .white, fontSize: 17, fontWeight: FontWeight.w700
              ,),),
            style: ElevatedButton.styleFrom(
              primary: Colors.black12,),

          ),
          IconButton(icon: Icon(Icons.wifi_tethering_outlined), onPressed: () {Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Peopleintheroom()),);})
        ],

        title: Text("Room"),

      ),
      body:ListView.builder(
          itemCount:peopleintherome.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
              child: Card(
                child: ListTile(
                  tileColor: Color.fromARGB(255, 169, 73, 73),
                  onTap: () async {



                  },
                  title: Text("               "+peopleintherome[index],style: TextStyle(color:Colors.white),),



                ),

              ),
            );
          }
      ),
    );
  }
}
