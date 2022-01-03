import 'package:flutter/material.dart';
import 'package:flutter_loginpage/widgets/BackgroundImage1.dart';


class Empty extends StatelessWidget {
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
                  leading: IconButton(
                      icon: Icon(Icons.arrow_back, color: Colors.black),
                      onPressed: (){
                          Navigator.of(context).pushNamed(
                              'Newuser', arguments: '');}),


                  title: Text("join Game"),

                ),
                body: Form(

                  child: SingleChildScrollView(
                    child: SafeArea(
                      child: Column(
                          children: [

                          ]
                      ),
                    ),
                  ),
                ),
              ),
            ),]
      ),
    );
  }}