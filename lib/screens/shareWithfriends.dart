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
            BackgroundImage1(),
            Center(
              child: Scaffold(
                backgroundColor: Colors.transparent,
                appBar: AppBar(
                  backgroundColor: Color.fromARGB(255, 153, 0, 0),


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
                              FlatButton(
                                padding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 60),
                                shape: StadiumBorder(side: BorderSide(color: Colors.red[800])),
                                onPressed: () async {
                                  Navigator.of(context).pushNamed(
                                      'friends', arguments:'');



                                },
                                child: Text('Friend in user List', style: TextStyle(color: Colors
                                    .white, fontSize: 25, fontWeight: FontWeight.w700
                                  ,),),


                              ),
                              SizedBox(
                                height: 20
                                ,
                              ),
                              Center(
                                child: FlatButton(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 90),

                                  shape: StadiumBorder(side: BorderSide(color: Colors.red[800])),
                                  onPressed: () async {Navigator.of(context).pushNamed(
                                      'HomeScreen', arguments:'');




                                  },
                                  child: Text('Send request', style: TextStyle(color: Colors
                                      .white, fontSize: 25, fontWeight: FontWeight.w700
                                    ,),),


                                ),
                              ),
                              SizedBox(
                                height: 20
                                ,
                              ),
                         FlatButton(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 90),

                          shape: StadiumBorder(side: BorderSide(color: Colors.red[800])),
                          onPressed: () async {
                          Navigator.of(context).pushNamed(
                              'friendsrequests', arguments:'');




                          },
                          child: Text('your requests', style: TextStyle(color: Colors
                              .white, fontSize: 25, fontWeight: FontWeight.w700
                            ,),),


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