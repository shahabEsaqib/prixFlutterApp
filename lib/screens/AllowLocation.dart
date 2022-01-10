// ignore_for_file: must_call_super

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_loginpage/models/locationmodel.dart';
// ignore: duplicate_import
import 'package:flutter_loginpage/models/locationmodel.dart';
import 'package:flutter_loginpage/shared/helperfunction.dart';
import 'package:provider/provider.dart';
import '../widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:geolocator/geolocator.dart';

class AllowLocation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AllowLocationState();
  }
}
class AllowLocationState extends State<AllowLocation> {

  Position _currentPosition;
  String username ='';
  String lat = '0';
  String long = '0';
  String test = "1";
  Position position;


  void initState(){

    location();

  }

  Future<void> location() async {
    position =await _getCurrentLocation();
    lat = position.latitude.toString();
  long =position.longitude.toString();

  }






  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    var userLocation = Provider.of<UserLocation>(context);
    return Stack(
      children: [
        // BackgroundImage1(),

        Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: SafeArea( child :
            Column(
              children: [
                SizedBox(
                  height: 60,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 0,vertical: 30),
                  child: Center(
                      child: Image.asset(
                        'assets/images/Loacation.png',
                        width: 500,
                        height: 250,
                      )


                  ),
                ),
                SizedBox(
                  height: 10,
                ),
    Container(padding: const EdgeInsets.symmetric(horizontal: 30),

    child: Text('App needs your location  to find your nearby friends.',
    style: TextStyle(
    color: Colors.grey,fontWeight:FontWeight.w500, fontSize: 20),),

    ),
                SizedBox(
                  height: 30,
                ),



                // ignore: deprecated_member_use
                FlatButton(
                  padding: EdgeInsets.symmetric(
                      vertical: 5, horizontal: 120),
                  shape: StadiumBorder(),
                  onPressed: () async {
                    print(test);
                    username = await HelperFunctions.getUserNameSharedPreference();
                    print(long);
                    print(lat);

                    print(username +'     ffffffffffffffffff');
                    await FirebaseFirestore.instance.collection("users")
                        .doc(username).update({
                      "Locationlat": lat,
                      "Locationlon" : long,
                    }).catchError((e){
                      print(e.toString());
                    });
                    Navigator.of(context).pushNamed(
                        'Newuser', arguments: '');

                   // _getCurrentLocation();
                   //print(userLocation.latitude);
                      //print(userLocation.longitude );




                  },
                  child: Text('Allow', style: TextStyle(color: Colors
                      .white, fontSize: 25, fontWeight: FontWeight.w700
                    ,),),
                  color: Colors.green,

                ),
                Container(
                  child : TextButton(
                      child: Text('I will do later..',
                        style: TextStyle(
                            color: Colors.red, fontSize: 20),),
                      onPressed: () {
                        Navigator.of(context).pushNamed(
                            'Newuser', arguments: '');
                      }
                  ),
                ),
              ],
            ),
            ),),),
      ],
    );
  }
  _getCurrentLocation()  async {

     await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best, forceAndroidLocationManager: true)
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

