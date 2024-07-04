import 'package:flutter/material.dart';
import 'package:quiz_app/C_Sharp/question_widget.dart';
import 'package:quiz_app/C_Sharp/result_screen.dart' as result_screen;


class CSharp extends StatefulWidget {
  @override
  _CSharpState createState() => _CSharpState();
}

class _CSharpState extends State<CSharp> {
  int currentQuestionIndex = 0;
  int score = 0;

  final List<Question> questions = [
    Question('Who developed the C# language?', ['Microsoft', 'Apple', 'Google', 'IBM'], 'Microsoft'),
    Question('What is the file extension for C# files?', ['.cs', '.csharp', '.c', '.cpp'], '.cs'),
    Question('Which keyword is used to define a class in C#?', ['class', 'Class', 'define', 'object'], 'class'),
    Question('Which method is the entry point of a C# program?', ['Main', 'main', 'Start', 'Entry'], 'Main'),
    Question('Which of the following is a value type in C#?', ['Array', 'Class', 'Enum', 'String'], 'Enum'),
    Question('What is used to handle exceptions in C#?', ['try-catch', 'error handling', 'throw-catch', 'try-except'], 'try-catch'),
    Question('Which keyword is used to inherit a class in C#?', ['inherits', 'base', 'extends', 'inherits'], 'inherits'),
    Question('What is the purpose of the using statement in C#?', ['To include namespaces', 'To handle exceptions', 'To create a class', 'To define a method'], 'To include namespaces'),
    Question('What is the default access modifier for a class in C#?', ['public', 'private', 'protected', 'internal'], 'internal'),
    Question('Which collection is used to store key-value pairs in C#?', ['ArrayList', 'List', 'Dictionary', 'Queue'], 'Dictionary'),
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
            builder: (context) => result_screen.ResultScreen(score: score, total: questions.length),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
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
                child: QuestionWidget(
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

class Question {
  final String questionText;
  final List<String> options;
  final String correctOption;

  Question(this.questionText, this.options, this.correctOption);
}
