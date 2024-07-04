import 'package:flutter/material.dart';

class QuestionWidget extends StatelessWidget {
  final String question;
  final List<String> options;
  final Function(String) onOptionSelected;

  QuestionWidget({required this.question, required this.options, required this.onOptionSelected});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Text(
            question,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        ...options.map((option) => InkWell(
          onTap: () => onOptionSelected(option),
          child: Padding(
            padding: const EdgeInsets.only(top: 15, bottom: 15),
            child: Padding(
              padding: const EdgeInsets.only(left: 13, right: 13),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 125, 114, 226), 
                  borderRadius: BorderRadius.circular(30),
                  // border: Border.all(color: Colors.black87),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2), 
                      offset: Offset(0, 0),
                      blurRadius: 20,
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: Text(
                    option,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        )),
      ],
    );
  }
}
