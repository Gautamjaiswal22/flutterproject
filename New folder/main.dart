// ignore_for_file: body_might_complete_normally_nullable

import "dart:io";

void main() {
  //-----------------------------------
  // List<String> searchTerms = [
  //   "Apple",
  //   "Banana",
  //   "Mango",
  //   "Pear",
  //   "Watermelons",
  //   "Blueberries",
  //   "Pineapples",
  //   "Strawberries"
  // ];
  // print(searchTerms.runtimeType);

  // //----------------------------------
  // //print("Enter the name of the file");
  // //var fileName = stdin.readLineSync();
  final lines = File("firstname.csv").readAsLinesSync();
  // //final lines = File(fileName).readAsLinesSync();
  // //lines.removeAt(0);
  // //print(lines.runtimeType);
  // //print(lines[0][6]);
  // //final name = lines[1].split(",");
  // //print(name[0]);
  // //print(name.runtimeType);
  int count = 0;

  var ls = new List.filled(50, "a");
  //ls.add(50);
  //ls[1] = "gautam";
  //print(ls);

  for (var line in lines) {
    final values = line.split(",");
    // print(line);
    //print(values.runtimeType);

    //print(values[0]);
    //print(values[0].runtimeType);
    ls[count] = values[0];
    if (count == 10) {
      break;
    }
    count = count + 1;
    //   //------------------------------list creation

    //   //------------------------
    //   //print(values);
    //   //   var patient = values[1];
    //   //   print(patient);
    //   //   print(searchTerms);
    //   //   List<String> medicine = values;
    //   //   print(medicine);
  }
  // //print(ls);
  // //print(values.runtimeType);

//-----------------------function

  List<String>? newfun() {
    final lines = File("firstname.csv").readAsLinesSync();
    //lines.removeAt(0);
    var ls = new List.filled(50, "a");
    int count = 0;
    for (var line in lines) {
      final values = line.split(",");
      ls[count] = values[0];
      if (count == 10) {
        break;
      }
      count++;
    }
    return ls;
  }

  print("GAUTAM...................................");
  print(newfun());
  List<String>? a = newfun();
  //print(a.runtimeType);
  print(ls);
  print("Jay Mata Di");
  print(a);
}
