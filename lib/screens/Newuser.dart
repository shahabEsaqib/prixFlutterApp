// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_loginpage/screens/spetial2.dart';
import 'package:flutter_loginpage/widgets/BackgroundImage1.dart';


class Newuser extends StatelessWidget {  @override
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
          children: [
          // BackgroundImage1(),
      Center(
        child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Form(

          child:  SafeArea(
          child: Column(
          children: [
            Container(margin: const EdgeInsets.only(left: 15.0, right: 15.0,top :15),alignment: Alignment.centerRight,
                child :IconButton(icon: Icon(Icons.album,color: Colors.green,), onPressed: () {Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Spetial2()),);})),
          SizedBox(
          height: 125
          ,
          ),
            Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 90,
                                      padding: const EdgeInsets.symmetric(horizontal: 50,
                                          vertical: 15),
                                      child: FlatButton(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 5, horizontal: 60),
                                        shape: StadiumBorder(),
                                        onPressed: () async {Navigator.of(context).pushNamed(
                                  'NewGame', arguments:'');



                              },
                                        child: Text(
                                          'New Game',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        color: Colors.green,
                                      ),
                                    ), 
           

            Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 90,
                                      padding: const EdgeInsets.symmetric(horizontal: 50,
                                          vertical: 15),
                                      child: FlatButton(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 5, horizontal: 60),
                                        shape: StadiumBorder(),
                                        onPressed: () async {Navigator.of(context).pushNamed(
                                  'Settings', arguments:'');



                              },
                                        child: Text(
                                          'Settings',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        color: Colors.green,
                                      ),
                                    ), 

           
            Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 90,
                                      padding: const EdgeInsets.symmetric(horizontal: 50,
                                          vertical: 15),
                                      child: FlatButton(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 5, horizontal: 60),
                                        shape: StadiumBorder(),
                                        onPressed: () async {Navigator.of(context).pushNamed(
                                  'NearbyFriends', arguments:'');



                              },
                                        child: Text(
                                          'Nearby Friends',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        color: Colors.green,
                                      ),
                                    ), 
            
            Container(
                width: MediaQuery.of(context).size.width,
                height: 90,
                padding: const EdgeInsets.symmetric(horizontal: 50,
                    vertical: 15),
                child: FlatButton(
                  padding: EdgeInsets.symmetric(
                      vertical: 5, horizontal: 60),
                  shape: StadiumBorder(),
                  onPressed: ()
                    async {exit(0);
                  },
                    child: Text(
                    'Quite Game',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  color: Colors.green,
                ),
              ), 
            
       
            Container(
                width: MediaQuery.of(context).size.width,
                height: 90,
                padding: const EdgeInsets.symmetric(horizontal: 50,
                    vertical: 15),
                child: FlatButton(
                  padding: EdgeInsets.symmetric(
                      vertical: 5, horizontal: 60),
                  shape: StadiumBorder(),
                  onPressed: () async {
                Navigator.of(context).pushNamed(
                    'shareWithfriends', arguments: '');
              },
                    child: Text(
                    'Share with Friends',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  color: Colors.green,
                ),
              ), 




]
  ),
          ),
          ),
        ),
        ),
        ),
      ]
      ),
    );
}}