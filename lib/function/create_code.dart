import 'dart:convert';

import '../const/html_code.dart';
import '../const/list_of_elements.dart';

String stringB(Map<String, dynamic> element, changer) {
  String result = element['code'].toString();
  if (element['standartParameter'] == null || element['listChengers'] == null) {
    return result;
  }
  for (var i = 0; i < element['listChengers'].length; i++) {
    var realChenge = '';
    if (changer[i] == null) {
      changer[i] = element['standartParameter'][i];
    }
    realChenge = changer[i].fold('', (a, b) => a + b.toString());
    result = result.replaceAll(element['listChengers'][i], realChenge);
  }
  return result;
}

String codeCreator(String value, [String inApp = '']) {
  List data = json.decode(value);
  var listOfData = data[0]['data'];

  /* Work with data */
  var fisrtStrCodeValues = 'document.title = "${data[0]['name']}";';
  if (inApp.isNotEmpty) {
    fisrtStrCodeValues += '''
\n
let StoredData = $inApp
''';
  } else {
    fisrtStrCodeValues += '''
\n
let StoredData = {}
''';
  }

  if (listOfData.length > 0) {
    fisrtStrCodeValues += 'let ${listOfData.reduce((a, b) => a + ', ' + b)};';
  }

  data.removeAt(0);
  /* Create main Code */

  var createdCode = 'element.innerHTML=`<h1>Made by Gafum</h1>`';

  if (data.isEmpty) {
    return 'Made by Gafum';
  }

  List deletedata = [];
  for (var item in data) {
    if (item['id'] == '29') {
      fisrtStrCodeValues +=
          '\n${stringB(ListOfElements[int.parse(item['id'])], item['parameter'])}';
      deletedata.add(item);
    }
  }
  data.removeWhere((element) => deletedata.contains(element));

  /* Work with function(clicks) */
  String fisrtStrCode = '';

  List listOfTaps = [];
  List listOfMoveTaps = [];
  List listOfEndOfTaps = [];

  for (var element in data) {
    if (element['id'] == '13' || element['id'] == '15') {
      // Click =>
      listOfTaps.add(element);
    } else if (element['id'] == '24') {
      // MouseMove =>
      listOfMoveTaps.add(element);
    } else if (element['id'] == '25') {
      // EndOfTheTouching (Mouse up) =>
      listOfEndOfTaps.add(element);
    }
  }

  if (listOfTaps.isNotEmpty) {
    fisrtStrCode += '''\ncanva.onclick = (event)=> {
  ${listOfTaps.fold('', (a, b) => '$a\n${b['parameter'][1][0]}(event)')}
};''';
  }
  if (listOfMoveTaps.isNotEmpty) {
    fisrtStrCode += '''\n
document.addEventListener("mousemove", MouseNowIsMove);
document.addEventListener("touchmove", MouseNowIsMove);
function MouseNowIsMove (event) {
  ${listOfMoveTaps.fold('', (a, b) => '$a\n${b['parameter'][1][0]}(event)')}
};''';
  }
  if (listOfEndOfTaps.isNotEmpty) {
    fisrtStrCode += '''\n
document.addEventListener("mouseup", EndOfTheTouching);
function EndOfTheTouching(event) {
  ${listOfEndOfTaps.fold('', (a, b) => '$a\n${b['parameter'][1][0]}(event)')}
};''';
  }

  createdCode = data.fold(fisrtStrCode, (String a, b) {
    var thisStrb = b['id'].startsWith('AMain') || b['id'].startsWith('CONTI')
        ? ListOfElements[int.parse(b['id'].substring(6))]['secondArgument']
            [int.parse(b['id'][5])]['code']
        : stringB(ListOfElements[int.parse(b['id'])], b['parameter']);
    return '$a\n$thisStrb';
  });

  return htmlCode
      .replaceFirst('HereMustBeCodeWithVariables====>', fisrtStrCodeValues)
      .replaceFirst('HereMustBeMainCode====>', createdCode);
} // create code