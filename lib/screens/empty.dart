import 'package:flutter/material.dart';
import 'package:flutter_loginpage/widgets/BackgroundImage1.dart';


class Empty extends StatelessWidget {
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
                  leading: IconButton(
                      icon: Icon(Icons.arrow_back, color: Colors.grey.shade600),
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