const englishLanguage = {
  "home": {
    "home": {
      "name": "Home",
      "alert": {
        "text": ["Add project", "Import"],
        "btns": ["Cancel", "OK"],
        "hint": "Enter name",
        "problem": "Name can only contain Latin letters and numbers"
      }
    },
    "view": "View Result",
    "main-settings": {"name": "Settings", "language": "language"},
    "project-settings": {
      "change": "Change name",
      "saved": "Saved in Folder",
      "delete": "Delete Project",
      "just-put": "Create Just Put file",
      "html": "Create HTML file",
      "file-saved": "File is saved in /Download/JustPut",
    }
  },
  "html": {
    "name-add-block": "Add Block",
    "nav": ["Settings", "Textures", "Code Pieces"],
    "main-fab-btn": ["Propertie", "Control", "Object", "Data", "Start"],
    "files-fab": ["Draw", "Files", "URL"],
    "btns-edit-params": ["Code", "Text", "Ok", "Add"],
    "formuls": {
      "group-name": [
        "Data",
        "MouseEvent",
        "Textures",
        "Math",
        "Properties",
        "Logic",
        "Function",
        "My-func",
        "Else"
      ],
      "btns": [
        "+Create",
        "mousePosition",
        "mouseX",
        "mouseY",
        "colisionWithTouch({ ",
        "TypeOfClick",
        "Target",
        "tappedElement",
        "hgtrthgfsddfeghj",
        "pow",
        "random",
        "sqrt",
        "sin",
        "cos",
        "tan",
        "asin",
        "acos",
        "atan",
        "atan2",
        "max",
        "min",
        "abs",
        "sign",
        "ceil",
        "floor",
        "round",
        "trunc",
        "getModule",
        "log",
        "log10",
        "PI",
        ".x",
        ".y",
        ".width",
        ".height",
        ".color",
        ".radius",
        ".direction",
        ".startAngle",
        ".endAngle",
        "DisplayWidth",
        "DisplayHeight",
        "=",
        "!=",
        ">",
        "<",
        ">=",
        "<=",
        "and",
        "or",
        "no ",
        "true",
        "false",
        "undefined",
        "showMessege",
        "prompt",
        "confirm",
        "JSON.stringify",
        "JSON.parse",
        "joinStrings",
        "degToRadian",
        "randomInteger",
        "colisionBetween",
        "oppositeColision",
        "distanceBetween",
        ".length",
        ".indexOf",
        ".lastIndexOf",
        ".includes",
        ".isArray",
        "Object.keys",
        "+Create",
        "[",
        "]",
        "{",
        "}",
        "()=>",
        "ternary",
        'ADD',
        "CodeInHTML"
      ],
    },
    "message": {
      "writeText": "Write Text",
      "writeCode": "Write Code",
      "writeName": "Write texture name",
      "writeURL": "Write URL",
      "createFunction": "Create Function",
      "createData": "Create Data",
      "createPiece": "Create new piece",
      "delete": "Delete",
      "btns": ["CANCEL", "OK"],
      "notRecomended": [
        "Not recommended",
        "Use the URL instead",
        "Large images will take a long time to process"
      ],
      "alreadyIncledes": [
        "ALREADY EXISTS",
        "Starts with a number",
        "Only Latin"
      ]
    },
    "elements": [
      {
        "text": ["Function name(params)", "End"]
      },
      {
        "text": ["Coment"]
      },
      {
        "text": ["Set //a to 2"]
      },
      {
        "text": ["//code"]
      },
      {
        "text": ["Call //name('a')"]
      },
      {
        "text": ["If condition", "End"]
      },
      {
        "text": ["If condition (else)", "Else", "End"]
      },
      {
        "text": ["showMessege(Text)"]
      },
      {
        "text": ["Create Rectangle myName"],
        "textInWhere":
            "myName: x: myX, y: myY, width: myW, height: myH, direction: myDir, color: myColor, radius: myR, texture: myIMG"
      },
      {
        "text": ["Create Circle myName"],
        "textInWhere":
            "myName: x: myX, y: myY, radius: myR, startAngle(rad): myS, endAngle(rad): myE, counterclockwise: myCl, color: myColor, direction: myDir"
      },
      {
        "text": ["Drawing cycle", "End Drawing"],
        "textInWhere": "Drawing cycle (Cleaning the canvas: true, Get FPS)",
      },
      {
        "text": ["Draw //Object"],
        "textInWhere": "Draw //Object with stroke: undefined",
      },
      {
        "text": ["Tap the canvas", "End of Tap"],
        "textInWhere":
            "Tap <span style='font-size:10px;'>(only the canvas)</span> tappedElement://Object <span style='font-size:10px;'>(not necessarily)</span>"
      },
      {
        "text": ["Draw Text: myText"],
        "textInWhere":
            "myText: x: myX, y: myY, color: myColor, fontStyle: myStyle, text-align: myAligned"
      },
      {
        "text": ["//Object.onClick", "End of Click"],
      },
      {
        "text": ["Set //Object myX and myY"],
        "textInWhere": "Set //Object x: myX, y: myY"
      },
      {
        "text": ["Set //Object X to 100"],
      },
      {
        "text": ["Set //Object Y to 101"],
      },
      {
        "text": ["//Object.width = 50;"],
      },
      {
        "text": ["//Object.height = 60;"],
      },
      {
        "text": ["//Object.radius = 30;"],
      },
      {
        "text": ["//Object.color = myColor;"],
      },
      {
        "text": ["//Object.direction = myDirection;"],
      },
      {
        "text": ["createLinearGradient myName"],
        "textInWhere":
            "myName:<span style=\"font-size:10px;\">(position is absolute)</span> Start X<span style=\"font-size:10px;\">(coordinate of the start point)</span>: myX, Start Y: myY, Finish X<span style=\"font-size:10px;\">(coordinate of the end point)</span>: myfX, Finish Y: myfY, List of Color: myColor, List of Points: points"
      },
      {
        "text": ["createRadialGradient myName"],
        "textInWhere":
            "myName:<span style=\"font-size:10px;\">(position is absolute)</span> First circle X<span style=\"font-size:10px;\">(coordinate of the start point)</span>: myX, First circle Y: myY, First circle radius: myR1,  Second circle X<span style=\"font-size:10px;\">(coordinate of the end point)</span>: myfX, Second circle Y: myfY, Second circle radius: myR2, List of Color: myColor, List of Points: points"
      },
      {
        "text": ["MouseMove", "End of MouseMove"],
        "textInWhere":
            "MouseMove, tappedElement://Object<span style='font-size:10px;'>(not necessarily)</span>"
      },
      {
        "text": ["End Of The Touching", "End of Tap"],
        "textInWhere":
            "End Of The Touch / Mouse up tappedElement://Object <span style='font-size:10px;'>(not necessarily)</span>"
      },
      {
        "text": ["Delay some ms", "End of delay"],
        "textInWhere":
            "Delay some ms <span style='font-size:10px;'>(1s/1000)</span>"
      },
      {
        "text": ["Repeate every some ms", "End of repeats"],
        "textInWhere":
            "Repeate every some ms <span style='font-size:10px;'>(1s/1000)</span> Name: myInterval <span style='font-size:8px;'>You will be able to stop it in the future</span>"
      },
      {
        "text": ["stop repeats of the myInterval"],
      },
      {
        "text": ["Clip texture"],
        "textInWhere":
            "Clip texture: StartX: myStartX, StartY: myStartY, Width of the Clip: myWidth, Height of the Clip: myHeight"
      },
      {
        "text": ["//a add 1 "],
      },
      {
        "text": ["//a multiply by 2 "],
      },
      {
        "text": ["//a divide by 2 "],
      },
      {
        "text": ["Set //a to JSON.parse(REALDATA)"],
      },
      {
        "text": ["Repeat 10 times", "End of the repeats"],
        "textInWhere": "Repeat 10 times Number of current value: index"
      },
      {
        "text": ["In array add newElement"]
      },
      {
        "text": ["Delete last element in array"]
      },
      {
        "text": ["New first element in array"]
      },
      {
        "text": ["Delete first element in array"]
      },
      {
        "text": ["array.forEach(element, index)", "End of the forEach"]
      },
      {
        "text": ["In array1 map array2", "End of the map"],
        "textInWhere":
            "New array: array1, array2.map(element, index) <span style='font-size:14px;'>use with return</span>"
      },
      {
        "text": ["In array1 filter array2", "End of the filter"],
        "textInWhere":
            "New array: array1, array2.filter(element, index) <span style='font-size:14px;'>use with return</span>"
      },
      {
        "text": ["In array1 reduce array2", "End of the reduce"],
        "textInWhere":
            "New array: array1, array2.reduce(previousResult , currentValue, index) <span style='font-size:14px;'>use with return</span>"
      },
      {
        "text": ["delete some elements"],
        "textInWhere":
            "In position where in array delete some elements (splice method)"
      },
      {
        "text": ["Add elements in array"],
        "textInWhere": "In position where in array add elements (splice method)"
      },
      {
        "text": ["array.find(element, index)", "End of the find"],
        "textInWhere":
            "Variable: array1, array2.find(element, index) <span style='font-size:14px;'>use with return</span>"
      },
      {
        "text": ["array.findIndex(element, index)", "End of the find"],
        "textInWhere":
            "Variable: array1, array2.findIndex(element, index) <span style='font-size:14px;'>use with return</span>"
      },
      {
        "text": ["array.sort(+)"]
      },
      {
        "text": ["array.reverse"]
      },
      {
        "text": ["array.shuffle"]
      },
      {
        "text": ["array1 connect with array2"]
      },
      {
        "text": ["return", "End of the return"],
      },
      {
        "text": ["continue"]
      },
      {
        "text": ["break"]
      },
      {
        "text": ["Move //Object HowSteps steps"],
      },
      {
        "text": ["Scale scene X, Y"],
      },
      {
        "text": ["Transform scene X, Y"],
        "textInWhere":
            "Transform <span style='font-size:14px;'>Horizontal scaling:</span>HSc, <span style='font-size:14px;'>Vertical skewing:</span>VSk, <span style='font-size:14px;'>Horizontal skewing: </span>HSk, <span style='font-size:14px;'>Vertical scaling:</span>VSc, x: X, y: Y"
      },
      {
        "text": ["Rotate scene angle"],
      },
      {
        "text": ["Add to //Object X 10"],
      },
      {
        "text": ["Add to //Object Y 10"],
      },
      {
        "text": ["Add to //Object Width 20"],
      },
      {
        "text": ["Add to //Object Height 20"],
      },
      {
        "text": ["Add to //Object Direction 20"],
      },
      {
        "text": ["myName smoothMove to endX, endY"],
        "textInWhere": "myName move smoothly to x: endX, y: endY in duration ms"
      },
      {
        "text": ["Background-color: myColor"],
      },
      {
        "text": ["Save variable"],
      },
      {
        "text": ["Read variable"],
      },
      {
        "text": ["Variable delete from Storage"],
      },
      {
        "text": ["GET in variable url"],
      },
      {
        "text": ["POST in variable url"],
        "textInWhere": "POST in variable url body: myBODY, headers: myHEADERS"
      },
      {
        "text": ["PUT in variable url"],
        "textInWhere": "PUT in variable url body: myBODY, headers: myHEADERS"
      },
      {
        "text": ["PATCH in variable url"],
        "textInWhere": "PATCH in variable url body: myBODY, headers: myHEADERS"
      },
      {
        "text": ["DELETE url"]
      },
      {
        "text": ["Create \"Text\" by HTML"],
        "textInWhere":
            "Create \"Text\" by HTML(myId), absolute position x: myX y: myY, style: myStyle"
      },
      {
        "text": ["Text input(myId)"],
        "textInWhere":
            "Create Text input(myId) with: standartValue, placeholder: myPlaceholder, maxlength: myLenth, style: myStyle, save data in myName, It is password: isPassword, absolute position x: myX, y: myY"
      },
      {
        "text": ["Slider(myId)"],
        "textInWhere":
            "Create Slider(myId), value: standartValue, lowest value: myMIN, greatest value: myMAX, step: oneStep, save data in myName, style: myStyle, absolute position x: myX, y: myY"
      },
      {
        "text": ["Color picker(myId)"],
        "textInWhere":
            "Create Color picker(myId), color: standartValue, save data in myName, absolute position x: myX, y: myY"
      },
      {
        "text": ["Checkbox(myId)"],
        "textInWhere":
            "Create Checkbox(myId), value: standartValue, hint: myHint, save data in myName, style: myStyle, absolute position x: myX, y: myY"
      },
      {
        "text": ["Radio input(myId)"],
        "textInWhere":
            "Create Radio input(groupName) id:myId, value: standartValue, hint: myHint, save data in myName, style: myStyle, absolute position x: myX, y: myY"
      },
      {
        "text": ["Button(myId)"],
        "textInWhere":
            "Create Button(myId), text: myText, code: myCode, absolute position x: myX, y: myY , style: myStyle"
      },
      {
        "text": ["Image(myId)"],
        "textInWhere":
            "Create Image(myId), texture: myTexture, absolute position x: myX, y: myY , style: myStyle"
      },
      {
        "text": ["Delete element myId"]
      },
      {
        "text": ["Object.newProperty = 10"]
      },
      {
        "text": ["Add to object.myProperty -1"]
      },
      {
        "text": ["Object.texture = myIMG"]
      },
      {
        "text": ["Start Of The Touching", "End of Tap"],
        "textInWhere":
            "Start Of The Touch / Mouse down tappedElement://Object <span style='font-size:10px;'>(not necessarily)</span>"
      },
      {
        "text": ["Set //a to empty array"],
      },
    ]
  }
};
