import 'dart:convert';
import 'dart:developer';

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

String codeCreator({required String value, String inApp = ''}) {
  List fillData = json.decode(value);
  List data = fillData[0];
  List listOfTextures = fillData[1];

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

  if (data[0]['data'] != null && data[0]['data'].length > 0) {
    fisrtStrCodeValues +=
        '\nlet ${data[0]['data'].reduce((a, b) => a + ', ' + b)};';
  }

  /* Create Textures */
  if (listOfTextures.isNotEmpty) {
    fisrtStrCodeValues += listOfTextures.fold('', (a, b) {
      return '''$a
      let ${b['name']} = {}
      ${b['name']}.a = new Image()
      try {
        ${b['name']}.a.onload = function () {
          ${b['name']}.swidth = this.width
          ${b['name']}.sheight = this.height
        }
        ${b['name']}.a.src = '${b['data']}'
        ${b['name']}.sx = 0
        ${b['name']}.sy = 0
      } catch (e) {
        alert('Image not found 0(')
      };
      ''';
    });
  }

  data = data[1];

  /* Create main Code */

  var createdCode = 'element.innerHTML=`<h1>Made by Gafum</h1>`';

  if (data.isEmpty) {
    return 'Made by Gafum';
  }

  /* Work with function(clicks) */
  String fisrtStrCode = '';

  List listOfTaps = [];
  List listOfMoveTaps = [];
  List listOfEndOfTaps = [];

  /* Check for the functions in every piece */
  for (var items in data) {
    for (var element in items) {
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

  /* Add other elements */
  createdCode = data.fold(fisrtStrCode, (String a, b) {
    String onePiece = b.fold('', (prev, c) {
      String thisStrb =
          c['id'].startsWith('AMain') || c['id'].startsWith('CONTI')
              ? ListOfElements[int.parse(c['id'].substring(6))]
                  ['secondArgument'][int.parse(c['id'][5])]['code']
              : stringB(ListOfElements[int.parse(c['id'])], c['parameter']);
      return '$prev\n$thisStrb';
    });
    return '$a\n$onePiece';
  });
  log(htmlCode
      .replaceFirst('HereMustBeCodeWithVariables====>', fisrtStrCodeValues)
      .replaceFirst('HereMustBeMainCode====>', createdCode));
  return htmlCode
      .replaceFirst('HereMustBeCodeWithVariables====>', fisrtStrCodeValues)
      .replaceFirst('HereMustBeMainCode====>', createdCode);
} // create code