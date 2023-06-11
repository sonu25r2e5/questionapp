import 'package:flutter/material.dart';
import 'package:studentapp/widget/probability/class2.dart';
import 'package:studentapp/widget/probability/main2.dart';
import 'class.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
    required String title,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List add = [
    const Icon(
      Icons.add,
      color: Colors.redAccent,
    ),
    const Icon(Icons.abc),
    const Icon(Icons.delete),
    const Icon(Icons.photo),
    const Icon(Icons.access_alarm),
  ];
  final List<Subject> _items = [
    Subject('Probability & Statistical III / I', 'assets/photos/tajmahal.jpg',
        'lib/widget/main2.dart',
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
    Subject('COA', 'assets/photos/ssd.jpg', 'hi', questions: [
      Question(2076, '2080', 'assets/subject/coa/2080.pdf'),
      Question(2076, '2079', 'assets/subject/coa/2079.pdf'),
      Question(2076, '2078 Bhadra', 'assets/subject/coa/2078.pdf'),
      Question(2076, '2078 kartik', 'assets/subject/coa/2078 Kartik.pdf'),
      Question(2076, '2076 Chaitra', 'assets/subject/coa/2076 Chaitra.pdf'),
      Question(2076, '2076 Ashwin', 'assets/subject/coa/2076 Ashwin.pdf'),
    ]),
    Subject(
      'Computer Graphics',
      'assets/photos/tajmahal.jpg',
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
      'assets/photos/tajmahal.jpg',
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
      'assets/photos/tajmahal.jpg',
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
    Subject('Software Engineering', 'assets/photos/tajmahal.jpg', 'ii',
        questions: [
          Question(2076, '2080 Chaitra', 'assets/subject/se/se2080.pdf'),
          Question(2076, '2079 Chaitra', 'assets/subject/se/se2079.pdf'),
          Question(2076, '2078 Bhadra', 'assets/subject/se/se2078Bhadra.pdf'),
          Question(2076, '2076 Aswin', 'assets/subject/se/se2076Aswin.pdf'),
          Question(2076, '2076 Chaitra', 'assets/subject/se/se2076.pdf'),
        ]),
    Subject(
      'Communication English',
      'assets/photos/tajmahal.jpg',
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
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            top: 10,
            child: Container(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 7, 119, 255),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(90),
                    bottomRight: Radius.circular(90)),
              ),
              height: MediaQuery.of(context).size.height * 0.15,
              width: MediaQuery.of(context).size.width * 1,
              child: const Center(
                child: Text(
                  '5th semester',
                  style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.18,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(20),
              ),
              height: MediaQuery.of(context).size.height * 0.7,
              width: MediaQuery.of(context).size.width * 1,
              child: GridView.builder(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  scrollDirection: Axis.vertical,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 21,
                      mainAxisSpacing: 2,
                      crossAxisCount: 2),
                  itemCount: _items.length,
                  itemBuilder: (ctx, index) {
                    return Card(
                      child: GridTile(
                        footer: Container(
                          height: 20,
                          decoration: const BoxDecoration(
                            color: Colors.blue,
                          ),
                          child: Text(_items[index].name),
                        ),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (ctx) =>
                                    Probability(subject: _items[index]),
                              ),
                            );
                          },
                          child: Image.asset(_items[index].url),
                        ),
                      ),
                    );
                  }),
            ),
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.01,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.09,
              width: MediaQuery.of(context).size.width * 1,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 7, 119, 255),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(90),
                    topRight: Radius.circular(90)),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.red.withOpacity(0.6),
                    ),
                    width: 300,
                    child: GridView.builder(
                        itemCount: 5,
                        scrollDirection: Axis.horizontal,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisSpacing: 50,
                          mainAxisSpacing: 25,
                          crossAxisCount: 1,
                        ),
                        itemBuilder: (ctx, index) {
                          return Card(
                            child: add[index],
                          );
                        }),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
