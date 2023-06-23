import 'package:flutter/material.dart';
import 'package:studentapp/podomora%20app/putils.dart';

class TimerCard extends StatelessWidget {
  const TimerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Focus',
          style: textStyle(
            35,
            Colors.white,
            FontWeight.w700,
            FontStyle.italic,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 3.2,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 4,
                    blurRadius: 1,
                    offset: const Offset(
                      0,
                      1,
                    ),
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  '12',
                  style: textStyle(70, Colors.red, FontWeight.w700),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              ":",
              style: textStyle(60, Colors.red, FontWeight.bold),
            ),
            const SizedBox(
              width: 10,
            ),
            Container(
              width: MediaQuery.of(context).size.width / 3.2,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 4,
                    blurRadius: 1,
                    offset: const Offset(
                      0,
                      1,
                    ),
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  '0',
                  style: textStyle(70, Colors.red, FontWeight.w700),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
