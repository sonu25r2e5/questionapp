import 'package:flutter/material.dart';
class Questionsubjective {

// Questionsubjective _searchController = Questionsubjective();
  // String subject;
  // // String list; 
  // Questionsubjective(this.subject);

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
bool get isSearchBarVisible => _searchController.text.isNotEmpty;

Questionsubjective(){
  _displaySubjects = _allSubjects;
}
void toggleSearchBarVisibility(){
  _searchController.clear();
  // isSearchBarVisible 
  _displaySubjects = _allSubjects;
}


 void _updateDisplayedSubjects(String value) {
  _displaySubjects = _allSubjects.where((element) => element.toLowerCase().contains(value.toLowerCase())).toList();
 }

  Widget searchBaraction() {

  return SizedBox(
    width: isSearchBarVisible ? 200 : 0,
    child: AnimatedContainer(
      duration: const Duration(
        milliseconds: 300,
      ),
    width: isSearchBarVisible ? 200.0 : 0,
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

}
