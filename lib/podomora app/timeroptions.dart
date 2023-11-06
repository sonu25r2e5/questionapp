import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studentapp/podomora%20app/putils.dart';
import 'package:studentapp/podomora%20app/pwidgets/timerservice.dart';

class TimerOptions extends StatelessWidget {
  // double selectedTime = 1500;

  const TimerOptions({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TimerService>(context);
    return SingleChildScrollView(
      controller: ScrollController(initialScrollOffset: 240),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: selectableTimes.map((time) {
          return InkWell(
            onTap: () => provider.selectTime(double.parse(time)),
            child: Center(
              child: Container(
                margin: const EdgeInsets.only(left: 10),
                width: 70,
                height: 50,
                decoration: int.parse(time) == provider.selectedTime
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
                      int.parse(time) == provider.selectedTime
                          ? renderColor(provider.currentState)
                          : Colors.black,
                      FontWeight.w700,
                    ),
                  ),
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