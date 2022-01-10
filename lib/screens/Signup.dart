// ignore_for_file: missing_return, unrelated_type_equality_checks, deprecated_member_use, await_only_futures

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_loginpage/services/auth_services.dart';
import 'package:flutter_loginpage/services/database1.dart';
import 'package:flutter_loginpage/services/terms_of_use.dart';
import 'package:flutter_loginpage/shared/helperfunction.dart';
import 'package:flutter_loginpage/widgets/Formsignup.dart';
import 'package:flutter_loginpage/widgets/check.dart';
import '../widgets/widgets.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  final String data;

  Signup({ Key key,
    @required this.data,

  }):super(key:key);
  _MySignupPageState createState() => _MySignupPageState();
}
class _MySignupPageState  extends State<Signup> {

  final AuthService _auth = AuthService();
  final GlobalKey<FormState> _formKeyValue = new GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String error = '' ;
  final res = Check();
  var requestsoffriends =[];
  var friendslist = [];

  // ignore: unused_field
  String _sucribestatus = 'Yes';
  Formsignup formsignup = new Formsignup();
  DatabaseMethods databaseMethods = new DatabaseMethods();
  Future<bool> checks() async {
    await FirebaseFirestore.instance
        .collection('users')
        .where("userName", isEqualTo: formsignup.name)
        .get()
        .then((value) {
      setState(() {
        if (value != null) {

          return true;

          }
        else {
          return false;

        }



      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundImage(),
          Scaffold(
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              child: Form(
                key : _formKeyValue,
                child:  SafeArea(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20
                        ,
                      ),
                      Container(
                        height: 100,
                        child: Center(
                          child: Image.asset(
                            'assets/images/logoNew.png',
                            width: 100,
                            height: 100,
                          ),

                        ),
                      ),

                      Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Container(
                              width: 340,
                              child: Center(
                                child: Text(
                                  'Sign up',
                                  style: TextStyle(
                                      fontSize: 30,
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                      SizedBox(
                        height: 20,
                      ),
                      
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Column(
                          children: [
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Container(

                                  child: Column(
                                    children: [ 
                                    TextFormField(

                                   decoration: InputDecoration(
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(32),
                                                borderSide: BorderSide(
                                                    color: Colors.green,
                                                    width: 1),
                                              ),
                                              focusedBorder:OutlineInputBorder(
            borderSide:  BorderSide(color: Colors.black, width: 2.0),
            borderRadius: BorderRadius.circular(40),
          ),
                                              labelStyle: TextStyle(
                                                  color: Colors.green),
                                              hintStyle: TextStyle(
                                                  color: Colors.green,
                                                  fontSize: 15),
                                              // icon: Icon(Icons.mail),
                                              prefixIcon: Icon(Icons.person,
                                                  color: Colors.green
                                                      ),
                                              suffixIcon: nameController
                                                      .text.isEmpty
                                                  ? Text('')
                                                  : GestureDetector(
                                                      onTap: () {
                                                        nameController.clear();
                                                      },
                                                      child: Icon(Icons.close,color: Colors.green,)),
                                              hintText: 'shahab',
                                              labelText: 'Full Name',
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(32),
                                                borderSide: BorderSide(
                                                    color: Colors.green,
                                                    width: 1),
                                              )),

                  validator: (value) {
                    if (value.trim().isEmpty) {
                      return 'name is required';
                    }
                    if (value.trim().length < 4) {
                      return 'Username must be at least 4 characters in length';
                    }
                    if(checks() == true){
                      return 'Username already exists';

                    }

                    // Return null if the entered username is valid
                    return null;
                  },
                  onChanged: (value) => formsignup.name = value,

                                    onSaved: (value) => formsignup.name = value,



                                    style: TextStyle(color: Colors.black),
                                    textInputAction: TextInputAction.next,


                                  ),
                                   
                                  ]
                                  ),),

                                  SizedBox(
                                    height: 20,
                                  ),
                                ]
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Column(
                          children: [
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Container(

                                    child: Column(children: [ new TextFormField(

                                      decoration: InputDecoration(
                                               focusedBorder:OutlineInputBorder(
            borderSide:  BorderSide(color: Colors.black, width: 2.0),
            borderRadius: BorderRadius.circular(40),
          ),
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(32),
                                                borderSide: BorderSide(
                                                    color: Colors.green,
                                                    width: 1),
                                              ),
                                              labelStyle: TextStyle(
                                                  color: Colors.green),
                                              hintStyle: TextStyle(
                                                  color: Colors.green,
                                                  fontSize: 15),
                                              // icon: Icon(Icons.mail),
                                              prefixIcon: Icon(Icons.mail,
                                                  color: Colors.green
                                                      ),
                                              suffixIcon: nameController
                                                      .text.isEmpty
                                                  ? Text('')
                                                  : GestureDetector(
                                                      onTap: () {
                                                        nameController.clear();
                                                      },
                                                      child: Icon(Icons.close,color: Colors.green,)),
                                              hintText: 'example@mail.com',
                                              labelText: 'Email',
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(32),
                                                borderSide: BorderSide(
                                                    color: Colors.green,
                                                    width: 1),
                                              )),

                                      validator: (value) {
                                        if (value.trim().isEmpty) {
                                          return 'Please enter your email address';
                                        }
                                        // Check if the entered email has the right format
                                        if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                                          return 'Please enter a valid email address';
                                        }
                                        // Return null if the entered email is valid
                                        return null;
                                      },
                                      onChanged: (value) => formsignup.email = value,
                                      onSaved: (value) => formsignup.email = value,


                                      style: TextStyle(color: Colors.black),
                                      keyboardType: TextInputType.emailAddress,
                                      textInputAction: TextInputAction.next,


                                    ),
                                      
                                    ]
                                    ),
                                  ),

                                  SizedBox(
                                    height: 20,
                                  ),
                                ]
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Container(

                          child: Column(children: [ new TextFormField(

                            decoration: InputDecoration(
                               focusedBorder:OutlineInputBorder(
            borderSide:  BorderSide(color: Colors.black, width: 2.0),
            borderRadius: BorderRadius.circular(40),
          ),
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(32),
                                                borderSide: BorderSide(
                                                    color: Colors.green,
                                                    width: 1),
                                              ),
                                              labelStyle: TextStyle(
                                                  color: Colors.green),
                                              hintStyle: TextStyle(
                                                  color: Colors.green,
                                                  fontSize: 15),
                                              // icon: Icon(Icons.mail),
                                              prefixIcon: Icon(Icons.lock,
                                                  color: Colors.green
                                                      ),
                                              suffixIcon: nameController
                                                      .text.isEmpty
                                                  ? Text('')
                                                  : GestureDetector(
                                                      onTap: () {
                                                        nameController.clear();
                                                      },
                                                      child: Icon(Icons.close,color: Colors.green,)),
                                              hintText: '*******',
                                              labelText: 'Password',
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(32),
                                                borderSide: BorderSide(
                                                    color: Colors.green,
                                                    width: 1),
                                              )),
                            obscureText: true,
                            validator: (value) {
                              if (value.trim().isEmpty) {
                                return 'password is required';
                              }
                              if (value.trim().length < 8) {
                                return 'Password must be at least 8 characters in length';
                              }
                              // Return null if the entered password is valid
                              return null;
                            },
                            onChanged: (value) => formsignup.password = value,
                            onSaved: (value) => formsignup.password = value,


                            style: TextStyle(color: Colors.black),
                            textInputAction: TextInputAction.done,


                          ),
                            
                            SizedBox(
                              height: 15,
                            ),

                            Container( height: 15,child :Text(
    error,
    style: TextStyle(color: Colors.red, fontSize: 14.0),),),
                          ]
                          ),
                        ),

                      ),


                      Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 90,
                                      padding: const EdgeInsets.symmetric(horizontal: 50,
                                          vertical: 15),
                                      child: FlatButton(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 5, horizontal: 100),
                                        shape: StadiumBorder(),
                                        onPressed: () {
                                          _formSubmit();
                                        },
                                        child: Text(
                                          'Signup',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        color: Colors.green,
                                      ),
                                    ),  
                                     SizedBox(height: 30),
                      TermsOfUse(),


                    ],
                  ),
                ),
              ),
            ),
            ),
        
      ],
    );
  }

  Future<void> _formSubmit() async {
    final FormState formStateVal = _formKeyValue.currentState;
    if (formStateVal.validate()) {
      formStateVal.save();
      dynamic result = await _auth.registerWithEmailAndPassword(formsignup.email, formsignup.password,formsignup.name);
      // res.sendOTP(formsignup.email);
      if(result == null) {
        setState(() {
          error = 'Email already registered';
        });

    }
    else {
        await res.sendOTP(formsignup.email);
        Map<String,dynamic> userDataMap = {
          "userName" : formsignup.name,
          "userEmail" : formsignup.email,
          "points" : "0",
          "friends_request" : requestsoffriends,
          "friends" :friendslist,
          "gamerequests" :friendslist,
          "statut" : "online",
          "Roomname" : "",
        };

        databaseMethods.addUserInfo(userDataMap,formsignup.name,);
        await HelperFunctions.saveUserEmailSharedPreference(formsignup.email);
        await HelperFunctions.saveUserNameSharedPreference(formsignup.name);
        await HelperFunctions.saveUserLoggedInSharedPreference(true);






        Navigator.of(context).pushNamed(
            'Checkyouremail', arguments: formsignup.email);
      }


  }
}}