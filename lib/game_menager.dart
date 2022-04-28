import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quizgame/question.dart';
import 'package:quizgame/question_view.dart';
import 'package:quizgame/result_view.dart';
import 'package:quizgame/score_view.dart';
import 'package:quizgame/selected_category.dart';

class GameMenager extends StatefulWidget {
  const GameMenager({Key? key}) : super(key: key);

  @override
  GameMenagerState createState() => GameMenagerState();
}

class GameMenagerState extends State<GameMenager> {
  Map<String, String> categories = {};
  List<Question> questions = [];
  dynamic questionsJson = [];
  String? selectedCategory;
  String currentQuestion = "";
  String currentPhoto = "https://zooart.com.pl/blog/wp-content/uploads/2021/04/miesozerne-ryby-akwariowe.jpg";
  List<String> currentAnswers = [];
  String currentCorrect = "";
  int maxScore = 0;
  int score = 0;
  bool endOfGame = false;

  @override
  void initState() {
    loadQuestions();
    super.initState();
  }

  void loadQuestions() async {
    final String fileContent = await rootBundle.loadString('assets/question.json');
    questionsJson = await jsonDecode(fileContent);

    setState(() {
      questionsJson["categories"].forEach((index, value) {
        categories[index] = value["name"];
      });
    });
  }

  void setCategory(String category) {
    setState(() {
      selectedCategory = category;
      questions.clear();
      List<dynamic> listJson = questionsJson["categories"][selectedCategory]["questions"];
      for (var json in listJson) {
        Question question = Question(json["question"] as String, json["photo"] as String, List<String>.from(json["answers"]), json["correct"] as String);
        questions.add(question);
      }
      maxScore = questions.length;
    });
    loadQuestion();
  }

  void loadQuestion() {
    setState(() {
      if (questions.isNotEmpty) {
        questions.shuffle();
        Question randomQuestion = questions.last;
        questions.removeLast();

        currentQuestion = randomQuestion.text;
        currentPhoto = randomQuestion.photo;
        currentAnswers = randomQuestion.answers;
        currentCorrect = randomQuestion.correct;
      }
      else {
        endOfGame = true;
      }
    });
  }

  void onSelect(bool isCorrect) {
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        score += (isCorrect) ? 1 : 0;
      });
      loadQuestion();
    });
  }

  void onBackToCategoryView() {
    setState(() {
      selectedCategory = null;
      score = 0;
      endOfGame = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (selectedCategory == null) {
      return SelectedCategory(categories, setCategory);
    }
    if (endOfGame) {
      return ResultView(score, maxScore, onBackToCategoryView);
    }
    currentAnswers.shuffle();
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          ScoreView(score, onBackToCategoryView),
          QuestionView(currentQuestion, currentPhoto, currentAnswers, currentCorrect, onSelect)
        ]
      )
    );
  }
}