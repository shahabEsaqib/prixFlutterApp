// ignore_for_file: must_be_immutable, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_loginpage/shared/helperfunction.dart';
import 'package:flutter_loginpage/widgets/BackgroundImage1.dart';


class NewGame2 extends StatelessWidget {
  bool buttoncheck;
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
          children: [
            BackgroundImage1(),
            Center(
              child: Scaffold(
                backgroundColor: Colors.white,
                          appBar: AppBar(title: Text("New Game"),centerTitle: true,backgroundColor: Colors.white,foregroundColor: Colors.grey.shade600,elevation: 0,),

                body: Form(

                  child:
                  SafeArea(
                    child: Column(
                        children: [
                          SizedBox(
                            height: 215
                            ,
                          ),
                          Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 90,
                                      padding: const EdgeInsets.symmetric(horizontal: 30,
                                          vertical: 15),
                                      child: FlatButton(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 5, horizontal: 50),
                                        shape: StadiumBorder(),
                                        onPressed: () async {Navigator.of(context).pushNamed(
                                  'Joinroom', arguments:'');



                              },
                                        child: Text(
                                          'Join Game With Friends',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        color: Colors.green,
                                      ),
                                    ),
                  
                          SizedBox(
                            height: 10
                            ,
                          ),
                          
                          Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 90,
                                      padding: const EdgeInsets.symmetric(horizontal: 30,
                                          vertical: 15),
                                      child: FlatButton(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 5, horizontal: 50),
                                        shape: StadiumBorder(),
                                        onPressed: () async {Navigator.of(context).pushNamed(
                                  'JoinLocalGame', arguments:'');



                              },
                                        child: Text(
                                          'Join Local Game',
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
          ]
      ),
    );
  }}