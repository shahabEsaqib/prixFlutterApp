// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_loginpage/widgets/BackgroundImage1.dart';


class ShareWithfriends extends StatelessWidget {
  @override
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
          children: [
            // BackgroundImage1(),
            Center(
              child: Scaffold(
                backgroundColor: Colors.white,
                appBar: AppBar(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.grey.shade600,
                  elevation: 0,


                  title: Text("Share with friends"),

                ),
                body: SingleChildScrollView(
                  child: Form(

                    child:  SafeArea(
                        child: Column(
                            children: [
                              SizedBox(
                                height: 185
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
                                        onPressed: () async {
                                  Navigator.of(context).pushNamed(
                                      'friends', arguments:'');
                                },
                                          child: Text(
                                          'Friend in user List',
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
                                      'HomeScreen', arguments:'');
                                  },
                                          child: Text(
                                          'send request',
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
                              'friendsrequests', arguments:'');
                          },
                                          child: Text(
                                          'your requests',
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