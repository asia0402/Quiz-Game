import 'package:flutter/material.dart';
import 'package:quizgame/game_menager.dart';

class GameInterface extends StatelessWidget {
  const GameInterface({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: const GameMenager(),
    );
  }
}
