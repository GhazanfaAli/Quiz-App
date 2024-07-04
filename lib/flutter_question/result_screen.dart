import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../main_menu.dart';



class ResultScreen extends StatelessWidget {
  final int score;
  final int total;

  ResultScreen({required this.score, required this.total});

  static const colorizeColors = [
    Colors.green,
    Colors.blue,
    Colors.yellow,
    Colors.red,
  ];

  var _shading = Colors.grey.shade400;

  static const colorizeTextStyle = TextStyle(
    fontSize: 30.0,
    fontFamily: 'Horizon',
    fontWeight: FontWeight.bold,
  );

  final coloList = <Color>[
    Colors.blue,
    Colors.red,
  ];

  final List<String> images = [
    'https://game-ace.com/wp-content/uploads/2019/10/share-quizz.png',
    'https://img.freepik.com/free-vector/thank-you-your-attention-sign-illustration_23-2150318317.jpg?size=338&ext=jpg&ga=GA1.1.2082370165.1716508800&semt=ais_user',
    'https://thumbs.dreamstime.com/z/student-hand-fills-examination-quiz-paper-school-exam-test-results-wooden-school-desk-pins-calculator-vector-illustration-69815576.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSdMhX7DAJb73hwwk8bdm1IiGkXuQ6NL_NxIw&s',

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: Column(
          children: [
            CarouselSlider.builder(
              itemCount: images.length,
              options: CarouselOptions(
                height: 160,
                autoPlayInterval: Duration(seconds: 2),
                autoPlay: true,
                aspectRatio: 2.0,
                enlargeCenterPage: true,
                viewportFraction: 0.6,

              ),
              itemBuilder: (context, index, realIdx) {
                return Container(

                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: _shading,
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 5), // changes position of shadow
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.network(
                      images[index],
                      fit: BoxFit.cover,
                      width: MediaQuery.of(context).size.width,
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 30,),

            Container(
              alignment: Alignment.center,
              width: 300.0,
              child: DefaultTextStyle(
                style: TextStyle(
                  fontSize: 35,
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
                child: AnimatedTextKit(
                  repeatForever: false,
                  isRepeatingAnimation: true,
                  animatedTexts: [
                    TyperAnimatedText('Quiz Result !!!'),
                  ],
                ),
              ),
            ),
            SizedBox(height: 55),
            PieChart(
              dataMap: {
                "Your Score": score.toDouble(),
                "Wrong Choices": (total - score).toDouble(),
              },
              animationDuration: Duration(seconds: 2),
              chartLegendSpacing: 32,
              chartRadius: MediaQuery.of(context).size.width / 2.3,
              colorList: coloList,
              initialAngleInDegree: 0,
              chartType: ChartType.disc,
              ringStrokeWidth: 32,
              centerText: "Result",


              legendOptions: LegendOptions(
                showLegendsInRow: false,
                legendPosition: LegendPosition.right,
                showLegends: true,
                legendShape: BoxShape.circle,
                legendTextStyle: TextStyle(
                  fontWeight: FontWeight.bold,

                ),
              ),
              chartValuesOptions: ChartValuesOptions(

                showChartValueBackground: true,
                showChartValues: true,
                showChartValuesInPercentage: true,
                showChartValuesOutside: false,
                decimalPlaces: 1,
              ),
            ),
            SizedBox(height: 55),
            SizedBox(
              width: 313.0,
              child: TextLiquidFill(
                text: 'Your score is $score out of $total',
                waveColor: Colors.blueAccent,
                boxBackgroundColor: Colors.white,
                textStyle: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                boxHeight: 35.0,
              ),
            ),
            SizedBox(height: 55),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MainMenu(),
                  ),
                );
              },
              child: Container(
                height: 50,
                width: 250,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  gradient: LinearGradient(
                    colors: [Colors.orange, Colors.red],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 5.0,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Text(
                  'Click to end',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
