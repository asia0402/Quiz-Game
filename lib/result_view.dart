import 'package:flutter/material.dart';

class ResultView extends StatelessWidget {
  final int score;
  final int maxScore;
  final Function onClose;
  const ResultView(this.score, this.maxScore, this.onClose, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color(0xffe5e5e5),
      title: const Text('Twój wynik:', textAlign: TextAlign.center),
      content: Text(
        score.toString() + "/" + maxScore.toString(),
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 50)
      ),
      actions: [
        ElevatedButton(
          onPressed: () => onClose(), 
          child: const Center (child: Text('Zacznij od nowa')),
          style: ButtonStyle(backgroundColor: MaterialStateProperty.all(const Color(0xfffca311)))
        )
      ],
    );
  }
}