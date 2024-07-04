import 'package:flutter/material.dart';
import 'package:quiz_app/python_questions/question_widget.dart';
import 'package:quiz_app/python_questions/result_screen.dart';

class ReactJs_screen extends StatefulWidget {
  @override
  _ReactJs_screenState createState() => _ReactJs_screenState();
}

class _ReactJs_screenState extends State<ReactJs_screen> {
  int currentQuestionIndex = 0;
  int score = 0;

  final List<Question> questions = [
    Question('Who developed React?', ['Google', 'Facebook', 'Microsoft', 'Twitter'], 'Facebook'),
    Question('What is the command to create a new React app?', ['npm new react-app', 'create-react-app', 'npx create-react-app', 'npm init react-app'], 'npx create-react-app'),
    Question('What is JSX?', ['A CSS preprocessor', 'A JavaScript syntax extension', 'A type of JSON', 'A JavaScript library'], 'A JavaScript syntax extension'),
    Question('Which method is used to update the state in a React component?', ['setState', 'updateState', 'changeState', 'modifyState'], 'setState'),
    Question('What is a React component?', ['A reusable piece of UI', 'A type of Redux state', 'A JavaScript variable', 'A CSS class'], 'A reusable piece of UI'),
    Question('What is the virtual DOM?', ['A copy of the actual DOM', 'A real-time database', 'A CSS stylesheet', 'A testing library'], 'A copy of the actual DOM'),
    Question('Which hook is used to manage state in a functional component?', ['useState', 'useEffect', 'useContext', 'useReducer'], 'useState'),
    Question('What is the purpose of the useEffect hook?', ['To handle side effects in a functional component', 'To create context', 'To manage component state', 'To define prop types'], 'To handle side effects in a functional component'),
    Question('How do you pass data from a parent to a child component?', ['Using state', 'Using props', 'Using context', 'Using Redux'], 'Using props'),
    Question('What is the use of the React Fragment?', ['To wrap multiple elements without adding extra nodes to the DOM', 'To manage component state', 'To fetch data from an API', 'To create context'], 'To wrap multiple elements without adding extra nodes to the DOM'),
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
                borderRadius: BorderRadius.circular(20), 
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
