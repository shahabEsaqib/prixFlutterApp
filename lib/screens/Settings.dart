// ignore_for_file: must_call_super, empty_statements

import 'package:cloud_firestore/cloud_firestore.dart';
// ignore: unused_import
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_loginpage/services/auth_services.dart';
import 'package:flutter_loginpage/shared/helperfunction.dart';


class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();

}

class _SettingsState extends State<Settings> with WidgetsBindingObserver {
  final AuthService _auth = AuthService();
  String myUsername = '';
  List settings = ["Change Password","Logout"];
  bool test ;


  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    fn();
  }

  Future<void> fn() async { myUsername= await HelperFunctions.getUserNameSharedPreference();}


  @override
  Widget build(BuildContext context) {



    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.grey.shade600,
        elevation: 0,


        title: Text("Settings"),

      ),
      body:ListView.builder(
          itemCount: settings.length,
          itemBuilder: (context, index) {
            return Padding(

              padding: EdgeInsets.symmetric(vertical: 1.0, horizontal: 50.0),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                child: ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  tileColor: Colors.green,
                  onTap: () async {
                    if(index==0){Navigator.of(context).pushNamed(
                        'changepassword', arguments: '');}

                    if(index==1){_auth.signOut();
                    await HelperFunctions.saveUserLoggedInSharedPreference(false);
                    await HelperFunctions.savegameSharedPreference(false);
                    test=await HelperFunctions.getUserLoggedInSharedPreference();
                    print(test);

                    await FirebaseFirestore.instance.collection('users').doc(myUsername).update({
                      "statut": 'offline',
                    }).catchError((e) {
                      print(e.toString());
                    });

                      Navigator.of(context).pushNamed(
                        'LoginPage', arguments: '');};

                  },
                  title: Center(child: Text(""+settings[index],style: TextStyle(color:Colors.white,fontFamily: 'Raleway'),)),



                ),

              ),
            );
          }
      ),
    );
  }
}