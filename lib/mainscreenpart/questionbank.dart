import 'package:flutter/material.dart';

import '../class.dart';
import '../widget/probability/class2.dart';
import '../widget/probability/main2.dart';

class Part2 extends StatefulWidget {
  const Part2({super.key});

  @override
  State<Part2> createState() => _Part2State();
}

class _Part2State extends State<Part2> {
  final List<Subject> _items = [
    Subject('P & S II', 'assets/photos/book.gif', 'lib/widget/main2.dart',
        questions: [
          Question(2076, '2076 Chaitra', 'assets/yearwise/2076Chaitra.pdf'),
          Question(2076, '2076 Ashwin', 'assets/yearwise/2076Ashwin.pdf'),
          Question(2075, '2075 Chaitra', 'assets/yearwise/2075Chaitra.pdf'),
          Question(2075, '2075 Ashwin', 'assets/yearwise/2075Ashwin.pdf'),
          Question(2075, '2074 Chaitra', 'assets/yearwise/2074Chaitra.pdf'),
          Question(2075, '2073 Shrawan', 'assets/yearwise/2073Shrawan.pdf'),
          Question(2075, '2072 Kartik', 'assets/yearwise/2072Kartik.pdf'),
          Question(2075, '2072 Chaitra', 'assets/yearwise/2072Chaitra.pdf'),
        ]),
    Subject('COA', 'assets/photos/book.gif', 'hi', questions: [
      Question(2076, '2080', 'assets/subject/coa/2080.pdf'),
      Question(2076, '2079', 'assets/subject/coa/2079.pdf'),
      Question(2076, '2078 Bhadra', 'assets/subject/coa/2078.pdf'),
      Question(2076, '2078 kartik', 'assets/subject/coa/2078 Kartik.pdf'),
      Question(2076, '2076 Chaitra', 'assets/subject/coa/2076 Chaitra.pdf'),
      Question(2076, '2076 Ashwin', 'assets/subject/coa/2076 Ashwin.pdf'),
    ]),
    Subject(
      'Computer Graphics',
      'assets/photos/book.gif',
      'hi',
      questions: [
        Question(2076, '2080 Baishakh', 'assets/subject/cg/2080cg.pdf'),
        Question(2076, '2079 Kartik', 'assets/subject/cg/2079.pdf'),
        Question(2076, '2078 Kartik', 'assets/subject/cg/2078Kartik.pdf'),
        Question(2076, '2076 Ashwin', 'assets/subject/cg/2076Aswin.pdf'),
        Question(2076, '2076 Chaitra', 'assets/subject/cg/2076Chaitra.pdf'),
      ],
    ),
    Subject(
      'Data Communication',
      'assets/photos/book.gif',
      'ji',
      questions: [
        Question(2076, '2080', 'assets/subject/dc/dc2080.pdf'),
        Question(2076, '2078 Bhadra', 'assets/subject/dc/dc2078.pdf'),
        Question(2076, '2078 Kartik', 'assets/subject/dc/dc2078Kartiik.pdf'),
        Question(2076, '2076 Aswin', 'assets/subject/dc/dc2076Aswin.pdf'),
        Question(2076, '2076 Chaitra', 'assets/subject/dc/dc2076Chaitra.pdf'),
      ],
    ),
    Subject(
      'Instrumentaion II',
      'assets/photos/book.gif',
      'ki',
      questions: [
        Question(2076, '20780 Baishakh', 'assets/subject/inII/in2080.pdf'),
        Question(2076, '2079 Bhadra', 'assets/subject/inII/in2079.pdf'),
        Question(2076, '2078 Bhadra', 'assets/subject/inII/in2078.pdf'),
        Question(2076, '2076 Kartik', 'assets/subject/inII/in2078Kartik.pdf'),
        Question(2076, '2076 Ashwin', 'assets/subject/inII/in2076.pdf'),
        Question(2076, '2075 Chaitra', 'assets/subject/inII/in2075.pdf'),
      ],
    ),
    Subject('Software Engineering', 'assets/photos/book.gif', 'ii', questions: [
      Question(2076, '2080 Chaitra', 'assets/subject/se/se2080.pdf'),
      Question(2076, '2079 Chaitra', 'assets/subject/se/se2079.pdf'),
      Question(2076, '2078 Bhadra', 'assets/subject/se/se2078Bhadra.pdf'),
      Question(2076, '2076 Aswin', 'assets/subject/se/se2076Aswin.pdf'),
      Question(2076, '2076 Chaitra', 'assets/subject/se/se2076.pdf'),
    ]),
    Subject(
      'Communication English',
      'assets/photos/book.gif',
      'i',
      questions: [
        Question(2076, '2080 Baisahakh', 'assets/subject/ce/en2080.pdf'),
        Question(2076, '2079 Baisahakh', 'assets/subject/ce/en2079.pdf'),
        Question(2076, '2078 Kartik', 'assets/subject/ce/en2078kartik.pdf'),
        Question(2076, '2078 Bhadra', 'assets/subject/ce/en2078Bhadra.pdf'),
      ],
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          // color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(20),
        ),
        height: MediaQuery.of(context).size.height * 1,
        width: MediaQuery.of(context).size.width * 1,
        child: GridView.builder(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            scrollDirection: Axis.vertical,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 1, mainAxisSpacing: 2, crossAxisCount: 2),
            itemCount: _items.length,
            itemBuilder: (ctx, index) {
              return Card(
                child: GridTile(
                  footer: Container(
                    padding: const EdgeInsets.all(1),
                    height: 20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      // color: Theme.of(context).colorScheme.primary,
                    ),
                    child: Text(
                      _items[index].name,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (ctx) => Probability(subject: _items[index]),
                        ),
                      );
                    },
                    child: Image.asset(_items[index].url),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
