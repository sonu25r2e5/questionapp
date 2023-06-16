import 'package:flutter/material.dart';
import 'package:studentapp/screeens/note.dart';
import 'package:studentapp/timer/timer.dart';
import 'package:studentapp/screeens/planner.dart';

class Part1 extends StatelessWidget {
  const Part1({super.key});

  @override
  Widget build(BuildContext context) {
    final List add = [
      IconButton(
        icon: const Icon(
          Icons.note,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (ctx) => const Notepage(),
            ),
          );
        },
      ),
      IconButton(
        icon: const Icon(Icons.task_rounded),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (ctx) => const Planner(),
            ),
          );
        },
      ),
      IconButton(
        icon: const Icon(
          Icons.call,
          color: Colors.redAccent,
        ),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (ctx) => ImageToPdfList(),
            ),
          );
        },
      ),
      IconButton(
        icon: const Icon(Icons.sports_gymnastics),
        onPressed: () {},
      ),
      IconButton(
        icon: const Icon(Icons.person),
        onPressed: () {},
      ),
      IconButton(
        icon: const Icon(Icons.access_alarm),
        onPressed: () {},
      ),
    ];
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: CustomPaint(
        painter: RPSCustomPainter(),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.12,
          width: MediaQuery.of(context).size.width * 1,
          child: Column(
            children: [
              Expanded(
                child: GridView.builder(
                    itemCount: add.length,
                    scrollDirection: Axis.horizontal,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 175,
                      crossAxisCount: 1,
                      mainAxisExtent: 120,
                    ),
                    itemBuilder: (ctx, index) {
                      return Padding(
                        padding: const EdgeInsets.all(19.0),
                        child: Card(
                          child: add[index],
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    Path path0 = Path();
    path0.moveTo(size.width * 0.0012500, size.height * 0.9750000);
    path0.lineTo(size.width * 0.0025000, size.height * 0.0716500);
    path0.quadraticBezierTo(size.width * 0.1772500, size.height * 0.0875500,
        size.width * 0.2432875, size.height * 0.0718500);
    path0.cubicTo(
        size.width * 0.2964375,
        size.height * 0.0126500,
        size.width * 0.2967875,
        size.height * 0.2484500,
        size.width * 0.3129375,
        size.height * 0.2917500);
    path0.cubicTo(
        size.width * 0.3391125,
        size.height * 1.1860500,
        size.width * 0.6301000,
        size.height * 1.1811000,
        size.width * 0.7113375,
        size.height * 0.1414500);
    path0.quadraticBezierTo(size.width * 0.7273625, size.height * 0.0793500,
        size.width * 0.9987625, size.height * 0.1098000);
    path0.lineTo(size.width * 0.9975000, size.height * 0.9750000);
    path0.lineTo(size.width * 0.0016625, size.height * 0.9799000);

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
