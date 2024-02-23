

// import 'package:firebase_core/firebase_core.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';


import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';
import 'package:studentapp/dailyquizbuttom/restapi.dart';



class QuestionApp extends StatefulWidget {
  const QuestionApp({super.key, required this.student, required this.onClick});
  final StudentApp student;
  final void Function(String answer) onClick;

  @override
  State<QuestionApp> createState() => _QuestionAppState();
}

class _QuestionAppState extends State<QuestionApp> {
   late final List<bool> isCheckedList;
  int score = 0; 
  //checked answer
   
  



   @override
  void initState() {
    super.initState();
    isCheckedList = widget.student.answer.map((e) => false).toList();
  }

  @override
  Widget build(BuildContext context) {
    // Query dbRef = FirebaseDatabase.instance.ref().child('Students')
    //;
     void checkAnswer(context, index, String correctAnswer){
    String correctAnswer = widget.student.answer[index];
    if(correctAnswer == widget.student.answer[index]) {
      score = score + 5;

    }
    print(score);

   }

    return Column(
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ListTile(
          title: Text(widget.student.question),
        ),
        ListView.builder(
            shrinkWrap: true,
            
            itemCount: widget.student.answer.length,
            itemBuilder: (context, index) {
              final answer = widget.student.answer[index];
              final correctAnswer = widget.student.correct_answer;
              // final correct_answer = widget.student.
              final isChecked = isCheckedList[index];
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: Card(
                  color: isChecked ? Colors.blue : null,
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                   // child: 
                   child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                     child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                       children: [
                         Text(answer),
                        
                        Checkbox(value: isChecked, onChanged: (bool? value){
                          if(value == null){
                            return;
                          }
                          isCheckedList.clear();
                          isCheckedList.addAll(widget.student.answer.map((e) => false));
                            isCheckedList[index] = value;
                            if(value){
                              widget.onClick(answer);
                            }
                            checkAnswer(context, index, correctAnswer);
                          setState(() {

                          });
                        },),
                       ],
                     ),
                   ),

                  ),
                ),
              );
            })
      ],
    );
  }
}
