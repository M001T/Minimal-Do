import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:minimaldo/screen/task_screen.dart';

import 'delay_animation.dart';

class Opening extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<Opening> with SingleTickerProviderStateMixin {
  final int delayedAmount = 200;
  double _scale;
  AnimationController _controller;
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 200,
      ),
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final color = Colors.white;
    _scale = 1 - _controller.value;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(elevation: 0, backgroundColor: Colors.white),
          backgroundColor: Colors.white,
          body: Center(
            child: Column(
              children: <Widget>[
                AvatarGlow(
                  endRadius: 90,
                  duration: Duration(seconds: 2),
                  glowColor: Colors.blue,
                  repeat: true,
                  repeatPauseDuration: Duration(seconds: 2),
                  startDelay: Duration(seconds: 1),
                  child: Material(
                      elevation: 8.0,
                      shape: CircleBorder(),
                      child: CircleAvatar(
                        backgroundColor: Colors.blue,
                        child: Icon(FontAwesomeIcons.check, size: 50),
                        radius: 50.0,
                      )),
                ),
                DelayedAnimation(
                  child: Text(
                    "Hi There",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 35.0,
                        color: Colors.black),
                  ),
                  delay: delayedAmount + 1000,
                ),
                DelayedAnimation(
                  child: Text(
                    "Minimal Do",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 35.0,
                        color: Colors.blue),
                  ),
                  delay: delayedAmount + 1000,
                ),
                SizedBox(
                  height: 30.0,
                ),
                DelayedAnimation(
                  child: Text(
                    "Seu app de tarefas",
                    style: TextStyle(fontSize: 20.0, color: Colors.black),
                  ),
                  delay: delayedAmount + 3000,
                ),
                DelayedAnimation(
                  child: Text(
                    "Espero que você tenha um bom dia",
                    style: TextStyle(fontSize: 20.0, color: Colors.black),
                  ),
                  delay: delayedAmount + 3000,
                ),
                SizedBox(
                  height: 100.0,
                ),
                DelayedAnimation(
                  child: GestureDetector(
                    onTapDown: _onTapDown,
                    onTapUp: _onTapUp,
                    child: Transform.scale(
                      scale: _scale,
                      child: _animatedButtonUI,
                    ),
                  ),
                  delay: delayedAmount + 1300,
                ),
                SizedBox(
                  height: 10.0,
                ),
                DelayedAnimation(
                  child: Text(
                    "Todos os Direitos reservados".toUpperCase(),
                    style: TextStyle(
                        fontSize: 8.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  ),
                  delay: delayedAmount + 1000,
                ),
              ],
            ),
          )),
    );
  }

  Widget get _animatedButtonUI => Container(
        height: 60,
        width: 270,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.0),
        ),
        child: Center(
          child: SizedBox(
            height: 60,
            width: 300,
            child: RaisedButton(
              color: Colors.blue,
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30),
                  side: BorderSide(color: Colors.transparent)),
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => TaskScreen()));
              },
              child: Text(
                'Hi MinimalDo',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      );

  void _onTapDown(TapDownDetails details) {
    _controller.forward();
  }

  void _onTapUp(TapUpDetails details) {
    _controller.reverse();
  }
}
