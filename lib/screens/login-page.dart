// ignore_for_file: deprecated_member_use, unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_loginpage/palatte.dart';
import 'package:flutter_loginpage/services/auth_services.dart';
import 'package:flutter_loginpage/services/database1.dart';
import 'package:flutter_loginpage/shared/helperfunction.dart';
import 'package:flutter_loginpage/shared/loadingg.dart';
import 'package:flutter_loginpage/widgets/FormVal.dart';
import 'package:flutter_loginpage/widgets/Formsignup.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class LoginPage extends StatefulWidget {
  @override
  _MyLoginPageState createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<LoginPage> {
//  Map _userObj ={};
  String codeDialog = '';

  DatabaseMethods databaseMethods = new DatabaseMethods();
  String error = '';
  bool existtest;
  FormVal formVal = new FormVal();
  Formsignup formsignup = new Formsignup();
  var friendslist = [];
  // String _sucribestatus = 'Yes';
  bool loading = false;

  var requestsoffriends = [];
  var selectedCurrency, selectedType;
  // final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  bool testtest = true;

  Map<String, dynamic> userMap;
  Map<String, dynamic> userMapmap;
  String valueText = '';
  bool zetest;

  final AuthService _auth = AuthService();
  final GlobalKey<FormState> _formKeyValue = new GlobalKey<FormState>();
  TextEditingController _textFieldController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FocusNode myFocusNode = FocusNode();

  Future<bool> fn() async {
    zetest = await HelperFunctions.getUserLoggedInSharedPreference();
    return zetest;
  }

  Future<void> _displayTextInputDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Phone Alert'),
            content: TextField(
              onChanged: (value) {
                setState(() {
                  valueText = value;
                });
              },
              controller: _textFieldController,
              decoration: InputDecoration(hintText: "Choose a username"),
            ),
            actions: <Widget>[
              FlatButton(
                color: Colors.red,
                textColor: Colors.black,
                child: Text('Confirm'),
                onPressed: () {
                  setState(() {
                    codeDialog = valueText;
                    Navigator.pop(context);
                  });
                },
              ),
            ],
          );
        });
  }

  Future<void> _formSubmit() async {
    final FormState formStateVal = _formKeyValue.currentState;
    if (formStateVal.validate()) {
      formStateVal.save();
      print('form is saved');
      dynamic result = await _auth.signInWithEmailAndPassword(
          formVal.email, formVal.password);
      if (result == null) {
        setState(() {
          error = 'Could not sign in with those credentials';
        });
      } else {
        await FirebaseFirestore.instance
            .collection('users')
            .where("userEmail", isEqualTo: formVal.email)
            .get()
            .then((value) {
          if (value != null) {
            userMap = value.docs[0].data();
            formVal.name = userMap["userName"];
          }
          print(formVal.name);
        });
        print("aaaaaaaaaaaaaaaaaaaaa");

        await HelperFunctions.saveUserLoggedInSharedPreference(true);
        await HelperFunctions.saveUserNameSharedPreference(formVal.name);
        await FirebaseFirestore.instance
            .collection('users')
            .doc(formVal.name)
            .update({
          "statut": 'online',
        }).catchError((e) {
          print(e.toString());
        });
        Navigator.of(context).pushNamed('Newuser', arguments: '');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loadingg()
        : Stack(
            children: [
              // BackgroundImage(),
              Scaffold(
                // backgroundColor: Color(0xff1b2e4d),
                backgroundColor: Colors.white,
                body: SingleChildScrollView(
                  child: Form(
                    key: _formKeyValue,
                    child: SafeArea(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            height: 150,
                            child: Center(
                              child: Image.asset(
                                'assets/images/logo.png',
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
                                  'Login',
                                  style: TextStyle(
                                      fontSize: 30,
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 25, vertical: 0),
                            child: Column(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Container(
                                      child: Column(children: [
                                        new TextFormField(
                                          
                                          focusNode: myFocusNode,
                                          controller: emailController,
                                          decoration: InputDecoration(
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
                                              suffixIcon: emailController
                                                      .text.isEmpty
                                                  ? Text('')
                                                  : GestureDetector(
                                                      onTap: () {
                                                        emailController.clear();
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
                                            if (!RegExp(r'\S+@\S+\.\S+')
                                                .hasMatch(value)) {
                                              return 'Please enter a valid email address';
                                            }
                                            // Return null if the entered email is valid
                                            return null;
                                          },
                                          onChanged: (value) =>
                                              formVal.email = value,
                                          onSaved: (value) =>
                                              formVal.email = value,
                                          style: TextStyle(color: Colors.black),
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          textInputAction: TextInputAction.next,
                                        ),
                                      ]),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    
                                    Container(
                                      child: Column(children: [
                                        TextFormField(
                                          decoration: InputDecoration(
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
                                              suffixIcon: emailController
                                                      .text.isEmpty
                                                  ? Text('')
                                                  : GestureDetector(
                                                      onTap: () {
                                                        emailController.clear();
                                                      },
                                                      child: Icon(Icons.close,color: Colors.green,)),
                                              hintText: '********',
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
                                          onChanged: (value) =>
                                              formVal.password = value,
                                          onSaved: (value) =>
                                              formVal.password = value,
                                          style: kBodyText,
                                          textInputAction: TextInputAction.done,
                                        ),
                                        
                                      ]),
                                    ),
                                    TextButton(
                                        child: Text(
                                          'Forgot your password?',
                                          style: TextStyle(
                                              color: Colors.grey.shade600,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        onPressed: () {
                                          Navigator.of(context).pushNamed(
                                              'Resetyourpassword2',
                                              arguments: '');
                                        }),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 90,
                                      padding: const EdgeInsets.symmetric(horizontal: 30,
                                          vertical: 15),
                                      child: FlatButton(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 5, horizontal: 100),
                                        shape: StadiumBorder(),
                                        onPressed: () {
                                          _formSubmit();
                                        },
                                        child: Text(
                                          'Login',
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
                                      height: 8,
                                      child: Text(
                                        error,
                                        style: TextStyle(
                                            color: Colors.red, fontSize: 14.0),
                                      ),
                                    ),
                                    Container(
                                      width: 175,
                                      margin: EdgeInsets.symmetric(
                                          vertical: 0.0, horizontal: 7.0),
                                      child: Center(
                                        child: Row(children: [
                                          Container(
                                            height: 1,
                                            color: Colors.white,
                                            width: 80,
                                          ),
                                          Container(
                                            child: Text('or',
                                                style: TextStyle(
                                                    color: Colors.white)),
                                          ),
                                          Container(
                                            height: 1,
                                            color: Colors.white,
                                            width: 80,
                                          ),
                                        ]),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    /*FlatButton( padding: EdgeInsets.symmetric(vertical:5 ,horizontal: 100),
                                shape: StadiumBorder(),
                                onPressed:() {},

                                child : Text( 'Login with facebook',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight:FontWeight.w500
                                  ,),),
                                color : Colors.blue[700],

                              ),*/
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 90,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 30,
                                          vertical: 15),
                                      child: ElevatedButton.icon(
                                        
                                        icon: Icon(
                                          Icons.facebook,
                                          color: Colors.white,
                                          size: 30.0,
                                        ),
                                        label: Text(
                                          'Login with Facebook',
                                          style: TextStyle(fontSize: 20),
                                        ),
                                        onPressed: () async {
                                          final LoginResult result =
                                              await FacebookAuth.instance.login(
                                            permissions: [
                                              'public_profile',
                                              'email'
                                            ],
                                          );
                                          // by default we request the email and the public profile
// or FacebookAuth.i.login()
                                          if (result.status ==
                                              LoginStatus.success) {
                                            // you are logged
                                            final AccessToken accessToken =
                                                result.accessToken;
                                          }
                                          final AccessToken accessToken =
                                              await FacebookAuth
                                                  .instance.accessToken;
// or FacebookAuth.i.accessToken
                                          if (accessToken != null) {
                                            // user is logged
                                            setState(() async {
                                              final facebookAuthCredential =
                                                  FacebookAuthProvider.credential(
                                                      result.accessToken.token);
                                              await _auth.signInWithCredential(
                                                  facebookAuthCredential);
                                              //await FirebaseFirestore.instance.collection('users');
                                              await HelperFunctions
                                                  .saveUserLoggedInSharedPreference(
                                                      true);
                                              await _displayTextInputDialog(
                                                  context);
                                              await HelperFunctions
                                                  .saveUserNameSharedPreference(
                                                      valueText);

                                              String username = await HelperFunctions
                                                  .getUserNameSharedPreference();
                                              existtest = await databaseMethods
                                                  .checkExist(valueText);
                                              if (existtest == true) {
                                                Navigator.of(context).pushNamed(
                                                    'AllowLocation',
                                                    arguments: '');
                                              } else {
                                                Map<String, dynamic> userDataMap =
                                                    {
                                                  "userName": valueText,
                                                  "points": "0",
                                                  "friends_request":
                                                      requestsoffriends,
                                                  "friends": friendslist,
                                                  "gamerequests": friendslist,
                                                  "statut": "online",
                                                  "Roomname": "",
                                                };

                                                databaseMethods.addUserInfo(
                                                  userDataMap,
                                                  valueText,
                                                );
                                                Navigator.of(context).pushNamed(
                                                    'AllowLocation',
                                                    arguments: '');
                                              }
                                            });
                                          }
                                        },
                                        style: ElevatedButton.styleFrom(
                                          shape: new RoundedRectangleBorder(
                                            borderRadius:
                                                new BorderRadius.circular(40),
                                          ),
                                        ),
                                      ),
                                    ),
                                  
                                    Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "don't have account? ",
                    style: TextStyle(color: Colors.grey.shade600,fontSize: 15, fontWeight:FontWeight.bold),
                  ),
                                        TextButton(
                                            child: Text(
                                              'Singup',
                                              style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.green,
                                                decoration: TextDecoration.underline
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                            onPressed: () async {
                                              //setState(() => loading = true);

                                              Navigator.of(context).pushNamed(
                                                  'Signup',
                                                  arguments: '');
                                            }),
                                        
                                      ]),
                                    
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
  }
}
