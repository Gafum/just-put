// ignore: non_constant_identifier_names
var ListOfElements = [
  {
    "id": 0,
    "code": "function name(params){",
    "text": "Function name(params)",
    "color": 1,
    "listChengers": ["name", "params"],
    "standartParameter": [
      ["name"],
      ["params"]
    ],
    "secondArgument": [
      {"code": "};", "text": "End"}
    ],
    "isfunction": true
  },
  {
    "id": 1,
    "code": "//Coment",
    "text": "Coment",
    "color": 0,
    "listChengers": ["Coment"],
    "standartParameter": [
      ["Coment"]
    ]
  },
  {
    "id": 2,
    "code": "//a = 2;",
    "text": "Set //a to 2",
    "color": 3,
    "listChengers": ["//a", "2"],
    "standartParameter": [
      [" //a"],
      ["2"]
    ]
  },
  {
    "id": 3,
    "code": "//code",
    "text": "//code",
    "color": 1,
    "listChengers": ["//code"],
    "standartParameter": [
      [" //code"]
    ]
  },
  {
    "id": 4,
    "code": "//name('a')",
    "text": "Call //name('a')",
    "color": 1,
    "listChengers": ["//name", "'a'"],
    "standartParameter": [
      ["//name"],
      ["\"a\""]
    ]
  },
  {
    "id": 5,
    "code": "if(condition){",
    "text": "If condition",
    "color": 1,
    "listChengers": ["condition"],
    "standartParameter": [
      [1, ">", 0]
    ],
    "secondArgument": [
      {"code": "};", "text": "End"}
    ]
  },
  {
    "id": 6,
    "code": "if(condition){",
    "text": "If condition (else)",
    "color": 1,
    "listChengers": ["condition"],
    "standartParameter": [
      [1, ">", 0]
    ],
    "secondArgument": [
      {"code": "}else{", "text": "Else"},
      {"code": "};", "text": "End"}
    ]
  },
  {
    "id": 7,
    "code": "showMessege(Text)",
    "text": "showMessege(Text)",
    "color": 2,
    "listChengers": ["Text"],
    "standartParameter": [
      ["\"Some text\""]
    ]
  },
  {
    "id": 8,
    "code":
        "myName = new rect({ x: myX, y: myY, width: myW, height: myH, direction: myDir, color: myColor, radius: myR, texture: myIMG, shape: \"cub\" });",
    "text": "Create Rectangle myName",
    "color": 2,
    "listChengers": [
      "myName",
      "myX",
      "myY",
      "myW",
      "myH",
      "myDir",
      "myColor",
      "myR",
      "myIMG"
    ],
    "standartParameter": [
      ["myName"],
      ["3", "5", "0"],
      ["5", "0", "0"],
      ["2", "0", "0"],
      ["7", "0"],
      ["degToRadian(", "9", "0", ")"],
      ["\"#000\""],
      ["0"],
      ["undefined"]
    ],
  },
  {
    "id": 9,
    "code":
        "myName = new rect({ x: myX, y: myY, radius: myR, startAngle:myS, endAngle: myE, counterclockwise: myCl, color: myColor, direction: myDir, shape: \"circle\", width: myR*2, height: myR*2 });",
    "text": "Create Circle myName",
    "color": 2,
    "listChengers": [
      "myName",
      "myX",
      "myY",
      "myR",
      "myS",
      "myE",
      "myCl",
      "myColor",
      "myDir"
    ],
    "standartParameter": [
      ["myName"],
      ["1", "5", "0"],
      ["3", "0", "0"],
      ["4", "0"],
      ["0"],
      ["degToRadian(", "3", "6", "0", ")"],
      ["false"],
      ["\"#000\""],
      ["degToRadian(", "9", "0", ")"]
    ],
  },
  {
    "id": 10,
    "code":
        "let toClean = true;\ndraw();\nfunction draw(veryOldTimeIsHere, oldTimeIsHere) {\nif (toClean){ctx.clearRect(0, 0, canva.width, canva.height)};\nlet FPS = Math.floor(1000 / (oldTimeIsHere - veryOldTimeIsHere));",
    "text": "Drawing cycle",
    "color": 1,
    "listChengers": ["true", "FPS"],
    "standartParameter": [
      ["true"],
      ["FPS"]
    ],
    "secondArgument": [
      {
        "code":
            "requestAnimationFrame((currentTime)=>draw(oldTimeIsHere, currentTime))};",
        "text": "End Drawing"
      }
    ],
    "isfunction": true
  },
  {
    "id": 11,
    "code": "//Object.draw(undefined);",
    "text": "Draw //Object With stroke: undefined",
    "color": 2,
    "listChengers": ["//Object", "undefined"],
    "standartParameter": [
      ["//Object"],
      ["undefined"]
    ]
  },
  {
    "id": 12,
    "code":
        "function myName(event){\nlet tappedElement = //Object;\nlet MousePosition = getpositionOfMouse(event);",
    "text": "Tap the canvas",
    "color": 1,
    "listChengers": ["//Object", "myName"],
    "standartParameter": [
      ["undefined"],
      []
    ],
    "secondArgument": [
      {"code": "};", "text": "End of Tap"}
    ],
    "isfunction": true,
  },
  {
    "id": 13,
    "code":
        "ctx.fillStyle = myColor;\nctx.font = myStyle;\nctx.textAlign = myAligned;\nctx.fillText(myText, myX, myY);",
    "text": "Draw Text: myText",
    "color": 2,
    "listChengers": ["myText", "myX", "myY", "myColor", "myStyle", "myAligned"],
    "standartParameter": [
      ["\"Hi Gafum\""],
      ["2", "0", "0"],
      ["8", "0"],
      ["\"#ff0000\""],
      ["\"48px serif\""],
      ["\"center\""]
    ],
  },
  {
    "id": 14,
    "code":
        "function myFunctionName(event) {\nlet MousePosition = getpositionOfMouse(event);\n(Array.isArray(//Object) ? //Object : [//Object]).forEach((iser) => {\n\tif (colisionWithTouch({ object: iser, MousePosition })) {\n\t\tlet tappedElement = iser;",
    "text": "//Object.onClick",
    "color": 1,
    "listChengers": ["//Object", "myFunctionName"],
    "standartParameter": [
      ["myName"],
      []
    ],
    "secondArgument": [
      {"code": "}})};", "text": "End of Click"}
    ],
    "isfunction": true
  },
  {
    "id": 15,
    "code": "//Object.x = myX; //Object.y = myY;",
    "text": "Set //Object myX and myY",
    "color": 0,
    "listChengers": ["//Object", "myX", "myY"],
    "standartParameter": [
      [" //myName"],
      ["1", "0", "0"],
      ["4", "0"]
    ],
  },
  {
    "id": 16,
    "code": "//Object.x = 100;",
    "text": "Set //Object X to 100",
    "color": 0,
    "listChengers": ["//Object", "100"],
    "standartParameter": [
      [" //myName"],
      ["1", "0", "0"]
    ]
  },
  {
    "id": 17,
    "code": "//Object.y = 101;",
    "text": "Set //Object Y to 101",
    "color": 0,
    "listChengers": ["//Object", "101"],
    "standartParameter": [
      [" //myName"],
      ["1", "0", "1"]
    ]
  },
  {
    "id": 18,
    "code": "//Object.width = 50;",
    "text": "Set //Object Width to 50",
    "color": 0,
    "listChengers": ["//Object", "50"],
    "standartParameter": [
      [" //myName"],
      ["5", "0"]
    ]
  },
  {
    "id": 19,
    "code": "//Object.height = 60;",
    "text": "Set //Object Height to 60",
    "color": 0,
    "listChengers": ["//Object", "60"],
    "standartParameter": [
      [" //myName"],
      ["6", "0"]
    ]
  },
  {
    "id": 20,
    "code": "//Object.radius = 30;",
    "text": "Set //Object Radius to  30",
    "color": 0,
    "listChengers": ["//Object", "30"],
    "standartParameter": [
      ["//myName"],
      ["3", "0"]
    ]
  },
  {
    "id": 21,
    "code": "//Object.color = myColor;",
    "text": "Set //Object Color to myColor",
    "color": 0,
    "listChengers": ["//Object", "myColor"],
    "standartParameter": [
      [" //myName"],
      ["\"#000\""]
    ]
  },
  {
    "id": 22,
    "code": "//Object.direction = myDirection;",
    "text": "Set //Object Direction to myDirection",
    "color": 0,
    "listChengers": ["//Object", "myDirection"],
    "standartParameter": [
      [" //myName"],
      ["degToRadian(", "9", "0", ")"]
    ]
  },
  {
    "id": 23,
    "code":
        "myName = ctx.createLinearGradient(myX, myY, myfX, myfY)\nCreateFradionAddPoints(myName, myColor, points);",
    "text": "createLinearGradient myName",
    "color": 0,
    "listChengers": [
      "myName",
      "myX",
      "myY",
      "myfX",
      "myfY",
      "myColor",
      "points"
    ],
    "standartParameter": [
      ["myName"],
      ["0"],
      ["0"],
      ["4", "0", "0"],
      ["0"],
      ["[", "\"#fff\"", ",", "\"red\"", "]"],
      ["[", "0", ",", "1", "]"]
    ],
  },
  {
    "id": 24,
    "code":
        "myName = ctx.createRadialGradient(myX, myY, myR1, myfX, myfY, myR2)\nCreateFradionAddPoints(myName, myColor, points);",
    "text": "createRadialGradient myName",
    "color": 0,
    "listChengers": [
      "myName",
      "myX",
      "myY",
      "myR1",
      "myfX",
      "myfY",
      "myR2",
      "myColor",
      "points"
    ],
    "standartParameter": [
      ["myName"],
      ["5", "0"],
      ["5", "0"],
      ["4"],
      ["8", "0"],
      ["6", "0"],
      ["8", "0"],
      ["[", "\"#fff\"", ",", "\"red\"", "]"],
      ["[", "0", ",", "1", "]"]
    ],
  },
  {
    "id": 25,
    "code":
        "function myName(event){\nlet tappedElement = //Object;\nlet MousePosition = getpositionOfMouse(event);",
    "text": "MouseMove",
    "color": 1,
    "listChengers": ["//Object", "myName"],
    "standartParameter": [
      ["undefined"],
      []
    ],
    "secondArgument": [
      {"code": "};", "text": "End of MouseMove"}
    ],
    "isfunction": true,
  },
  {
    "id": 26,
    "code":
        "function myName(event){\nlet tappedElement = //Object;\nlet MousePosition = getpositionOfMouse(event);",
    "text": "End Of The Touching",
    "color": 1,
    "listChengers": ["//Object", "myName"],
    "standartParameter": [
      ["undefined"],
      []
    ],
    "secondArgument": [
      {"code": "};", "text": "End of Tap"}
    ],
    "isfunction": true,
  },
  {
    "id": 27,
    "code": "delay(some).then(() =>{",
    "text": "Delay some ms",
    "color": 1,
    "listChengers": ["some"],
    "standartParameter": [
      ["1", "0", "0", "0"]
    ],
    "secondArgument": [
      {"code": "});", "text": "End of delay"}
    ],
  },
  {
    "id": 28,
    "code":
        "myInterval = setInterval(myIntervalTimeMs, some)\nfunction myIntervalTimeMs(){",
    "text": "Repeate every some ms",
    "color": 1,
    "listChengers": ["some", "myInterval"],
    "standartParameter": [
      ["1", "0", "0", "0"],
      ["myInterval"]
    ],
    "secondArgument": [
      {"code": "};", "text": "End of repeats"}
    ],
    "isfunction": true,
  },
  {
    "id": 29,
    "code": "clearInterval(myInterval)",
    "text": "stop repeats of the myInterval",
    "color": 1,
    "listChengers": ["myInterval"],
    "standartParameter": [
      [" myInterval"]
    ]
  },
  {
    "id": 30,
    "code":
        "texture.sx = myStartX\ntexture.sy = myStartY\ntexture.swidth = myWidth\ntexture.sheight = myHeight;",
    "text": "Clip texture",
    "color": 0,
    "listChengers": ["texture", "myStartX", "myStartY", "myWidth", "myHeight"],
    "standartParameter": [
      ["texture"],
      ["0"],
      ["0"],
      ["5", "0"],
      ["5", "0"]
    ],
  },
  {
    "id": 31,
    "code": "//a += 1;",
    "text": "//a add 1 ",
    "color": 3,
    "listChengers": ["//a", "1"],
    "standartParameter": [
      [" //a"],
      ["1"]
    ]
  },
  {
    "id": 32,
    "code": "//a *= 2;",
    "text": "//a multiply by 2 ",
    "color": 3,
    "listChengers": ["//a", "2"],
    "standartParameter": [
      [" //a"],
      ["2"]
    ]
  },
  {
    "id": 33,
    "code": "//a /= 2;",
    "text": "//a divide by 2 ",
    "color": 3,
    "listChengers": ["//a", "2"],
    "standartParameter": [
      [" //a"],
      ["2"]
    ]
  },
  {
    "id": 34,
    "code": "//a = JSON.parse(REALDATA)",
    "text": "Set //a to JSON.parse(REALDATA)",
    "color": 3,
    "listChengers": ["//a", "REALDATA"],
    "standartParameter": [
      [" //a"],
      ["`[0,2,\"hi\"]`"]
    ]
  },
  {
    "id": 35,
    "code": "for (var index = 0; index < 10; index++) {",
    "text": "Repeat 10 times",
    "color": 3,
    "listChengers": ["10", "index"],
    "standartParameter": [
      ["1", "0"],
      ["index"]
    ],
    "secondArgument": [
      {"code": "};", "text": "End of the repeats"}
    ],
  },
  {
    "id": 36,
    "code": "array.push(newElement);",
    "text": "In array add newElement",
    "color": 3,
    "listChengers": ["array", "newElement"],
    "standartParameter": [
      ["array"],
      ["\"newElement\""]
    ]
  },
  {
    "id": 37,
    "code": "array.pop();",
    "text": "Delete last element in array",
    "color": 3,
    "listChengers": ["array"],
    "standartParameter": [
      ["array"]
    ]
  },
  {
    "id": 38,
    "code": "array.unshift(element);",
    "text": "New first element in array",
    "color": 3,
    "listChengers": ["element", "array"],
    "standartParameter": [
      ["\"element\""],
      ["array"]
    ]
  },
  {
    "id": 39,
    "code": "array.shift();",
    "text": "Delete first element in array",
    "color": 3,
    "listChengers": ["array"],
    "standartParameter": [
      ["array"]
    ]
  },
  {
    "id": 40,
    "code": "array.forEach((element, index)=>{",
    "text": "array.forEach(element, index)",
    "color": 3,
    "listChengers": ["array", "element", "index"],
    "standartParameter": [
      ["array"],
      ["element"],
      ["index"]
    ],
    "secondArgument": [
      {"code": "});", "text": "End of the forEach"}
    ]
  },
  {
    "id": 41,
    "code": "array1 = array2.map((element, index)=>{",
    "text": "In array1 map array2",
    "color": 3,
    "listChengers": ["array1", "array2", "element", "index"],
    "standartParameter": [
      ["array1"],
      ["array2"],
      ["element"],
      ["index"]
    ],
    "secondArgument": [
      {"code": "});", "text": "End of the map"}
    ],
  },
  {
    "id": 42,
    "code": "array1 = array2.filter((element, index)=>{",
    "text": "In array1 filter array2",
    "color": 3,
    "listChengers": ["array1", "array2", "element", "index"],
    "standartParameter": [
      ["array1"],
      ["array2"],
      ["element"],
      ["index"]
    ],
    "secondArgument": [
      {"code": "});", "text": "End of the filter"}
    ],
  },
  {
    "id": 43,
    "code": "array1 = array2.reduce((previousResult, currentValue, index)=>{",
    "text": "In array1 reduce array2",
    "color": 3,
    "listChengers": [
      "array1",
      "array2",
      "previousResult",
      "currentValue",
      "index"
    ],
    "standartParameter": [
      ["array1"],
      ["array2"],
      ["previousResult"],
      ["currentValue"],
      ["index"]
    ],
    "secondArgument": [
      {"code": "});", "text": "End of the reduce"}
    ],
  },
  {
    "id": 44,
    "code": "array.splice(where, some);",
    "text": "delete some elements",
    "color": 3,
    "listChengers": ["where", "array", "some"],
    "standartParameter": [
      ["5"],
      ["array"],
      ["1"]
    ],
  },
  {
    "id": 45,
    "code": "array.splice(where, 0, elements);",
    "text": "Add elements in array",
    "color": 3,
    "listChengers": ["where", "array", "elements"],
    "standartParameter": [
      ["5"],
      ["array"],
      ["1", ",", "2"]
    ],
  },
  {
    "id": 46,
    "code": "array1 = array2.find((element, index)=>{",
    "text": "array.find(element, index)",
    "color": 3,
    "listChengers": ["array1", "array2", "element", "index"],
    "standartParameter": [
      ["array1"],
      ["array2"],
      ["element"],
      ["index"]
    ],
    "secondArgument": [
      {"code": "});", "text": "End of the find"}
    ],
  },
  {
    "id": 47,
    "code": "array1 = array2.findIndex((element, index)=>{",
    "text": "array.findIndex(element, index)",
    "color": 3,
    "listChengers": ["array1", "array2", "element", "index"],
    "standartParameter": [
      ["array1"],
      ["array2"],
      ["element"],
      ["index"]
    ],
    "secondArgument": [
      {"code": "});", "text": "End of the find"}
    ],
  },
  {
    "id": 48,
    "code": "array.sort((a, b)=>+(a-b));",
    "text": "array.sort(+)",
    "color": 3,
    "listChengers": ["array", "+"],
    "standartParameter": [
      ["array"],
      ["+"]
    ]
  },
  {
    "id": 49,
    "code": "array.reverse();",
    "text": "array.reverse",
    "color": 3,
    "listChengers": ["array"],
    "standartParameter": [
      ["array"]
    ]
  },
  {
    "id": 50,
    "code": "shuffle(array);",
    "text": "array.shuffle",
    "color": 3,
    "listChengers": ["array"],
    "standartParameter": [
      ["array"]
    ]
  },
  {
    "id": 51,
    "code": "array1 = array1.concat(array2);",
    "text": "array1 connect with array2",
    "color": 3,
    "listChengers": ["array1", "array2"],
    "standartParameter": [
      ["array1"],
      ["[", "1", ",", "2", "]"]
    ]
  },
  {
    "id": 52,
    "code": "return{",
    "text": "return",
    "color": 1,
    "standartParameter": ["Hi GAfum"],
    "secondArgument": [
      {"code": "};", "text": "End of the return"}
    ]
  },
  {
    "id": 53,
    "code": "continue;",
    "text": "continue",
    "color": 1,
    "standartParameter": ["Hi GAfum"]
  },
  {
    "id": 54,
    "code": "break;",
    "text": "break",
    "color": 1,
    "standartParameter": ["Hi GAfum"]
  },
  {
    "id": 55,
    "code": "//Object.go(HowSteps)",
    "text": "Move //Object HowSteps steps",
    "color": 0,
    "listChengers": ["//Object", "HowSteps"],
    "standartParameter": [
      [" //myName"],
      ["1", "0"]
    ]
  },
  {
    "id": 56,
    "code": "ctx.scale(X, Y);",
    "text": "scale scene X, Y",
    "color": 0,
    "listChengers": ["X", "Y"],
    "standartParameter": [
      ["2"],
      ["1"]
    ]
  },
  {
    "id": 57,
    "code": "ctx.transform(HSc, VSk, HSk, VSc, X, Y);",
    "text": "transform scene X, Y",
    "color": 0,
    "listChengers": ["HSc", "VSk", "HSk", "VSc", "X", "Y"],
    "standartParameter": [
      ["1"],
      ["0.2"],
      ["0.8"],
      ["1"],
      ["0"],
      ["0"]
    ],
  },
  {
    "id": 58,
    "code": "ctx.rotate(angle);",
    "text": "rotate scene angle",
    "color": 0,
    "listChengers": ["angle"],
    "standartParameter": [
      ["degToRadian(", "2", "0", ")"]
    ]
  },
  {
    "id": 59,
    "code": "//Object.x += 10;",
    "text": "Add to //Object X 10",
    "color": 0,
    "listChengers": ["//Object", "10"],
    "standartParameter": [
      [" //myName"],
      ["1", "0"]
    ]
  },
  {
    "id": 60,
    "code": "//Object.y += 10;",
    "text": "Add to //Object Y 10",
    "color": 0,
    "listChengers": ["//Object", "10"],
    "standartParameter": [
      [" //myName"],
      ["1", "1"]
    ]
  },
  {
    "id": 61,
    "code": "//Object.width += 20;",
    "text": "Add to //Object Width  20",
    "color": 0,
    "listChengers": ["//Object", "20"],
    "standartParameter": [
      [" //myName"],
      ["2", "0"]
    ]
  },
  {
    "id": 62,
    "code": "//Object.height += 20;",
    "text": "Add to //Object Height 20",
    "color": 0,
    "listChengers": ["//Object", "20"],
    "standartParameter": [
      [" //myName"],
      ["2", "0"]
    ]
  },
  {
    "id": 63,
    "code": "//Object.direction += 20;",
    "text": "Add to //Object Direction 20",
    "color": 0,
    "listChengers": ["//Object", "20"],
    "standartParameter": [
      [" //myName"],
      ["degToRadian(", "9", "0", ")"]
    ]
  },
  {
    "id": 64,
    "code": "moveObject(myName, endX, endY, duration);",
    "text": "myName smoothMove to endX, endY",
    "color": 0,
    "listChengers": ["myName", "endX", "endY", "duration"],
    "standartParameter": [
      ["myName"],
      ["2", "5", "0"],
      ["2", "5", "0"],
      ["3", "0", "0", "0"]
    ],
  },
  {
    "id": 65,
    "code":
        "canva.style.backgroundColor = myColor;\n document.querySelector('body').style.backgroundColor = myColor;",
    "text": "Background-color: myColor",
    "color": 0,
    "listChengers": ["myColor"],
    "standartParameter": [
      ["\"#30c731\""]
    ]
  },
  {
    "id": 66,
    "code":
        "try{\n\tlocalStorage.setItem('@variable', variable)\n}catch{\n\ttry{\n\t\tStoredData['variable'] = variable\n\t\tStoreDataInDevice.postMessage(JSON.stringify(StoredData))\n\t}catch(e){\n\t\talert(e)\n\t};\n};",
    "text": "Save variable",
    "color": 3,
    "listChengers": ["variable"],
    "standartParameter": [
      [" myName"]
    ],
  },
  {
    "id": 67,
    "code":
        "try{\n\tvariable = localStorage.getItem('@variable')\n}catch{\n\ttry{\n\t\tvariable = StoredData['variable']\n\t}catch(e){\n\t\talert(e)\n\t}\n};",
    "text": "Read variable",
    "color": 3,
    "listChengers": ["variable"],
    "standartParameter": [
      [" myName"]
    ],
  },
  {
    "id": 68,
    "code":
        "try{\n\tlocalStorage.removeItem('@Variable')\n}catch{\n\ttry{\n\t\tif(StoredData['Variable']){\n\t\t\tdelete StoredData['Variable']\n\t\t\tStoreDataInDevice.postMessage(JSON.stringify(StoredData))\n\t\t}\n\t}catch(e){\n\t\talert(e)\n\t};\n};",
    "text": "Variable delete from Storege",
    "color": 3,
    "listChengers": ["Variable"],
    "standartParameter": [
      [" myName"]
    ],
  },
  {
    "id": 69,
    "code":
        "try{\nfetch(url)\n\t.then((response) => {\n\t\tif (response.ok) {\n\t\t\treturn response.text();\n\t\t}\n\t\treturn \"Error\"\n\t})\n\t.then((data) => {\n\t\tvariable = data;\n\t})\n\t.catch((e) => {\n\t\tvariable = e;\n\t\tconsole.log(e);\n\t});\n}catch(e){\n\tmyName = \"Error:\" + e;\n};",
    "text": "GET in variable url",
    "color": 3,
    "listChengers": ["variable", "url"],
    "standartParameter": [
      [" //myName"],
      ["\"https://jsonplaceholder.typicode.com/users?id=1\""]
    ]
  },
  {
    "id": 70,
    "code":
        "try {\nfetch(url, {\n\tmethod: 'POST',\n\tbody: JSON.stringify(myBODY),\n\theaders: {\n\t\tmyHEADERS\n\t}\n})\n\t.then((response) => {\n\t\tif (response.ok) {\n\t\t\treturn response.text();\n\t\t}\n\t\treturn \"Error\"\n\t})\n\t.then((data) => {\n\t\tvariable = data;\n\t})\n\t.catch((e) => {\n\t\tvariable = e;\n\t\tconsole.log(e);\n\t});\n}catch(e){\n\tvariable = \"Error:\" + e;\n};",
    "text": "POST in variable url",
    "color": 3,
    "listChengers": ["variable", "url", "myBODY", "myHEADERS"],
    "standartParameter": [
      [" //myName"],
      ["\"https://jsonplaceholder.typicode.com/posts\""],
      [" { title: \"foo\", body: \"bar\", userId: 1 }"],
      ["\"Content-type\": \"application/json; charset=UTF-8\""]
    ],
  },
  {
    "id": 71,
    "code":
        "try {\nfetch(url, {\n\tmethod: 'PUT',\n\tbody: JSON.stringify(myBODY),\n\theaders: {\n\t\tmyHEADERS\n\t}\n})\n\t.then((response) => {\n\t\tif (response.ok) {\n\t\t\treturn response.text();\n\t\t}\n\t\treturn \"Error\"\n\t})\n\t.then((data) => {\n\t\tvariable = data;\n\t})\n\t.catch((e) => {\n\t\tvariable = e;\n\t\tconsole.log(e);\n\t});\n}catch(e){\n\tvariable = \"Error:\" + e;\n};",
    "text": "PUT in variable url",
    "color": 3,
    "listChengers": ["variable", "url", "myBODY", "myHEADERS"],
    "standartParameter": [
      [" //myName"],
      ["\"https://jsonplaceholder.typicode.com/posts/1\""],
      [" { id: 1, title: \"foo\", body: \"bar\", userId: 1 }"],
      ["\"Content-type\": \"application/json; charset=UTF-8\""]
    ],
  },
  {
    "id": 72,
    "code":
        "try {\nfetch(url, {\n\tmethod: 'PATCH',\n\tbody: JSON.stringify(myBODY),\n\theaders: {\n\t\tmyHEADERS\n\t}\n})\n\t.then((response) => {\n\t\tif (response.ok) {\n\t\t\treturn response.text();\n\t\t}\n\t\treturn \"Error\"\n\t})\n\t.then((data) => {\n\t\tvariable = data;\n\t})\n\t.catch((e) => {\n\t\tvariable = e;\n\t\tconsole.log(e);\n\t});\n}catch(e){\n\tvariable = \"Error:\" + e;\n};",
    "text": "PATCH in variable url",
    "color": 3,
    "listChengers": ["variable", "url", "myBODY", "myHEADERS"],
    "standartParameter": [
      [" //myName"],
      ["\"https://jsonplaceholder.typicode.com/posts/1\""],
      [" { title: \"foo\" }"],
      ["\"Content-type\": \"application/json; charset=UTF-8\""]
    ],
  },
  {
    "id": 73,
    "code":
        "try {\n\tfetch(url, {\n\t\tmethod: 'DELETE',\n\t});\n}catch(e){\n\tconsole.log(e);\n};",
    "text": "DELETE url",
    "color": 3,
    "listChengers": ["url"],
    "standartParameter": [
      ["\"https://jsonplaceholder.typicode.com/posts/1\""]
    ]
  },
  {
    "id": 74,
    "code":
        "addElementByHtml(`<p style=\"position: absolute; transform: translate(-50%, -50%); left: \${(myX)/2}px; top: \${(myY)/2}px; \${myStyle}\">\${\"Text\"}</p>`, myId);",
    "text": "Create \"Text\" by HTML",
    "color": 2,
    "listChengers": ["\"Text\"", "myId", "myX", "myY", "myStyle"],
    "standartParameter": [
      ["\"Text\""],
      ["\"textId\""],
      ["2", "5", "0"],
      ["1", "0", "0"],
      ["\"text-align: center;\""]
    ],
  },
  {
    "id": 75,
    "code":
        "addElementByHtml(`<div class=\"input-text-container\" style=\"transform: translate(-50%, -50%); position: absolute; left: \${(myX)/2}px; top: \${(myY)/2}px;\">\n\t\t<input required=\"\" type=\"\${isPassword?\"password\":\"text\"}\" id=\"\${myId}main\" name=\"\${myId}main\" value=\"\${standartValue}\" maxlength=\"myLenth\" style=\"\${myStyle}\">\n\t\t<label for=\"\${myId}main\" style=\"\${myStyle}\">\${myPlaceholder}</label>\t\t\n\t</div>`, myId);\ndocument.getElementById(myId+\"main\").onchange = (event)=>{\n\tmyName = event.target.value\n};",
    "text": "Text input(myId)",
    "color": 2,
    "listChengers": [
      "myId",
      "standartValue",
      "myPlaceholder",
      "myLenth",
      "myStyle",
      "myName",
      "isPassword",
      "myX",
      "myY"
    ],
    "standartParameter": [
      ["\"InputId\""],
      ["\"Text...\""],
      ["\"Write text\""],
      ["2", "2", "1", "2", "4", "4"],
      ["\"width: 200px;\""],
      [" myName"],
      ["false"],
      ["2", "5", "0"],
      ["5", "0"]
    ],
  },
  {
    "id": 76,
    "code":
        "addElementByHtml(`<input type=\"range\" min=\"\${myMIN}\" max=\"\${myMAX}\" value=\"\${standartValue}\" step=\"\${oneStep}\" oninput=\"myName=this.value\" style=\"transform: translate(-50%, -50%); position: absolute; left: \${(myX)/2}px; top: \${(myY)/2}px; \${myStyle}\" />`, myId);",
    "text": "Slider(myId)",
    "color": 2,
    "listChengers": [
      "myId",
      "standartValue",
      "myMIN",
      "myMAX",
      "oneStep",
      "myName",
      "myStyle",
      "myX",
      "myY"
    ],
    "standartParameter": [
      ["\"SliderId\""],
      ["5"],
      ["0"],
      ["10"],
      ["1"],
      ["myName"],
      ["\"width: 200px;\""],
      ["2", "5", "0"],
      ["5", "0"]
    ],
  },
  {
    "id": 77,
    "code":
        "addElementByHtml(`<input type=\"color\" value=\"\${standartValue}\" onchange=\"myName = this.value\" style=\"transform: translate(-50%, -50%); position: absolute; left: \${(myX)/2}px; top: \${(myY)/2}px;\">`, myId);",
    "text": "Color picker(myId)",
    "color": 2,
    "listChengers": ["myId", "standartValue", "myName", "myX", "myY"],
    "standartParameter": [
      ["\"ColorId\""],
      ["\"#eb4464\""],
      ["myName"],
      ["2", "5", "0"],
      ["1", "0", "0"]
    ],
  },
  {
    "id": 78,
    "code":
        "addElementByHtml(`<div class=\"input-checkbox-conteiner\" style=\"\${myStyle} transform: translate(-50%, -50%); position: absolute; left: \${(myX)/2}px; top: \${(myY)/2}px;\">\n\t\t<input type=\"checkbox\" class=\"input-checkbox\" id=\"\${myId}ch\" onchange='myName=this.checked;'\n\t\t\t\${standartValue&&\"checked\"}>\n\t\t<label for=\"\${myId}ch\">\n\t\t\t<span class=\"checkbox-bipolar\">\n\t\t\t</span>\n\t\t</label>\n\t\t<label for=\"\${myId}ch\">\${myHint}</label>\n\t</div>`, myId);",
    "text": "Checkbox(myId)",
    "color": 2,
    "listChengers": [
      "myId",
      "standartValue",
      "myHint",
      "myName",
      "myStyle",
      "myX",
      "myY"
    ],
    "standartParameter": [
      ["\"CheckId\""],
      ["false"],
      ["\"isHappy\""],
      ["myName"],
      ["\"width: 200px;\""],
      ["2", "5", "0"],
      ["1", "0", "0"]
    ],
  },
  {
    "id": 79,
    "code":
        "addElementByHtml(`<div class=\"input-radio-container\" style=\"\${myStyle} transform: translate(-50%, -50%); position: absolute; left: \${(myX)/2}px; top: \${(myY)/2}px;\">\n\t\t<input type=\"radio\" id=\"\${myId}in\" name=\"\${groupName}\" onchange='myName=standartValue;' value=\"\${standartValue}\">\n\t\t<label for=\"\${myId}in\">\${myHint}</label>\t\t\n\t</div>`, myId);",
    "text": "Radio input(myId)",
    "color": 2,
    "listChengers": [
      "groupName",
      "myId",
      "standartValue",
      "myHint",
      "myName",
      "myStyle",
      "myX",
      "myY"
    ],
    "standartParameter": [
      ["\"group1\""],
      ["\"RadioId\""],
      ["\"option 1\""],
      ["\"Option 1\""],
      ["myName"],
      ["\"width: 100px;\""],
      ["2", "5", "0"],
      ["1", "0", "0"]
    ],
  },
  {
    "id": 80,
    "code":
        "addElementByHtml(`<button style=\"position: absolute; transform: translate(-50%, -50%); left: \${(myX)/2}px; top: \${(myY)/2}px; \${myStyle}\" type=\"button\">\${myText}</button>`, myId); \ndocument.getElementById(myId+\"conteiner\").onclick = (event) =>{\n  myCode\n};",
    "text": "Button(myId)",
    "color": 2,
    "listChengers": ["myId", "myText", "myCode", "myX", "myY", "myStyle"],
    "standartParameter": [
      ["\"btnId\""],
      ["\"press me\""],
      ["showMessege(\"hi\");"],
      ["2", "5", "0"],
      ["2", "0", "0"],
      ["\"width: 100px;\""]
    ],
  },
  {
    "id": 81,
    "code":
        "addElementByHtml(`<img src='\${myTexture.a.src}' style=\"pointer-events: none; position: absolute; left: \${(myX)/2}px; top: \${(myY)/2}px; \${myStyle} transform: translate(-50%, -50%);\">`, myId);",
    "text": "Image(myId)",
    "color": 2,
    "listChengers": ["myId", "myTexture", "myX", "myY", "myStyle"],
    "standartParameter": [
      ["\"imgId\""],
      ["myTexture"],
      ["3", "2", "0"],
      ["3", "0", "0"],
      ["\"border-radius: 5px;\""]
    ],
  },
  {
    "id": 82,
    "code":
        "try{document.getElementById(myId+\"conteiner\").remove();}catch(e){console.log(e)}",
    "text": "Delete element myId",
    "color": 2,
    "listChengers": ["myId"],
    "standartParameter": [
      ["\"myId\""]
    ]
  },
  {
    "id": 83,
    "code": "Object.newProperty = 10",
    "text": "Object.newProperty = 10",
    "color": 0,
    "listChengers": ["Object", "newProperty", "10"],
    "standartParameter": [
      ["myName"],
      ["health"],
      ["1", "0"]
    ]
  },
  {
    "id": 84,
    "code": "object.myProperty += -1",
    "text": "Add to object myProperty -1",
    "color": 0,
    "listChengers": ["object", "myProperty", "-1"],
    "standartParameter": [
      ["myName"],
      ["health"],
      ["-", "1"]
    ]
  },
  {
    "id": 85,
    "code": "Object.texture = myIMG",
    "text": "Set Object texture to myIMG",
    "color": 0,
    "listChengers": ["Object", "myIMG"],
    "standartParameter": [
      ["myName"],
      ["undefined"]
    ]
  },
  {
    "id": 86,
    "code":
        "function myName(event){\nlet tappedElement = //Object;\nlet MousePosition = getpositionOfMouse(event);",
    "text": "Start of the touching",
    "color": 1,
    "listChengers": ["//Object", "myName"],
    "standartParameter": [
      ["undefined"],
      []
    ],
    "secondArgument": [
      {"code": "};", "text": "End of Tap"}
    ],
    "isfunction": true,
  },
  {
    "id": 87,
    "code": "//a = [];",
    "text": "Set //a to empty list",
    "color": 3,
    "listChengers": ["//a"],
    "standartParameter": [
      [" //a"]
    ]
  },
];
