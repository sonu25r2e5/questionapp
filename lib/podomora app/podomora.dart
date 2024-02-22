import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studentapp/podomora%20app/pwidgets/progress.dart';
import 'package:studentapp/podomora%20app/pwidgets/timecontroller.dart';
import 'package:studentapp/podomora%20app/pwidgets/timer_card.dart';
import 'package:studentapp/podomora%20app/pwidgets/timerservice.dart';
import 'package:studentapp/podomora%20app/timeroptions.dart';
import '../podomora app/putils.dart';

class PodomoraApp extends StatelessWidget {
  const PodomoraApp({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TimerService>(context);
    return Scaffold(
      // backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: renderColor(provider.currentState),
        title: Text(
          'Clock Timer',
          style: textStyle(20, Colors.white, FontWeight.w700),
        ),
        actions: [
          IconButton(
            onPressed: () =>
                Provider.of<TimerService>(context, listen: false).reset(),
            icon: const Icon(
              Icons.refresh,
              color: Colors.white,
            ),
            iconSize: 26,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: const Column(
            children: [
              SizedBox(
                height: 12,
              ),
              TimerCard(),
              SizedBox(
                height: 40,
              ),
              TimerOptions(),
              SizedBox(
                height: 90,
              ),
              TimeController(),
              SizedBox(
                height: 60,
              ),
              ProgressWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
