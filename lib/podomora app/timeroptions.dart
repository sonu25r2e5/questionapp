import 'package:flutter/material.dart';
import 'package:studentapp/podomora%20app/putils.dart';

class TimerOptions extends StatelessWidget {
  double selectedTime = 1500;

  TimerOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: selectableTimes.map((time) {
          return Container(
            margin: const EdgeInsets.only(left: 10),
            width: 70,
            height: 50,
            decoration: int.parse(time) == selectedTime
                ? BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      width: 3,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  )
                : BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    border: Border.all(
                      width: 3,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
            child: Center(
              child: Text(
                (int.parse(time) ~/ 60).toString(),
                style: textStyle(
                  25,
                  int.parse(time) == selectedTime ? Colors.red : Colors.white,
                  FontWeight.w700,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

/*
500 -> 500 /60 
*/