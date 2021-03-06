import 'package:flutter/material.dart';

class QuestionView extends StatefulWidget {
  final List<String> answers;
  final String question;
  final String image;
  final String correct;
  final Function onSelect;
  int selectedAnswer = -1;
  QuestionView(this.question, this.image, this.answers, this.correct, this.onSelect, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => QuestionViewState();      
}

class QuestionViewState extends State<QuestionView> {
  @override 
  Widget build(BuildContext context) {
    return Flexible(
      flex: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
            child: Text(widget.question, style: const TextStyle(fontSize: 20, color: Colors.white, decoration: TextDecoration.none))
          ),
          Expanded(
            flex: 1,
            child: Container(
              child: Image.asset('assets/photos/' + widget.image),
                width: 400.0,
                height: 250.0,
                padding: const EdgeInsets.only(top: 20.0, bottom: 15.0),
              )
          ),
          Expanded(
            flex: 1,
            child: ListView.separated(
              scrollDirection: Axis.vertical,
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              itemCount: widget.answers.length,
              itemBuilder: (BuildContext context, int index) {
                Color buttonColor = const Color(0xfffca311);
                if (widget.selectedAnswer >= 0) { // any answer was selected
                  if (index == widget.selectedAnswer) { // this button is selected button
                    if (widget.answers[index] == widget.correct) { // is correct answer
                      buttonColor = Colors.green;
                    }
                    else { // if not correct answer
                      buttonColor = Colors.red;
                    }
                  }
                  else if (widget.answers[index] == widget.correct) { // not selected button, but correct answer
                    buttonColor = Colors.green;
                  }
                }

                return ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(buttonColor)
                  ),
                  onPressed: widget.selectedAnswer >= 0 ? null : () {
                    setState(() {
                      widget.selectedAnswer = index;
                      widget.onSelect(widget.answers[widget.selectedAnswer] == widget.correct);
                    });
                  }, 
                  child: Center(
                    child: Text(widget.answers[index])
                  )
                );
              },
              separatorBuilder: (BuildContext context, int index) => const Divider(height: 5.0)
            )
          )  
        ]
      )
    );
  }
}
