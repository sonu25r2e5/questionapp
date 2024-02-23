import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';
import 'package:studentapp/dailyquizbuttom/quizequestion.dart';
import 'package:studentapp/dailyquizbuttom/restapi.dart';
// import 'package:studentapp/dailyquizbuttom/restapi.dart';
import 'package:studentapp/homeui/homeui.dart';
import 'package:studentapp/services/my_database.dart';
// import 'package:http/http.dart' as http;

class QuizLayout extends StatefulWidget {
  const QuizLayout({super.key});

  @override
  State<QuizLayout> createState() => _QuizLayoutState();
}

class _QuizLayoutState extends State<QuizLayout> {
  // int question = 10;
  // double countdown = 10;

  int totalSeconds = 90;
  int secondsRemaining = 90;
  double progressFraction = 0.0;
  int percentage = 0;
  bool? isChecked = true;
  Timer? timer;
   final answersList = <String?>[];


 

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/book2.jpg'),
                  // fit: BoxFit.cover,
                ),
              ),
            ),
            StreamBuilder<QuerySnapshot<StudentApp>>(
                stream: MyDatabase.instance.questionsStream,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return LottieBuilder.asset(
                      'assets/Icons/loading.json',
                      height: screenHeight * 0.74,
                    );
                  }
                  final students = snapshot.data!.docs;
                  var current = 0;
                  final total = students.length;
                  answersList.addAll(List.generate(total, (index) => null));

                  return StatefulBuilder(builder: (context, setQuestion) {
                    return Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                        height: screenHeight * 0.9,
                        // height: 244,

                        width: screenWidth * 1,
                        decoration: BoxDecoration(
                          color: Colors.white24.withOpacity(0.3),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            children: [
                              
                              Text(
                                       (current + 1).toString(),
                                       textAlign: TextAlign.center,
                                    ),

                              Expanded(
                                  child: QuestionApp(
                                student: students[current].data(),
                                onClick: (answer) {
                                  answersList[current] = answer;
                                },
                              )),

                              if (current < total - 1)
                                ElevatedButton(
                                  onPressed: () {
                                    if(answersList.elementAtOrNull(current) == null){
                                      Fluttertoast.showToast(msg: 'Please select answer');
                                      return;
                                    }
                                    setQuestion(() {
                                      current++;
                                    });

                                  if (current == total){
                                    // print(scrore);
                                  }


                                  },
                                  child: const Text('Next'),
                                ),
                            ],
                          ),
                        ),
                      ),
                    );
                  });
                }),
            Positioned(
              top: screenWidth * 0.049,
              right: screenWidth * 0.05,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: IconButton(
                  onPressed: () {
                    _showMyDialog();
                  },
                  icon: const Icon(Icons.close),
                ),
              ),
            ),
          ],
        ),
      ),
    );

    // Future<List<StudentApp>> getData() async {
    //   final response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));

    // }
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          // double screenWidth = MediaQuery.of(context).size.width;
          return AlertDialog(
            title: const Text('Accept'),
            // contentPadding: Text(data),
            content: const Text(
              'Do you want to Quit',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('No'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => const HomeUi(),
                    ),
                  );
                },
                child: const Text('yes'),
              ),
            ],
          );
        });
  }
}
