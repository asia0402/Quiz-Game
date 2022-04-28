import 'package:flutter/material.dart';

class ScoreView extends StatefulWidget {
  final int score;
  final Function onBackButton;
  const ScoreView(this.score, this.onBackButton, {Key? key}) : super(key: key);
  
  @override
  ScoreViewState createState() => ScoreViewState();
}

class ScoreViewState extends State<ScoreView> {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffe5e5e5),
      width: MediaQuery.of(context).size.width,
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: (() {
              widget.onBackButton();
            }),
            icon: const Icon(Icons.arrow_back),
          ),
          Text("Wynik: " + widget.score.toString(), style: const TextStyle(fontSize: 20.0)),
          const IconButton(onPressed: null, icon: Icon(Icons.close, color: Color(0xffe5e5e5)))
        ] 
      ) 
    );
  }
}