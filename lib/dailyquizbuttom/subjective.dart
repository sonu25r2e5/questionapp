import 'package:flutter/material.dart';
// import 'package:studentapp/dailyquizbuttom/animation.dart';
// import 'package:studentapp/dailyquizbuttom/subjclass.dart';

class Subjective extends StatefulWidget {
  const Subjective({super.key});

  @override
  State<Subjective> createState() => _SubjectiveState();
}

class _SubjectiveState extends State<Subjective> {

  TextEditingController _searchController = TextEditingController();

  List <String> _allSubjects = [

    'engineering Economics',
    'dBMs',
    'artifical Intelligence',
    'mathematics',
    'geography',
    'c++',
    'embeeded System',
    'oOAD',
  ];

List<String> _displaySubjects = [];
  // bool isSearchBarVisible = false;
bool isSearchBarVisible = false;

void toggleSearchBarVisibility(){
  _searchController.clear();
  // isSearchBarVisible 
  _displaySubjects = _allSubjects;
  isSearchBarVisible = !isSearchBarVisible;
  setState(() {
    
  });
}


 void _updateDisplayedSubjects(String value) {
  _displaySubjects = _allSubjects.where((element) => element.toLowerCase().contains(value.toLowerCase())).toList();
  setState(() {
    
  });
 }

  Widget searchBaraction() {

  return AnimatedContainer(
    duration: const Duration(
      milliseconds: 300,
    ),
  child:  TextField(
    controller: _searchController,
    onChanged: (value){
      _updateDisplayedSubjects(value);
    },
    decoration: const InputDecoration(
  hintText: 'Search Subject....',
  border: InputBorder.none,
    ),
  ),
  );
}

Widget listDetailView() {
  return    Padding(
    padding: const EdgeInsets.all(8.0),
    child: ListView.builder(
                  itemCount: _displaySubjects.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(_displaySubjects[index]),
                      ),
                    );
                  }),
  );
          
}
@override
  void initState() {
    super.initState();
    _displaySubjects= _allSubjects;
  }

   
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 233, 30, 223),

        title:  !isSearchBarVisible ?  const Text('Subject') : searchBaraction()  ,
     
  
        actions: [
          IconButton(
            onPressed: () {
                toggleSearchBarVisibility();
           
            },
            icon:  Icon(isSearchBarVisible ?   Icons.close : Icons.search),
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/book2.jpg'),
                // fit: BoxFit.cover,
              ),
            ),
          ),
          listDetailView(),
       
       
        ],
      ),
    );
    
  }




}
