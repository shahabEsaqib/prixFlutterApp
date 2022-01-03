import '../widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'RealGame.dart';


class Loading3 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoadingState3();
  }
}
class LoadingState3 extends State<Loading3> {
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
        builder: (context) => RealGame()
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
                        'assets/images/Loading.png',
                        width: 350,
                        height: 200,
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