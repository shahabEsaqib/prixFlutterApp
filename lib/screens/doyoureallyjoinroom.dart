// ignore_for_file: camel_case_types, unused_field, must_call_super

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_loginpage/screens/joinroom.dart';
import 'package:flutter_loginpage/shared/helperfunction.dart';
import 'package:geolocator/geolocator.dart';

import 'empty.dart';


class doyoureallyjoinroom extends StatefulWidget {
  @override
  _doyoureallyjoinroomState createState() => _doyoureallyjoinroomState();

}

class _doyoureallyjoinroomState extends State<doyoureallyjoinroom> with WidgetsBindingObserver {
  Map<String, dynamic> userMap;
  bool isLoading = false;
  String error = '';
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  var myfriends = [];
  String myUsername = '';
  String roomName = '';
  int i = 0;
  var peopleintherome = [];
  int size = 0;
  var listofRooms = [];
  Position _currentPosition;
  String kind = 'Tagger';
  String testkind = '';
  bool test = false;


  @override
  initState() {
    listMaking();
  }


  Future<void> listMaking() async {
    myUsername = await HelperFunctions.getUserNameSharedPreference();
    await _firestore
        .collection('users')
        .where(
        "userName", isEqualTo: myUsername)
        .get()
        .then((value) {
      if (value != null) {
        userMap = value.docs[0].data();
        roomName = userMap["game_requests"];
        listofRooms.add(roomName);
        if (roomName.length != 0) {
          test = true;
        }
      }
    });
    //}
    // );
  }


  @override
  Widget build(BuildContext context) {
    if (test == false) {
      return Empty();
    } else {
      return Joinroom();
      
    }
  }


}