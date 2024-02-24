import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentapp/dailyquizbuttom/controller/daily_controller.dart';
import 'package:studentapp/dailyquizbuttom/quiz_layout.dart';
import 'package:studentapp/homeui/homeui.dart';
// import '';
class Submit extends StatelessWidget {

   const Submit({super.key, required this.score});
   final int score;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: GetBuilder(
        init: DailyController(),
        builder: (controller) {

          return  Container(
            height: MediaQuery.of(context).size.height*11,
            width: MediaQuery.of(context).size.width*1,
            decoration:  const BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/images/book2.jpg'),
              fit: BoxFit.cover,
              ),
            ),
            child:  Container(
              child: Column(
              children: [
                // Text('siss'),
              Container(
                  height: MediaQuery.of(context).size.height*0.3,
                  
                  ),
                  
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Colors.black45.withOpacity(0.2),
                      Colors.black26.withOpacity(0.2),
                    ])
                  ),
               width: MediaQuery.of(context).size.width*1,
                   height: MediaQuery.of(context).size.height*0.5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Your Score is',style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),),
                      // const SizedBox(height: ,),
                          
                       Text(
                  
                        score.toString(), 
                      
                       style: const TextStyle(
                        fontSize: 92,
                       ),
                       ),
                      const Text('Thank you for playing', style: TextStyle(
                        fontSize: 22,
                      ),),
               SizedBox(
                height: MediaQuery.of(context).size.height*0.1,
              ),
                       Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(onPressed: (){
                          Get.off(const QuizLayout());
                          }, child: const Text('play Again'),),
                          ElevatedButton(onPressed: (){
                              Get.off(
                              const HomeUi()
                            );
                          }, child: const Text('Close'),),
                        ],
                       ),
                    ],
                  ),
                ),
              ],
            ),),
          );
          
        
        },
      ),
    );
  }
}