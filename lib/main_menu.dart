// ignore: depend_on_referenced_packages
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/C_Sharp/quiz_screen.dart';
import 'package:quiz_app/ReactJs/quiz_screen.dart';
import 'package:quiz_app/flutter_question/quiz_screen.dart';
// ignore: depend_on_referenced_packages
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:quiz_app/python_questions/quiz_screen.dart';




class MainMenu extends StatefulWidget {
  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {

  final List<String> images = [
    'https://t3.ftcdn.net/jpg/03/45/97/36/360_F_345973621_sMifpCogXNoIDjmXlbLwx1QZA5ZmQVl8.jpg',
    'https://live.staticflickr.com/5225/5843577306_06fd6132f7_b.jpg',

  ];
  CarouselController _controller = CarouselController();
  String reason = '';

  @override
  Widget build(BuildContext context) {

    void onPageChange(int index, CarouselPageChangedReason changeReason) {
      setState(() {
        reason = changeReason.toString();
      });
    }

    var height = MediaQuery.of(context).size.height * 0.2;
    var width = MediaQuery.of(context).size.width * 0.4;
    var shading = Colors.grey.shade400; 
    // var _vertical_box =
    return Scaffold(
      appBar: AppBar(

        title: const Text('Home', style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                Padding(
                  padding:  const EdgeInsets.only(bottom: 17.0),
                  child:CarouselSlider.builder(
                    itemCount: images.length,
                    options: CarouselOptions(
                      height: 170,
                      autoPlayInterval: const Duration(seconds: 2),
                      autoPlay: true,
                      aspectRatio: 2.0,
                      enlargeCenterPage: true,
                      onPageChanged: onPageChange,
                    ),
                    itemBuilder: (context, index, realIdx) {
                      return Container(
                  
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: shading,
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
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child:    DefaultTextStyle(
                style: const TextStyle(
                    fontSize: 30,
                    color: Colors.orange,
                    fontWeight: FontWeight.w900
                ),
                child: AnimatedTextKit(
                  repeatForever: true,

                  animatedTexts: [
                    TypewriterAnimatedText("Let's play Quiz..."),
                    TypewriterAnimatedText("Be the first"),
                  ],
                ),

              ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left:40.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 20,),
                      Row(
                        children: [
                          Stack(
                            children: [
                              InkWell(
                                onTap:(){
                                  Navigator.push(context,MaterialPageRoute(builder: (context) => QuizScreen()  ));
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color:Colors.white,
                                      borderRadius: const BorderRadius.all(Radius.circular(13)),

                                      boxShadow: [
                                        BoxShadow(
                                          color: shading,
                                          spreadRadius: 2,
                                          blurRadius: 5,
                                          offset: const Offset(0, 5),
                                        )
                                      ]
                                  ),
                                  width: width,
                                  height: height,

                                ),
                              ),
                              Positioned(
                                  top: 25,
                                  left: 5,
                                  right: 5,
                                  bottom: 0,
                                  child:
                                   Column(
                                    children: [
                                      Container(
                                        height: 60,
                                        width: 60,
                                        child: InkWell(
                                          onTap: (){
                                            Navigator.push(context,MaterialPageRoute(builder: (context) =>
                                                QuizScreen()  ));

                                          },
                                          child: const Image(
                                              image: NetworkImage('https://upload.wikimedia.org/wikipedia/commons/thumb/c/c3/Python-logo-notext.svg/640px-Python-logo-notext.svg.png')),
                                        ),
                                      ),
                                      const SizedBox(height: 17,),
                                      const Text('Python', style: TextStyle( fontWeight: FontWeight.w600),)
                                    ],
                                  )
                              )
                            ],),
                          const SizedBox(width: 15,),
                          Stack(
                            children: [
                              InkWell(
                                onTap: (){
                                  Navigator.push(context,MaterialPageRoute(builder: (context) => FLutterScreen()));

                                },
                                child: Container(
                                  width: width,
                                  height: height,
                                  decoration: BoxDecoration(
                                      color:Colors.white,
                                      borderRadius: const BorderRadius.all(Radius.circular(13)),
                                      boxShadow: [
                                        BoxShadow(
                                          color: shading,
                                          spreadRadius: 2,
                                          blurRadius: 5,
                                          offset: const Offset(0, 5),
                                        )
                                      ]
                                  ),
                                ),
                              ),
                              Positioned(
                                  top: 25,
                                  left: 5,
                                  right: 5,
                                  bottom: 0,
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 60,
                                        width: 60,
                                        child: InkWell(
                                          onTap: (){
                                            Navigator.push(context,MaterialPageRoute(builder: (context) => FLutterScreen()));

                                          },
                                          child: const Image(
                                              image: NetworkImage('https://cdn-images-1.medium.com/max/1200/1*5-aoK8IBmXve5whBQM90GA.png')),
                                        ),
                                      ),
                                      const SizedBox(height: 17,),
                                      const Text('Flutter', style: TextStyle( fontWeight: FontWeight.w600),)
                                    ],
                                  )
                              )
                            ],),

                        ],
                      ),
                      const SizedBox(height: 15,),
                      Row(
                        children: [
                          Stack(
                            children: [
                              InkWell(
                                onTap:(){
                                  Navigator.push(context,MaterialPageRoute(builder: (context) =>ReactJs_screen() ));
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color:Colors.white,
                                      borderRadius: const BorderRadius.all(Radius.circular(13)),

                                      boxShadow: [
                                        BoxShadow(
                                          color: shading,
                                          spreadRadius: 2,
                                          blurRadius: 5,
                                          offset: const Offset(0, 5),
                                        )
                                      ]
                                  ),
                                  width: width,
                                  height: height,

                                ),
                              ),
                              Positioned(
                                  top: 25,
                                  left: 5,
                                  right: 5,
                                  bottom: 0,
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 60,
                                        width: 60,
                                        child: InkWell(
                                          onTap: (){
                                            Navigator.push(context,MaterialPageRoute(builder: (context) =>
                                                ReactJs_screen()  ));

                                          },
                                          child: const Image(
                                              image: NetworkImage('https://upload.wikimedia.org/wikipedia/commons/thumb/a/a7/React-icon.svg/512px-React-icon.svg.png?20220125121207')),
                                        ),
                                      ),
                                      const SizedBox(height: 17,),
                                      const Text('React Js', style: TextStyle( fontWeight: FontWeight.w600),)
                                    ],
                                  )
                              )
                            ],),
                          const SizedBox(width: 15,),
                          Stack(
                            children: [
                              InkWell(
                                onTap: (){
                                         Navigator.push(context,MaterialPageRoute(builder: (context) => CSharp()));

                                },
                                child: Container(
                                  width: width,
                                  height: height,
                                  decoration: BoxDecoration(
                                      color:Colors.white,
                                      borderRadius: const BorderRadius.all(Radius.circular(13)),
                                      boxShadow: [
                                        BoxShadow(
                                          color: shading,
                                          spreadRadius: 2,
                                          blurRadius: 5,
                                          offset: const Offset(0, 5),
                                        )
                                      ]
                                  ),
                                ),
                              ),
                              Positioned(
                                  top: 25,
                                  left: 5,
                                  right: 5,
                                  bottom: 0,
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 60,
                                        width: 60,
                                        child: InkWell(
                                          onTap: (){
                                            Navigator.push(context,MaterialPageRoute(builder: (context) => CSharp()));

                                          },
                                          child: const Image(
                                              image: NetworkImage('https://www.netgen.co.za/wp-content/uploads/2022/03/C-image-for-Netgen-1024x1024.png')),
                                        ),
                                      ),
                                      const SizedBox(height: 17,),
                                      const Text('C#', style: TextStyle( fontWeight: FontWeight.w600),)
                                    ],
                                  )
                              )
                            ],),

                        ],
                      ),

                    ],
                  ),
                ),
            
              ],
            )
          ],
        ),
      ),
    );
  }
}
