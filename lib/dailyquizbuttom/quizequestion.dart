

// import 'package:firebase_core/firebase_core.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';


import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';
import 'package:studentapp/dailyquizbuttom/restapi.dart';



class QuestionApp extends StatelessWidget {
  const QuestionApp({super.key, required this.student,
  this.checkedAnswer = -1,
   required this.onClick});
  final StudentApp student;
  final int checkedAnswer;
  final void Function(String answer) onClick;

  @override
  Widget build(BuildContext context) {
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ListTile(
          title: Text(student.question),
        ),
        Expanded(
          child: ListView.builder(
              shrinkWrap: true,
              
              itemCount: student.answer.length,
              itemBuilder: (context, index) {
                final answer = student.answer[index];
                final isChecked = checkedAnswer == index;
                return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Card(
                    color: isChecked ? Colors.blue : null,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                         children: [
                           Text(answer),
                          
                          Checkbox(value: isChecked, onChanged: (bool? value){
                            if(value == null){
                              return;
                            }
                           onClick(answer);
                          },),
                         ],
                       ),
                      ),
                    ),
                  ),
                );
              }),
        )
      ],
    );
  }
}
