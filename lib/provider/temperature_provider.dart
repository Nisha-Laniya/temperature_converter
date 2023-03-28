import 'package:flutter/cupertino.dart';

List<String> list = <String>['Celsius', 'Fahrenheit', 'Kelvin'];

class TemperatureProvider with ChangeNotifier {
  String selectedValue = list.first;
  TextEditingController textController = TextEditingController();
  String output = '0.0';
  int? input;
  int tabValue = 0;

  void converter() {
    input = int.parse(textController.text);
    if (selectedValue == 'Celsius' && tabValue == 0) {
      output = textController.text;
    } else if (selectedValue == 'Celsius' && tabValue == 1) {
      output = ((input! * 9 / 5) + 32).toStringAsFixed(2);
    } else if (selectedValue == 'Celsius' && tabValue == 2) {
      output = (input! + 273.15).toStringAsFixed(2);
    } else if (selectedValue == 'Fahrenheit' && tabValue == 0) {
      output = ((input! - 32) * 5 / 9).toStringAsFixed(2);
    } else if (selectedValue == 'Fahrenheit' && tabValue == 1) {
      output = textController.text;
    } else if (selectedValue == 'Fahrenheit' && tabValue == 2) {
      output = ((input! - 32) * 5 / 9 + 273.15).toStringAsFixed(2);
    } else if (selectedValue == 'Kelvin' && tabValue == 0) {
      output = (input! - 273.15).toStringAsFixed(2);
    } else if (selectedValue == 'Kelvin' && tabValue == 1) {
      output = ((input! - 273.15) * 9 / 5 + 32).toStringAsFixed(2);
    } else if (selectedValue == "Kelvin" && tabValue == 2) {
      output = textController.text;
    }
    notifyListeners();
  }
}