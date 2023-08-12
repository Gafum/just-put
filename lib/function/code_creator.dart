import 'dart:convert';
import 'dart:developer';

import '../const/html_code.dart';
import '../const/list_of_elements.dart';

String codeOfTheOneItem(Map<String, dynamic> element, changer) {
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

String findTaps(List list) {
  if (list.isEmpty) return "";
  // ignore: unused_local_variable
  String returnedCode = "";

  List listOfTaps = [];
  List listOfMoveTaps = [];
  List listOfEndOfTaps = [];
  List listOfStartOfTaps = [];

  /* Check for the functions in every piece */
  for (var element in list) {
    if (element['id'] == '12' || element['id'] == '14') {
      // Click =>
      listOfTaps.add(element);
    } else if (element['id'] == '25') {
      // MouseMove =>
      listOfMoveTaps.add(element);
    } else if (element['id'] == '26') {
      // EndOfTheTouching (Mouse up) =>
      listOfEndOfTaps.add(element);
    } else if (element['id'] == '86') {
      // StartOfTheTouching (Mouse down) =>
      listOfStartOfTaps.add(element);
    }
  }

  if (listOfTaps.isNotEmpty) {
    returnedCode += '''\ncanva.onclick = (event)=> {
  ${listOfTaps.fold('', (a, b) => '$a\n${b['parameter'][1][0]}(event)')}
};''';
  }
  if (listOfStartOfTaps.isNotEmpty) {
    returnedCode += '''\n
document.addEventListener("mousedown", StartOfTaps);
document.addEventListener("touchstart", StartOfTaps);
function StartOfTaps (event) {
  ${listOfStartOfTaps.fold('', (a, b) => '$a\n${b['parameter'][1][0]}(event)')}
};''';
  }
  if (listOfMoveTaps.isNotEmpty) {
    returnedCode += '''\n
document.addEventListener("mousemove", MouseNowIsMove);
document.addEventListener("touchmove", MouseNowIsMove);
function MouseNowIsMove (event) {
  ${listOfMoveTaps.fold('', (a, b) => '$a\n${b['parameter'][1][0]}(event)')}
};''';
  }
  if (listOfEndOfTaps.isNotEmpty) {
    returnedCode += '''\n
let interactionEndedInTheEndPosition = false;

document.addEventListener('mouseup', EndOfTheTouching);
document.addEventListener('touchend', EndOfTheTouching);
function EndOfTheTouching() {
  if (!interactionEndedInTheEndPosition) {
    interactionEndedInTheEndPosition = true;
    ${listOfEndOfTaps.fold('', (a, b) => '$a\n${b['parameter'][1][0]}(event)')}
    setTimeout(() => {
      interactionEndedInTheEndPosition = false;
    }, 100);
  };
};''';
  }

  return returnedCode;
}

String codeCreator({required String value, String inApp = ''}) {
  List fillData = json.decode(value);
  List data = fillData[0];
  List listOfFiles = fillData[1];
  List piecesName = data[0]['piecesName'];

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

  /* Create all varible */
  if (data[0]['data'] != null && data[0]['data'].length > 0) {
    fisrtStrCodeValues +=
        '\nlet ${data[0]['data'].reduce((a, b) => a + ', ' + b)};';
  }

  /* Create Textures */
  if (listOfFiles.isNotEmpty) {
    fisrtStrCodeValues += listOfFiles.fold("", (a, b) {
      if (b["data"] == "0") {
        return '''$a
      // Audio: ${b['name']}
      let  ${b['name']} = new Audio('${b['audioData']}');
      ${b['name']}.currentTime = 0;
      ''';
      } else {
        return '''$a
      // Image: ${b['name']}
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
      }
    });
  }

  /* Create canvas list */
  fisrtStrCodeValues += piecesName.fold("", (prev, item) {
    return """$prev 
let canva$item = document.createElement('canvas');
canva$item.style.display = "block";
piecesElement.append(canva$item);
""";
  });

  data = data[1];

  /* Create main Code */

  String createdCode = "";

  if (data.isEmpty) {
    return 'Made by Gafum';
  }

  int index = 0;

  /* Create one piece */
  for (List items in data) {
    /* Create my function */

    String fisrtStrCode = """
function ${piecesName[index]}(animation){
  let canva = canva${piecesName[index]};
  const ctx = canva.getContext('2d'); 
  canva.width = window.innerWidth * 2;
  canva.height = window.innerHeight * 2;
  const DisplayWidth = canva.width;
  const DisplayHeight = canva.height;
  updateSliderPosition($index);
""";

    /* find function which works with taps and touch */
    fisrtStrCode += findTaps(items);

    /* Add other elements */
    createdCode += items.fold(fisrtStrCode, (prev, item) {
      String thisStrb;
      if (item['id'].startsWith('AMain') || item['id'].startsWith('CONTI')) {
        dynamic element = ListOfElements[int.parse(item['id'].substring(6))]
            ['secondArgument'];
        if (element == null) return '';
        thisStrb = element[int.parse(item['id'][5])]['code'];
      } else {
        thisStrb = codeOfTheOneItem(
            ListOfElements[int.parse(item['id'])], item['parameter']);
      }
      return "$prev\n$thisStrb";
    });

    /* End of the function */
    createdCode += "}";
    index = index + 1;
  }

  log(htmlCode
      .replaceFirst('HereMustBeCodeWithVariables====>', fisrtStrCodeValues)
      .replaceFirst('HereMustBeMainCode====>', createdCode));
  return htmlCode
      .replaceFirst('HereMustBeCodeWithVariables====>', fisrtStrCodeValues)
      .replaceFirst('HereMustBeMainCode====>', createdCode);
} // create code