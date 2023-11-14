import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:studentapp/bottomiconbarwidgets/course.dart';

class details extends StatelessWidget {
  const details({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<eee> subette = [
      eee("Hello Harry", "assert/image/descrioption",
          "you have completed \n 15 lesson to complete "),
      eee(
        "Leadership",
        "assets/images/seitign.png",
        "Find out who is leading the class and your combined scores",
      ),
      eee("Study tips", "assets/images/studentss.png",
          "find out the best tips that are our most trusted teachers are giving you this year"),
    ];
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        margin: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.1,
          left: 20,
          // bottom: MediaQuery.of(context).size.height * 0.,
          right: 20,
        ),
        height: MediaQuery.of(context).size.height * 12,
        width: MediaQuery.of(context).size.width * 0.9,
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
          padding: const EdgeInsets.all(20.0),
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
                    padding: const EdgeInsets.all(20.0),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.2,
                      width: MediaQuery.of(context).size.height * 0.9,
                      child: Row(
                        children: [
                          const SizedBox(
                            height: 99,
                            width: 99,
                            child: Image(
                              image: AssetImage(
                                'assets/images/hero.png',
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            children: [
                              Text(
                                subette[0].subject,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                width: 150,
                                child: Text(subette[0].description),
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                child: const Text('Choose'),
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                child: const Text('Start'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 32,
                ),
                BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 0.2,
                    sigmaY: 0.1,
                  ),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.4,
                    width: MediaQuery.of(context).size.width * 0.9,
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

                        mainAxisExtent:
                            MediaQuery.of(context).size.height * 0.6,
                        crossAxisSpacing: 22,
                        childAspectRatio: 1 / 3,

                        // crossAxisSpacing: 200,
                      ),
                      itemBuilder: (BuildContext context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            children: [
                              // ListTile(
                              //   title: Text(subette[index + 1].subject),
                              //   // subtitle: Text(subette[index + 1].description),
                              //   leading: const Image(
                              //     image: AssetImage('assets/Icons/student.png'),
                              //   ),
                              // ),
                              // const SizedBox(
                              //   height: 10,
                              // ),
                              SizedBox(
                                height: 100,
                                width: 150,
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
                              Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Text(
                                  subette[index + 1].description,
                                  style: const TextStyle(
                                    fontSize: 13.9,
                                  ),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                child: const Text('Learn more'),
                              ),
                            ],
                          ),
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
