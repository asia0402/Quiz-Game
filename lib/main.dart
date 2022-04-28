import 'package:flutter/material.dart';
import 'package:quizgame/game_interface.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Quiz Game',
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(color: Color(0xff14213d)),
          child: const SafeArea(
            child: GameInterface()
          )
      ))
    ),
  );
}

