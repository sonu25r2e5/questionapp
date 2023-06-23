import 'package:flutter/material.dart';
import 'package:studentapp/podomora%20app/pwidgets/widget.dart';
import 'package:studentapp/podomora%20app/timeroptions.dart';
import '../podomora app/putils.dart';

class PodomoraApp extends StatelessWidget {
  const PodomoraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          'PromodoTimer',
          style: textStyle(25, Colors.white, FontWeight.w700),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.refresh,
              color: Colors.white,
            ),
            iconSize: 40,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              const SizedBox(
                height: 12,
              ),
              const TimerCard(),
              const SizedBox(
                height: 40,
              ),
              TimerOptions(
                
              ),
            ],
          ),
        ),
      ),
    );
  }
}
