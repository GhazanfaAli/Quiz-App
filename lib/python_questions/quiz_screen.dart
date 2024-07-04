import 'package:flutter/material.dart';
import 'package:quiz_app/python_questions/question_widget.dart';
import 'package:quiz_app/python_questions/result_screen.dart';

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentQuestionIndex = 0;
  int score = 0;

  final List<Question> questions = [
    Question('What is the maximum possible length of an identifier?', ['16', '32', '64', 'None of these'], 'None of these'),
    Question('Who developed the Python language?', ['195', '1972', '1981', '1989'], '1989'),
    Question('What do we use to define a block of code in Python language?', ['Key', 'Brackets', 'Indentation', '1989'], 'Indentation'),
    Question('In which language is Python written?', ['English', 'PHP', 'C', 'All of the above'], 'C'),
    Question('What is the method inside the class in python language?', ['Object', 'Function', 'Attribute', 'Argument'], 'Function'),
    Question('Which of the following is a mutable data type in Python?', ['Tuple', 'List', 'String', 'None of these'], 'List'),
    Question('How do you start a comment in Python?', ['//', '/*', '#', '--'], '#'),
    Question('What is the output of print(2**3)?', ['6', '8', '9', 'None of these'], '8'),
    Question('What is the file extension for Python files?', ['.pt', '.pyt', '.py', '.pyn'], '.py'),
    Question('Which keyword is used to create a function in Python?', ['def', 'function', 'fun', 'define'], 'def'),
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
      
      backgroundColor: Colors.blue.shade900, 
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
