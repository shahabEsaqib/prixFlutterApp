import 'package:flutter_loginpage/screens/firstLoading.dart';
import '../widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'dart:async';



class Loading extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoadingState();
  }
}
class LoadingState extends State<Loading> {
  @override
  void initState() {

    // ignore: todo
    // TODO: implement initState
    super.initState();
    startTime();
  }
  startTime() async {
    var duration = new Duration(seconds: 3);
    return new Timer(duration, route);
  }
  route() {
    Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) => FirstLoading()
    )
    );
  }





  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundImage1(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body:  SafeArea( child :
          Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 220),
                child: Center(
                    child: Image.asset(
                      'assets/images/logo.png',
                      width: 170,
                      height: 170,
                    )


                ),
              ),
            ],
          ),
          ),),
      ],
    );
  }
}