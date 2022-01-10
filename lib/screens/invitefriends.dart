// ignore_for_file: unused_field, must_call_super, deprecated_member_use

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_loginpage/shared/helperfunction.dart';


class Invitefriends extends StatefulWidget {
  @override
  _InvitefriendsState createState() => _InvitefriendsState();

}

class _InvitefriendsState extends State<Invitefriends> with WidgetsBindingObserver {
  Map<String, dynamic> userMap;
  bool isLoading = false;
  String error ='';
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  var myfriends = [];
  String myUsername='';






  @override


  initState() {
    listMaking();
  }


  Future<void>listMaking() async {



    setState(() {
      isLoading = false;
    });
    myUsername = await HelperFunctions.getUserNameSharedPreference();

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
        actions: [
          ElevatedButton(//height: 5,
            //padding: EdgeInsets.symmetric(
            //vertical: 10, horizontal: 10),


            //shape: StadiumBorder(),
            onPressed: () async {Navigator.of(context).pushNamed(
                'peopleintheroom', arguments: '');



            },
            child: Text('Room', style: TextStyle(color: Colors
                .white, fontSize: 17, fontWeight: FontWeight.w700
              ,),),
            style: ElevatedButton.styleFrom(
              primary: Colors.black12,),

          ),

        ],

        title: Text("invite friends"),

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
                    await FirebaseFirestore.instance.collection("users")
                        .doc(myfriends[index]).update({
                      "game_requests": (myUsername+"_room").toString(),
                    }).catchError((e) {
                      print(e.toString());
                    });
                    showDialog(context: context, builder: (context){

                      return AlertDialog(title:Text('Phone Alert'),content: Text('You invited '+myfriends[index] ),actions: [FlatButton(onPressed: (){Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Invitefriends()),);}, child: Text('Continue'))],);
                    });



                  },
                  title: Text(myfriends[index]+"                                          invite    ",style: TextStyle(color:Colors.black),textAlign: TextAlign.center,),



                ),

              ),
            );
          }
      ),
    );
  }
}
