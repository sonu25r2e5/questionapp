import 'package:studentapp/widget/probability/class2.dart';

class Subject {
  final String name;
  final String url;
  final String widget;
  final List<Question>? questions;
  Subject(this.name, this.url, this.widget, {this.questions});
}
