// ignore_for_file: unused_field, must_call_super

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_loginpage/shared/helperfunction.dart';
import 'package:geolocator/geolocator.dart';


class NearbyFriends extends StatefulWidget {
  @override
  _NearbyFriendsState createState() => _NearbyFriendsState();

}

class _NearbyFriendsState extends State<NearbyFriends> with WidgetsBindingObserver {
  Map<String, dynamic> userMap;
  bool isLoading = false;
  String error ='';
  final TextEditingController _search = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  var myfriends = [];
  get userData => null;
  String myUsername='';
  Position _currentPosition;
  String roomName ='';
  int size = 0;
  List nameTab = [];
  List distanceTab = [];
  String myLocationlat ='';
  String myLocationlon ='';
  String minName ='';
  double minDistance = 0;
  List otherDistanceTab = [];
  String kind = '';
  int i = 0;
  String friendAtRisk = '';
  String state = '';
  String color ='Green';
  List statsTab = [];
  int points = 0;
  int R=48;
  int G=183;
  int B =66;
  int time = 0;
  int day =0;
  List realRealtab = [];
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


  initState() {
    listMaking();
  }


  Future<void>listMaking() async {
    location();



    setState(() {
      isLoading = false;
    });
    myUsername = await HelperFunctions.getUserNameSharedPreference();

    await FirebaseFirestore.instance.collection('users').doc(myUsername).update({
      "Locationlat": lat,
      "Locationlon" : long,
    }).catchError((e) {
      print(e.toString());
    });
    print(myUsername);

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
    if(myfriends.length>=1){
      for(int index = 0 ; index < myfriends.length; index++){

    await FirebaseFirestore.instance
        .collection('users').where("userName", isEqualTo: myfriends[index])
        .get()
        .then((value) {
      setState(() {
        if (value != null) {
            nameTab.add(value.docs[0].data()["userName"]);
            distanceTab.add(Geolocator.distanceBetween(double.parse(value.docs[0].data()["Locationlat"]), double.parse(value.docs[0].data()["Locationlon"]),double.parse(lat),double.parse(long)));



      }});
    });}}
    for(int index = 0 ; index < size; index++){
      if(distanceTab[index]<100){

      realRealtab.add(nameTab[index]);
      }


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

        title: Text("Nearby Friends"),

      ),
      body:ListView.builder(
          itemCount:realRealtab.length,
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
                  title: Text("            "+realRealtab[index],style: TextStyle(color:Colors.black
                  ),),



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



