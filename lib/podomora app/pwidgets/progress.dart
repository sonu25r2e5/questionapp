import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studentapp/podomora%20app/putils.dart';
import 'package:studentapp/podomora%20app/pwidgets/timerservice.dart';

class ProgressWidget extends StatelessWidget {
  const ProgressWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TimerService>(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "${provider.rounds}/4",
              style: textStyle(
                30,
                Colors.black,
                FontWeight.bold,
              ),
            ),
            Text(
              "${provider.goals}//12",
              style: textStyle(
                30,
                Colors.black,
                FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "Round",
              style: textStyle(
                20,
                Colors.black,
                FontWeight.bold,
              ),
            ),
            Text(
              "Goal",
              style: textStyle(
                20,
                Colors.black,
                FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
