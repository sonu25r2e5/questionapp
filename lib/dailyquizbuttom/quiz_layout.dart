import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:studentapp/dailyquizbuttom/controller/daily_controller.dart';
import 'package:studentapp/dailyquizbuttom/quizequestion.dart';
import 'package:studentapp/dailyquizbuttom/submitpage.dart';
// import 'package:studentapp/dailyquizbuttom/restapi.dart';
import 'package:studentapp/homeui/homeui.dart';
// import 'package:http/http.dart' as http;

class QuizLayout extends StatelessWidget {
  const QuizLayout({super.key});

 
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: GetBuilder(
        init: DailyController(),
        global: false,
        builder: (controller) {
          return SafeArea(
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
                controller.obx(
                  onLoading: LottieBuilder.asset(
                              'assets/Icons/loading.json',
                              height: screenHeight * 0.74,
                            ),
          
                (state) {
                  if(state == null){
                    return const SizedBox.shrink();
                  }
                  final students = state.questions;
                    final currentQuestion = state.currentQuestion;
                          final total = students.length;
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
                                               (currentQuestion + 1).toString(),
                                               textAlign: TextAlign.center,
                                            ),
                                  
                                      Expanded(
                                          child: QuestionApp(
                                        student: students[currentQuestion],
                                        checkedAnswer: state.currentChoosenAnswerIndex,
                                        onClick: (answer) {
                                          controller.chooseAnswer(answer);
                                        },
                                      )),
                                  
                                      if (currentQuestion < total - 1) 
                                        ElevatedButton(
                                          onPressed: () {
                                            if(!state.hasChoosenCurrentAnswer){
                                              Fluttertoast.showToast(msg: 'Please select answer');
                                              return;
                                            }
                                            controller.nextQuestion();
                                          },
                                          child: const Text('Next'),
                                        )
                                      else
                                            ElevatedButton(onPressed: (){
                                              // print(state.score);
                                              // Get.to(const submit(),);
                                              Get.off(() =>  Submit(score: state.score,),);
                                              // Navigator.of(context).pushReplacement
                                              // (MaterialPageRoute(builder: (BuildContext context){
                                              //   return submit();
                                              // }));

                                            }, child: const Text('Submit'),),
                                  
                                    ],
                                  ),
                                ),
                              ),
                            );
                  }
                ),
                    
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
                        _showMyDialog(context);
                      },
                      icon: const Icon(Icons.close),
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      ),
    );
  }

  Future<void> _showMyDialog(BuildContext context) async {
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
