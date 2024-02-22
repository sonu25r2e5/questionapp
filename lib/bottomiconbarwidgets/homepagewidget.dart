import 'dart:ui';

import 'package:flutter/material.dart';
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
        // decoration: const BoxDecoration(
        //   // color: Colors.amberAccent,
        //   gradient: LinearGradient(
        //     colors: [
        //       Colors.grey,
        //       Colors.blue,
        //     ],
        //   ),
        // ),
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
                      height: screenHeight * 0.25,
                      width: screenWidth * 0.9,
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // SizedBox(
                          //   height: screenHeight * 0.1,
                          // ),
                          Column(
                            children: [
                              Text(
                                subette[0].subject,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: screenHeight * 0.03,
                              ),
                              const Text(
                                'Testss',
                                style: TextStyle(
                                  fontSize: 60,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: screenHeight * 0.02,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (BuildContext) =>
                                          const Subjective(),
                                    ),
                                  );
                                },
                                child: const Text('Subjective'),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          const QuizLayout(),
                                    ),
                                  );
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
                Container(
                  height: screenHeight * 0.06,
                ),
                BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 0.2,
                    sigmaY: 0.1,
                  ),
                  child: Container(
                    height: screenHeight * 0.35,
                    width: screenWidth * 0.9,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.white.withOpacity(.9),
                          Colors.white24.withOpacity(0.6),
                        ],
                      ),
                    ),
                    child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      // scrollDirection: Axis.vertical,
                      itemCount: 2,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,

                        mainAxisExtent: screenWidth * 0.6,
                        crossAxisSpacing: 22,
                        childAspectRatio: 1 / 3,

                        // crossAxisSpacing: 200,
                      ),
                      itemBuilder: (BuildContext context, index) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              height: screenHeight * .1,
                              width: screenWidth * 0.5,
                              child: CircleAvatar(
                                child: Image(
                                  image: AssetImage(
                                    subette[index + 1].imag,
                                  ),
                                ),
                              ),
                            ),
                            // const Divider(),
                            Text(
                              subette[index + 1].subject,
                              style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              subette[index + 1].description,
                              style: const TextStyle(
                                fontSize: 10.9,
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text('Learn more'),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
