import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentapp/bottomiconbarwidgets/course.dart';
import 'package:studentapp/dailyquizbuttom/quiz_layout.dart';
import 'package:studentapp/dailyquizbuttom/subjective.dart';

class Details extends StatelessWidget {
  const Details({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    List<Eee> subette = [
      Eee("Hello Sonu", "assert/image/descrioption", "Daily Question"),
      Eee(
        "Leadership",
        "assets/images/seitign.png",
        "Find out who is leading the class and your combined scores",
      ),
      Eee("Study tips", "assets/images/studentss.png",
          "find out the best tips that are our most trusted teachers are giving you this year"),
    ];
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        margin: EdgeInsets.only(
          top: screenHeight * 0.15,
          left: 20,
          right: 20,
        ),
        height: screenHeight * 2,
        width: screenWidth * 0.9,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 0.8,
              sigmaY: 0.5,
            ),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.white.withOpacity(0.8),
                        Colors.white.withOpacity(.3),
                      ],
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: SizedBox(
                      height: screenHeight * 0.3,
                      width: screenWidth * 0.9,
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                        
                          Column(
                            children: [
                              Text(
                                subette[0].subject,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: screenHeight * 0.02,
                              ),
                              const Text(
                                'Tests',
                                style: TextStyle(
                                  fontSize: 90,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: screenHeight * 0.01,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                              
                                  Get.to( ()=> const Subjective());
                                },
                                child: const Text('Subjective'),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  // Navigator.pushReplacement(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //     builder: (BuildContext context) =>
                                  //         const QuizLayout(),
                                  //   ),
                                  // );
                                  Get.off(()=>const QuizLayout());
                                },
                                child: const Text('Daily'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}
