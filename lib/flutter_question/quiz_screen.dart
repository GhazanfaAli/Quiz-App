import 'package:flutter/material.dart';
import 'package:quiz_app/flutter_question/question_widget.dart';
import 'package:quiz_app/python_questions/question_widget.dart';
import 'package:quiz_app/python_questions/result_screen.dart';

class FLutterScreen extends StatefulWidget {
  @override
  _FLutterScreenState createState() => _FLutterScreenState();
}

class _FLutterScreenState extends State<FLutterScreen> {
  int currentQuestionIndex = 0;
  int score = 0;

  final List<Question_two> questions = [
    Question_two('Who developed Flutter?', ['Apple', 'Google', 'Facebook', 'Microsoft'], 'Google'),
    Question_two('What programming language is used to write Flutter apps?', ['Java', 'Kotlin', 'Swift', 'Dart'], 'Dart'),
    Question_two('What is a widget in Flutter?', ['A component', 'A function', 'A variable', 'A class'], 'A component'),
    Question_two('Which command is used to create a new Flutter project?', ['flutter start', 'flutter new', 'flutter create', 'flutter init'], 'flutter create'),
    Question_two('What method is used to create a Stateful widget?', ['createState', 'build', 'initState', 'setState'], 'createState'),
    Question_two('What is the function of the build method in a StatelessWidget?', ['To initialize variables', 'To define the UI', 'To handle user input', 'To manage state'], 'To define the UI'),
    Question_two('What is the primary function of the pubspec.yaml file?', ['Manage dependencies', 'Store app settings', 'Configure the build', 'Define routes'], 'Manage dependencies'),
    Question_two('Which widget is used for repeating content in Flutter?', ['Column', 'Row', 'Container', 'ListView'], 'ListView'),
    Question_two('What is the use of the hot reload feature in Flutter?', ['To reload the app', 'To reset the state', 'To update code changes without losing state', 'To clear the cache'], 'To update code changes without losing state'),
    Question_two('Which widget would you use to align content in the center of the screen?', ['Align', 'Center', 'Positioned', 'Stack'], 'Center'),
  ];



  void nextQuestion(String selectedOption) {
    if (questions[currentQuestionIndex].correctOption == selectedOption) {
      score++;
    }

    setState(() {
      if (currentQuestionIndex < questions.length - 1) {
        currentQuestionIndex++;
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ResultScreen(score: score, total: questions.length),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0, // Remove app bar elevation
      ),
      backgroundColor: Colors.blue.shade900, // Background color
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Question ${currentQuestionIndex + 1}/10',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Card(
                 color: Color.fromARGB(255, 88, 108, 219),
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20), // Rounded corners for card
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: QuestionWidget_two(
                  question: questions[currentQuestionIndex].questionText,
                  options: questions[currentQuestionIndex].options,
                  onOptionSelected: nextQuestion,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Question_two {
  final String questionText;
  final List<String> options;
  final String correctOption;

  Question_two(this.questionText, this.options, this.correctOption);
}
