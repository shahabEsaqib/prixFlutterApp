// ignore_for_file: unused_field, deprecated_member_use

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_loginpage/shared/helperfunction.dart';
import 'package:geolocator/geolocator.dart';


class Joinroom extends StatefulWidget {
  @override
  _JoinroomState createState() => _JoinroomState();

}

class _JoinroomState extends State<Joinroom> with WidgetsBindingObserver {
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
  var listofRooms = [];
  Position _currentPosition;
  String kind ='Tagger';
  String testkind ='';
  String lat = '0';
  String long = '0';
  String test = "1";
  Position position;




  Future<void> location() async {
    position =await _getCurrentLocation();
    lat = position.latitude.toString();
    long =position.longitude.toString();

  }









  @override


  // ignore: must_call_super
  void initState() {

    listMaking();
  }


  Future<void>listMaking() async {
    print("aaaaaaaaaaaaaaaaa");
    location();
    myUsername = await HelperFunctions.getUserNameSharedPreference();
    await _firestore
        .collection('users')
        .where(
        "userName", isEqualTo: myUsername)
        .get()
        .then((value) async {

      if (value != null) {
        print(")))))))))))))))))))");
        userMap = value.docs[0].data();
        roomName= userMap["game_requests"];
        listofRooms.add(roomName);

        print("bbbbbbbbbbbbbb");

      }

    },);
    print(listofRooms[0]);
    if(listofRooms[0]==null){listofRooms[0]='0';}
    print("cccccccccc");

    print(listofRooms);






    if(listofRooms[0]=='0'){
      print('a');
      Navigator.of(context).pushNamed(
          'empty', arguments: '');

    }



  }


  @override
  Widget build(BuildContext context) {



    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.grey.shade600,
        actions: [


        ],

        title: Text("join room",style: TextStyle(color: Colors.grey.shade600),),

      ),
      body:ListView.builder(
          itemCount:listofRooms.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                child: ListTile(
                  tileColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  onTap: () async {
                    await FirebaseFirestore.instance
                        .collection(listofRooms[index]).where("identifier", isEqualTo : "Player")
                        .get()
                        .then((value) {
                      setState(() {
                        if (value != null) {
                          size = value.size;
                        }
                      });
                    });
                    if(size<10){

                    print('°°°°°°°°°°°°');
                    await _firestore
                        .collection(roomName)
                        .get()
                        .then((value) {
                      setState(() {
                        if (value != null) {
                          size = value.size;

                          testkind = value.docs[size-1].data()["kind"];


                        }
                      });
                    });
                    print('aaaaaaaaaaaaaaaaaaa');
                    if(kind==testkind){kind='Runner';}
                    print(kind);
                    await FirebaseFirestore.instance.collection(roomName).doc(myUsername).set({
                      "userName": userMap["userName"],
                      "Locationlat": lat,
                      "Locationlon" : long,
                      "identifier" : "Player",
                      "kind" : kind,
                      "risk" :'',
                      "Result" :'',


                    }).catchError((e) {
                      print(e.toString());
                    });
                    listofRooms.removeAt(0);
                    await FirebaseFirestore.instance.collection("users")
                        .doc(myUsername).update({
                      "game_requests": listofRooms,
                    }).catchError((e) {
                      print(e.toString());
                    });
                    await HelperFunctions.savegameSharedPreference(true);
                    await HelperFunctions.saveRoomSharedPreference(roomName);
                    await FirebaseFirestore.instance.collection('users').doc(myUsername.toString()).update({
                      "Roomname": roomName,
                    }).catchError((e) {
                      print(e.toString());
                    });
                    Navigator.of(context).pushNamed(
                        'peopleintheroom', arguments: '');}
                    else{

                      showDialog(context: context, builder: (context){

                        return AlertDialog(title:Text('Phone Alert'),content: Text("The room is full" ),actions: [FlatButton(onPressed: ()  {


                        }, child: Text('Continue'))],);
                      });







                    }



                  },
                  title: Text(listofRooms[index]+"join game",style: TextStyle(color:Colors.white),textAlign: TextAlign.center,),



                ),

              ),
            );
          }
      ),
    );

  }
  _getCurrentLocation() async {
    await Geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best, forceAndroidLocationManager: true)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
      });
    }).catchError((e) {
      print(e);
    });
    return _currentPosition;
  }

}


