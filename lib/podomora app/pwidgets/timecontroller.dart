import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studentapp/podomora%20app/pwidgets/timerservice.dart';

class TimeController extends StatefulWidget {
  const TimeController({super.key});

  @override
  State<TimeController> createState() => _TimeControllerState();
}

class _TimeControllerState extends State<TimeController> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TimerService>(context);
    return Container(
      width: 100,
      height: 100,
      decoration: const BoxDecoration(
        color: Colors.pink,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: IconButton(
          onPressed: () {
            provider.timerPlaying
                ? Provider.of<TimerService>(context, listen: false).pause()
                : Provider.of<TimerService>(context, listen: false).start();
          },
          iconSize: 60,
          icon: provider.timerPlaying
              ? const Icon(Icons.pause)
              : const Icon(Icons.play_arrow),
        ),
      ),
    );
  }
}
