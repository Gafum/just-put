const Map<String, dynamic> translation = {
  "English": {
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
          "no",
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
              "myName: x: myX, y: myY, radius: myR, startAngle(rad): myS, endAngle(rad): myE, counterclockwise: myCl, color: myColor"
        },
        {
          "text": ["Drawing cycle", "End Drawing"],
          "textInWhere": "Drawing cycle (Cleaning the canvas: true, Get FPS)",
        },
        {
          "text": ["Draw //Object With stroke: undefined"]
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
              "New array: array1, array2.reduce(previousResult , currentValue, index) <span style='font-size:14px;'>use with return</span>"
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
          "textInWhere":
              "In position where in array add newElements (splice method)"
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
          "text": ["Object smoothMove to endX, endY"],
          "textInWhere":
              "Object move smoothly to x: endX, y: endY in duration ms"
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
          "textInWhere":
              "PATCH in variable url body: myBODY, headers: myHEADERS"
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
          "text": ["Set object.newProperty to 10"]
        },
        {
          "text": ["Add to object.myProperty -1"]
        }
      ]
    }
  },
  "Ukrainian": {
    "home": {
      "home": {
        "name": "Головна",
        "alert": {
          "text": ["Новий проєкт", "Імпорт"],
          "btns": ["Скасувати", "OK"],
          "hint": "Введіть назву",
          "problem": "Назва може містити лише латинські літери та цифри"
        }
      },
      "view": "Результат",
      "main-settings": {"name": "Налаштування", "language": "мова"},
      "project-settings": {
        "change": "Змінити назву",
        "saved": "Збережено у папці",
        "delete": "Видалити проект",
        "just-put": "Створити файл Just Put",
        "html": "Створити HTML-файл",
        "file-saved": "Файл збережено у /Download/JustPut",
      }
    },
    "html": {
      "name-add-block": "Додати блок",
      "nav": ["Налаштування", "Текстури", "Фрагменти"],
      "main-fab-btn": ["Властивості", "Керування", "Об'єкти", "Дані", "Старт"],
      "files-fab": ["Малювати", "Файли", "URL"],
      "btns-edit-params": ["Код", "Текст", "ОК", "+"],
      "formuls": {
        "group-name": [
          "Дані",
          "ПодіїМиші",
          "Текстури",
          "Математика",
          "Властивості",
          "Логіка",
          "Функція",
          "Мої-функції",
          "Інше"
        ],
        "btns": [
          "+Створити",
          "мишаX",
          "мишаY",
          "зіткненняЗДотиком({",
          "ТипКліка",
          "Ціль",
          "натиснутийОб'єкт",
          "hgtrthgfsddfeghj",
          "степінь",
          "випадкове",
          "корінь",
          "синус",
          "косинус",
          "тангенс",
          "асинус",
          "акосинус",
          "атангенс",
          "атангенс2",
          "максимум",
          "мінімум",
          "абсолютне",
          "знак",
          "округленняВгору",
          "округленняВниз",
          "округлення",
          "цілаЧастина",
          "отриматиМодуль",
          "логарифм",
          "логарифм10",
          "Пі",
          ".х",
          ".у",
          ".ширина",
          ".висота",
          ".колір",
          ".радіус",
          ".напрямок",
          ".початковийКут",
          ".кінцевийКут",
          "ШиринаЕкрана",
          "ВисотаЕкрана",
          "=",
          "!=",
          ">",
          "<",
          ">=",
          "<=",
          "і",
          "або",
          "ні",
          "правда",
          "хиба",
          "неозначено",
          "показатиПовідомлення",
          "запит",
          "підтвердити",
          "JSON.stringify",
          "JSON.parse",
          "об'єднатиРядки",
          "градусиВРадіани",
          "випадковеЦіле",
          "зіткненняМіж",
          "повнеЗіткнення",
          "відстаньМіж",
          ".довжина",
          ".індексЗаЗначенням",
          ".індексЗаЗначеннямЗКінця",
          ".містить",
          ".масив",
          "Об'єкт.ключі",
          "+Створити",
          "[",
          "]",
          "{",
          "}",
          "()=>",
          "тернарний",
          "+",
          "КодВhtml"
        ]
      },
      "message": {
        "writeText": "Напишіть текст",
        "writeCode": "Напишіть код",
        "writeName": "Назва текстури",
        "writeURL": "Напишіть URL",
        "createFunction": "Створити функцію",
        "createData": "Створити змінну",
        "createPiece": "Створити фрагмент",
        "delete": "Видалити",
        "btns": ["НАЗАД", "ОК"],
        "notRecomended": [
          "Не рекомендується",
          "Використовуйте замість цього URL",
          "Великі зображення оброблюватимуться довго"
        ],
        "alreadyIncledes": [
          "ВЖЕ ІСНУЄ",
          "Починається з числа",
          "Тільки латиниця"
        ]
      },
      "elements": [
        {
          "text": ["Функція name(params)", "Кінець"]
        },
        {
          "text": ["Coment"]
        },
        {
          "text": ["Установіть //a значення 2"]
        },
        {
          "text": ["//code"]
        },
        {
          "text": ["Викликати //name('a')"]
        },
        {
          "text": ["Якщо condition то", "Кінець"]
        },
        {
          "text": ["Якщо condition то", "Інакше", "Кінець"]
        },
        {
          "text": ["показатиПовідомлення(Text)"]
        },
        {
          "text": ["Створити прямокутник myName"],
          "textInWhere":
              "myName: x: myX, y: myY, ширина: myW, висота: myH, напрям: myDir, колір: myColor, радіус: myR, текстура: myIMG"
        },
        {
          "text": ["Створити коло myName"],
          "textInWhere":
              "myName: x: myX, y: myY, радіус: myR, початковийКут(радіан): myS, кінцевийКут(радіан): myE, годинниковаПерегоротка: myCl, колір: myColor"
        },
        {
          "text": ["Цикл Малювання", "Кінець малювання"],
          "textInWhere": "Цикл Малювання (очищати тло: true, Отримати FPS)",
        },
        {
          "text": ["Намалювати //Object, із краєм: undefined"]
        },
        {
          "text": ["Сцена натиснута", "Кінець натиску"],
          "textInWhere":
              "Натиск <span style='font-size:10px;'>(лише по тлу)</span> натиснутийОб'єкт://Object <span style='font-size:10px;'>(не обов'язково)</span>"
        },
        {
          "text": ["Намалювати Текст: myText"],
          "textInWhere":
              "myText: x: myX, y: myY, колір: myColor, стильТексту: myStyle, вирівнювання: myAligned"
        },
        {
          "text": ["Натиск по //Object", "Кінець натиску"],
        },
        {
          "text": ["Встановити //Object myX, myY"],
          "textInWhere": "Встановити координати //Object x: myX, y: myY"
        },
        {
          "text": ["Перемістити //Object X до 100"],
        },
        {
          "text": ["Перемістити //Object Y до 101"],
        },
        {
          "text": ["//Object.ширина = 50"],
        },
        {
          "text": ["//Object.висота = 60"],
        },
        {
          "text": ["//Object.радіус = 30"],
        },
        {
          "text": ["//Object.колір = myColor"],
        },
        {
          "text": ["//Object.напрям = myDirection"],
        },
        {
          "text": ["ЛінійнийГрадієнт myName"],
          "textInWhere":
              "myName:<span style=\"font-size:10px;\">(позиція абсолютна)</span> Початковий X: myX, Початковий Y: myY, Кінцевий X: myfX, Кінцевий Y: myfY, Список кольорів: myColor, Список додатковий точок: points"
        },
        {
          "text": ["КруговийГрадієнт myName"],
          "textInWhere":
              "myName:<span style=\"font-size:10px;\">(позиція абсолютна)</span> Позиція по X першого кола: myX, Y: myY, радіус: myR1, Позиція по X другого кола: myfX, Y: myfY, радіус: myR2, Список кольорів: myColor, Список додатковий точок: points"
        },
        {
          "text": ["РухМиші", "Кінець доторку"],
          "textInWhere":
              "Мишка або доторк рухається, натиснутийОб'єкт://Object<span style='font-size:10px;'>(не обов'язково)</span>"
        },
        {
          "text": ["Кінець руху миші", "Кінець доторку"],
          "textInWhere":
              "Мишка перестала рухатися, натиснутийОб'єкт://Object<span style='font-size:10px;'>(не обов'язково)</span>"
        },
        {
          "text": ["Затримка на some", "Кінець затримки"],
          "textInWhere":
              "Затримка на some мілесекунд <span style='font-size:10px;'>(1s/1000)</span>"
        },
        {
          "text": ["Повторити кожні some ms", "Кінець повторів"],
          "textInWhere":
              "Повторити кожні some мілесекунд <span style='font-size:10px;'>(1s/1000)</span> Назва для повтору: myInterval <span style='font-size:8px;'>Потім ви зможете її зупиняти</span>"
        },
        {
          "text": ["Зупинити повтор myInterval"],
        },
        {
          "text": ["Обрізати texture"],
          "textInWhere":
              "Обрізати texture: Початковий X: myStartX, Початковий Y: myStartY, Ширина обрізання: myWidth, Висота обрізання: myHeight"
        },
        {
          "text": ["//a додати 1 "],
        },
        {
          "text": ["//a помножити на 2 "],
        },
        {
          "text": ["//a поділити на 2 "],
        },
        {
          "text": ["//a = JSON.parse(REALDATA)"],
        },
        {
          "text": ["Повторити 10 раз", "Кінець повтору"],
          "textInWhere": "Повторити 10 раз, номер повтору: index"
        },
        {
          "text": ["В array додати newElement"]
        },
        {
          "text": ["Видалити останній елемент у array"]
        },
        {
          "text": ["Новий перший element у array"]
        },
        {
          "text": ["Видалити перший елемент array"]
        },
        {
          "text": ["array.дляКожного(element, index)", "Кінець повтору"]
        },
        {
          "text": ["В array1 переробити array2", "Кінець переробки"],
          "textInWhere":
              "Новий список: array1, array2.перебір(element, index) <span style='font-size:14px;'>Використовувати з \"Повернути\"</span>"
        },
        {
          "text": ["В array1 відфільтрувати array2", "Кінець фільтрації"],
          "textInWhere":
              "Новий список: array1, array2.фільтрувати(element, index) <span style='font-size:14px;'>Використовувати з \"Повернути\"</span>"
        },
        {
          "text": ["В array1 reduce array2", "Кінець reduce"],
          "textInWhere":
              "Новий список: array1, array2.reduce(previousResult , currentValue, index) <span style='font-size:14px;'>Використовувати з \"Повернути\"</span>"
        },
        {
          "text": ["Видалити some елементів"],
          "textInWhere":
              "На позиції where у array видалити some елементів (метод splice в JS)"
        },
        {
          "text": ["Додати elements в array"],
          "textInWhere":
              "На позиції where у array додати newElements (метод splice в JS)"
        },
        {
          "text": ["array.знайти(element, index)", "Кінець пошуку"],
          "textInWhere":
              "У список: array1, вставити знайдені елементи у array2 (element, index) <span style='font-size:14px;'>Використовувати з \"Повернути\"</span>"
        },
        {
          "text": ["array.знайтиІндекс(element, index)", "End of the find"],
          "textInWhere":
              "У список: array1, вставити індекси знайдених елементів зі списку: array2 (element, index) <span style='font-size:14px;'>Використовувати з \"Повернути\"</span>"
        },
        {
          "text": ["array.сортувати(+)"]
        },
        {
          "text": ["array.вивернути"]
        },
        {
          "text": ["array.перемішати"]
        },
        {
          "text": ["array1 з'єднати з array2"]
        },
        {
          "text": ["Повернути", "Кінець"],
        },
        {
          "text": ["Продовжувати"]
        },
        {
          "text": ["Зупинити"]
        },
        {
          "text": ["Іти //Object HowSteps кроків"],
        },
        {
          "text": ["Збільшити тло X, Y"],
        },
        {
          "text": ["Трансформувати тло X, Y"],
          "textInWhere":
              "Трасформація тла <span style='font-size:14px;'>Горизонтальне масштабування:</span>HSc, <span style='font-size:14px;'>Вертикальний перекіс:</span>VSk, <span style='font-size:14px;'>Горизонтальний перекіс:</span>HSk, <span style='font-size:14px;'>Вертикальне масштабування:</span>VSc, x: X, y: Y"
        },
        {
          "text": ["Повернути тло angle"],
        },
        {
          "text": ["Додати до //Object X 10"],
        },
        {
          "text": ["Додати до //Object Y 10"],
        },
        {
          "text": ["Додати до //Object Ширини 20"],
        },
        {
          "text": ["Додати до //Object Висоти 20"],
        },
        {
          "text": ["Додати до //Object Напрямку 20"],
        },
        {
          "text": ["Object плавноПерейти до endX, endY"],
          "textInWhere":
              "Object Плавно перемістити до x: endX, y: endY за duration мілесекунд<span style='font-size:10px;'>(1s/1000)</span>"
        },
        {
          "text": ["Колір фону: myColor"],
        },
        {
          "text": ["Зберегти variable"],
        },
        {
          "text": ["Прочитати variable"],
        },
        {
          "text": ["Variable видалити з сховища"],
        },
        {
          "text": ["GET метод variable url"],
          "textInWhere": "GET метод, зберегти в variable, посилання: url"
        },
        {
          "text": ["POST метод variable url"],
          "textInWhere":
              "POST метод, зберегти в variable, посилання: url, body: myBODY, headers: myHEADERS"
        },
        {
          "text": ["PUT метод variable url"],
          "textInWhere":
              "PUT метод, зберегти в variable, посилання: url, body: myBODY, headers: myHEADERS"
        },
        {
          "text": ["PATCH метод variable url"],
          "textInWhere":
              "PATCH метод, зберегти в variable, посилання: url, body: myBODY, headers: myHEADERS"
        },
        {
          "text": ["DELETE метод url"]
        },
        {
          "text": ["Створити \"Text\" в HTML"],
          "textInWhere":
              "Створити \"Text\" в HTML(myId), абсолютні координати x: myX y: myY, стиль: myStyle"
        },
        {
          "text": ["Текстове поле(myId)"],
          "textInWhere":
              "Створити Текстове поле(myId), початкові дані: standartValue, підказка: myPlaceholder, максимальнаДовжина: myLenth, стиль: myStyle, зберегти дані у myName, це пароль: isPassword, абсолютні координати x: myX, y: myY"
        },
        {
          "text": ["Слайдер(myId)"],
          "textInWhere":
              "Створити Слайдер(myId), початкові дані: standartValue, мінімальне число: myMIN, максимальне число: myMAX, один крок: oneStep, зберегти дані у myName, стиль: myStyle, абсолютні координати: myX, y: myY"
        },
        {
          "text": ["Палітра(myId)"],
          "textInWhere":
              "Створити палітру(myId), колір: standartValue, зберегти дані у myName, абсолютні координати: myX, y: myY"
        },
        {
          "text": ["Перемикач(myId)"],
          "textInWhere":
              "Створити Перемикач(myId), початкові дані: standartValue, підказка: myHint, зберегти дані у myName, стиль: myStyle, абсолютні координати: myX, y: myY"
        },
        {
          "text": ["Радіо кнопка(myId)"],
          "textInWhere":
              "Створити Радіо кнопку(groupName) id: myId, дані: standartValue, підказка: myHint, зберегти дані у myName, стиль: myStyle, абсолютні координати: myX, y: myY"
        },
        {
          "text": ["Кнопка(myId)"],
          "textInWhere":
              "Створити Кнопку(myId), текст: myText, при натиску виконати: myCode, абсолютні координати: myX, y: myY, стиль: myStyle"
        },
        {
          "text": ["Зображення(myId)"],
          "textInWhere":
              "Створити зображення(myId), текстура: myTexture, абсолютні координати: myX, y: myY, стиль: myStyle"
        },
        {
          "text": ["Видалити HTML елемент myId"]
        },
        {
          "text": ["Встановити object.newProperty 10"]
        },
        {
          "text": ["Додати до object.myProperty -1"]
        }
      ]
    }
  },
  "Russian": {
    "home": {
      "home": {
        "name": "Главная",
        "alert": {
          "text": ["Новый проект", "Импорт"],
          "btns": ["Отмена", "OK"],
          "hint": "Введите название",
          "problem": "Название может содержать только латинские буквы и цифры"
        }
      },
      "view": "Результат",
      "main-settings": {"name": "Настройки", "language": "язык"},
      "project-settings": {
        "change": "Изменить название",
        "saved": "Сохранено в папке",
        "delete": "Удалить проект",
        "just-put": "Создать файл Just Put",
        "html": "Создать HTML-файл",
        "file-saved": "Файл сохранен в /Download/JustPut"
      }
    },
    "html": {
      "name-add-block": "Добавить блок",
      "nav": ["Настройки", "Текстуры", "Кусочки"],
      "main-fab-btn": ["Свойства", "Управление", "Объекты", "Данные", "Старт"],
      "files-fab": ["Рисовать", "Файлы", "URL"],
      "btns-edit-params": ["Код", "Текст", "Ок", "+"],
      "formuls": {
        "group-name": [
          "Данные",
          "СобытиеМыши",
          "Текстуры",
          "Математика",
          "Свойства",
          "Логика",
          "Функция",
          "Мои-функции",
          "Другое"
        ],
        "btns": [
          "+Создать",
          "мышьX",
          "мышьY",
          "столкновениеСКасанием({ ",
          "ТипКлика",
          "Цель",
          "нажатыйЭлемент",
          "hgtrthgfsddfeghj",
          "степень",
          "случайное",
          "корень",
          "синус",
          "косинус",
          "тангенс",
          "асинус",
          "акосинус",
          "атангенс",
          "атангенс2",
          "максимум",
          "минимум",
          "абсолютное",
          "знак",
          "округлениеВверх",
          "округлениеВниз",
          "округление",
          "целаяЧасть",
          "получитьМодуль",
          "логарифм",
          "логарифм10",
          "Пи",
          ".х",
          ".у",
          ".ширина",
          ".высота",
          ".цвет",
          ".радиус",
          ".направление",
          ".начальныйУгол",
          ".конечныйУгол",
          "ШиринаЭкрана",
          "ВысотаЭкрана",
          "=",
          "!=",
          ">",
          "<",
          ">=",
          "<=",
          "и",
          "или",
          "нет",
          "правда",
          "ложь",
          "неопределено",
          "показатьСообщение",
          "запрос",
          "подтвердить",
          "JSON.stringify",
          "JSON.parse",
          "объединитьСтроки",
          "градусыВРадианы",
          "случайноеЦелое",
          "столкновениеМежду",
          "полноеСтолкновение",
          "расстояниеМежду",
          ".длина",
          ".индексПоЗначению",
          ".индексПоЗначениюСКонца",
          ".включает",
          ".массив",
          "Объект.ключи",
          "+Создать",
          "[",
          "]",
          "{",
          "}",
          "()=>",
          "тернарный",
          "+",
          "КодВhtml"
        ]
      },
      "message": {
        "writeText": "Напиши текст",
        "writeCode": "Напиши код",
        "writeName": "Название текстуры",
        "writeURL": "Напиши URL",
        "createFunction": "Создать функцию",
        "createData": "Создать переменную",
        "createPiece": "Создать кусочок",
        "delete": "Удалить",
        "btns": ["ОТМЕНА", "ОК"],
        "notRecomended": [
          "Не рекомендуется",
          "Используйте вместо этого URL",
          "Большие изображения будут обрабатываться долго"
        ],
        "alreadyIncledes": [
          "УЖЕ СУЩЕСТВУЕТ",
          "Начинается с числа",
          "Только латиница"
        ]
      },
      "elements": [
        {
          "text": ["Функция name(params)", "Конец"]
        },
        {
          "text": ["Coment"]
        },
        {
          "text": ["Установить //a значение 2"]
        },
        {
          "text": ["//code"]
        },
        {
          "text": ["Вызвать //name('a')"]
        },
        {
          "text": ["Если condition то", "Конец"]
        },
        {
          "text": ["Если condition то", "Иначе", "Конец"]
        },
        {
          "text": ["показатьСообщение(Text)"]
        },
        {
          "text": ["Создать прямоугольник myName"],
          "textInWhere":
              "myName: x: myX, y: myY, ширина: myW, высота: myH, направление: myDir, цвет: myColor, радиус: myR, текстура: myIMG"
        },
        {
          "text": ["Создать круг myName"],
          "textInWhere":
              "myName: x: myX, y: myY, радиус: myR, начальныйУгол(радиан): myS, конечныйУгол(радиан): myE, часоваяПерегоротка: myCl, цвет: myColor"
        },
        {
          "text": ["Цикл Рисование", "Конец рисования"],
          "textInWhere": "Цикл Рисование (очищать фон: true, Получить FPS)",
        },
        {
          "text": ["Нарисовать //Object, с границей: undefined"]
        },
        {
          "text": ["Сцена нажата", "Конец нажатия"],
          "textInWhere":
              "Нажатие <span style='font-size:10px;'>(только по фону)</span> нажатыйОбъект://Object <span style='font-size:10px;'>(необязательно)</span>"
        },
        {
          "text": ["Нарисовать Текст: myText"],
          "textInWhere":
              "myText: x: myX, y: myY, цвет: myColor, стильТекста: myStyle, выравнивание: myAligned"
        },
        {
          "text": ["Нажатие по //Object", "Конец нажатия"],
        },
        {
          "text": ["Установить //Object myX, myY"],
          "textInWhere": "Установить координаты //Object x: myX, y: myY"
        },
        {
          "text": ["Переместить //Object X до 100"],
        },
        {
          "text": ["Переместить //Object Y до 101"],
        },
        {
          "text": ["//Object.ширина = 50"],
        },
        {
          "text": ["//Object.высота = 60"],
        },
        {
          "text": ["//Object.радиус = 30"],
        },
        {
          "text": ["//Object.цвет = myColor"],
        },
        {
          "text": ["//Object.направление = myDirection"],
        },
        {
          "text": ["ЛинейныйГрадиент myName"],
          "textInWhere":
              "myName:<span style=\"font-size:10px;\">(позиция абсолютна)</span> Первоначальное X: myX, Первоначальное Y: myY, Конечное X: myfX, Конечное Y: myfY, Список цветов: myColor, Список дополнительных точек: points"
        },
        {
          "text": ["КруговыйГрадиент myName"],
          "textInWhere":
              "myName:<span style=\"font-size:10px;\">(позиция абсолютна)</span> Позиция по X первого круга: myX, Y: myY, радиус: myR1, Позиция по X второго круга: myfX, Y: myfY, радиус: myR2, Список цветов: myColor, Список дополнительных точек: points"
        },
        {
          "text": ["ДвижениеМыши", "Конец касания"],
          "textInWhere":
              "Мышь или касание движется, нажатыйОбъект://Object<span style='font-size:10px;'>(не обязательно)</span>"
        },
        {
          "text": ["Конец движения мыши", "Конец касания"],
          "textInWhere":
              "Мышь перестала двигаться, нажатыйОбъект://Object<span style='font-size:10px;'>(не обязательно)</span>"
        },
        {
          "text": ["Задержка на some", "Конец задержки"],
          "textInWhere":
              "Задержка на some миллисекунд <span style='font-size:10px;'>(1с/1000)</span>"
        },
        {
          "text": ["Повторять каждые some мс", "Конец повторов"],
          "textInWhere":
              "Повторять каждые some миллисекунд <span style='font-size:10px;'>(1с/1000)</span> Название для повтора: myInterval <span style='font-size:8px;'>Затем вы сможете его останавливать</span>"
        },
        {
          "text": ["Остановить повтор myInterval"],
        },
        {
          "text": ["Обрезать texture"],
          "textInWhere":
              "Обрезать texture: Первоначальное X: myStartX, Первоначальное Y: myStartY, Ширина обрезания: myWidth, Высота обрезания: myHeight"
        },
        {
          "text": ["//a добавить 1 "],
        },
        {
          "text": ["//a умножить на 2 "],
        },
        {
          "text": ["//a разделить на 2 "],
        },
        {
          "text": ["//a = JSON.parse(REALDATA)"],
        },
        {
          "text": ["Повторить 10 раз", "Конец повтора"],
          "textInWhere": "Повторить 10 раз, номер повтора: index"
        },
        {
          "text": ["В array добавить newElement"]
        },
        {
          "text": ["Удалить последний элемент в array"]
        },
        {
          "text": ["Новый первый element в array"]
        },
        {
          "text": ["Удалить первый элемент array"]
        },
        {
          "text": ["array.дляКаждого(element, index)", "Конец повтора"]
        },
        {
          "text": ["В array1 преобразовать array2", "Конец преобразования"],
          "textInWhere":
              "Новый список: array1, array2.перебор(element, index) <span style='font-size:14px;'>Использовать с \"Вернуть\"</span>"
        },
        {
          "text": ["В array1 отфильтровать array2", "Конец фильтрации"],
          "textInWhere":
              "Новый список: array1, array2.фильтровать(element, index) <span style='font-size:14px;'>Использовать с \"Вернуть\"</span>"
        },
        {
          "text": ["В array1 reduce array2", "Конец reduce"],
          "textInWhere":
              "Новый список: array1, array2.reduce(previousResult , currentValue, index) <span style='font-size:14px;'>Использовать с \"Вернуть\"</span>"
        },
        {
          "text": ["Удалить some элементы"],
          "textInWhere":
              "На позиции where в array удалить некоторые элементы (метод splice в JS)"
        },
        {
          "text": ["Добавить elements в array"],
          "textInWhere":
              "На позицию where в array добавить newElements (метод splice в JS)"
        },
        {
          "text": ["array.найти(element, index)", "Конец поиска"],
          "textInWhere":
              "В список: array1, вставить найденные элементы в array2 (element, index) <span style='font-size:14px;'>Использовать с \"Вернуть\"</span>"
        },
        {
          "text": ["array.найтиИндекс(element, index)", "End of the find"],
          "textInWhere":
              "В список: array1, вставить индексы найденных элементов из списка: array2 (element, index) <span style='font-size:14px;'>Использовать с \"Вернуть\"</span>"
        },
        {
          "text": ["array.сортировать(+)"]
        },
        {
          "text": ["array.развернуть"]
        },
        {
          "text": ["array.перемешать"]
        },
        {
          "text": ["array1 соединить с array2"]
        },
        {
          "text": ["Вернуть", "Конец"],
        },
        {
          "text": ["Продолжать"]
        },
        {
          "text": ["Остановить"]
        },
        {
          "text": ["Идти //Object HowSteps шагов"],
        },
        {
          "text": ["Увеличить фон X, Y"],
        },
        {
          "text": ["Трансформировать фон X, Y"],
          "textInWhere":
              "Трансформация фона <span style='font-size:14px;'>Горизонтальное масштабирование:</span>HSc, <span style='font-size:14px;'>Вертикальный наклон:</span>VSk, <span style='font-size:14px;'>Горизонтальный наклон:</span>HSk, <span style='font-size:14px;'>Вертикальное масштабирование:</span>VSc, x: X, y: Y"
        },
        {
          "text": ["Повернуть фон angle"],
        },
        {
          "text": ["Добавить к //Объект X 10"],
        },
        {
          "text": ["Добавить к //Объект Y 10"],
        },
        {
          "text": ["Добавить к //Объект Ширины 20"],
        },
        {
          "text": ["Добавить к //Объект Высоты 20"],
        },
        {
          "text": ["Добавить к //Объект Направления 20"],
        },
        {
          "text": ["Object плавноПерейти до endX, endY"],
          "textInWhere":
              "Object Плавно переместить до x: endX, y: endY за продолжительность миллисекунд<span style='font-size:10px;'>(1s/1000)</span>"
        },
        {
          "text": ["Цвет фона: myColor"],
        },
        {
          "text": ["Сохранить variable"],
        },
        {
          "text": ["Прочитать variable"],
        },
        {
          "text": ["Переменную variable из хранилища"],
        },
        {
          "text": ["GET метод variable url"],
          "textInWhere": "GET метод, сохранить в variable, ссылка: url"
        },
        {
          "text": ["POST метод variable url"],
          "textInWhere":
              "POST метод, сохранить в variable, ссылка: url, тело: myBODY, заголовки: myHEADERS"
        },
        {
          "text": ["PUT метод variable url"],
          "textInWhere":
              "PUT метод, сохранить в variable, ссылка: url, тело: myBODY, заголовки: myHEADERS"
        },
        {
          "text": ["PATCH метод variable url"],
          "textInWhere":
              "PATCH метод, сохранить в variable, ссылка: url, тело: myBODY, заголовки: myHEADERS"
        },
        {
          "text": ["DELETE метод url"]
        },
        {
          "text": ["Создать \"Text\" в HTML"],
          "textInWhere":
              "Создать \"Text\" в HTML(myId), абсолютные координаты x: myX y: myY, стиль: myStyle"
        },
        {
          "text": ["Текстовое поле(myId)"],
          "textInWhere":
              "Создать Текстовое поле(myId), начальные данные: standartValue, подсказка: myPlaceholder, максимальнаяДлина: myLenth, стиль: myStyle, сохранить данные в myName, это пароль: isPassword, абсолютные координаты x: myX, y: myY"
        },
        {
          "text": ["Слайдер(myId)"],
          "textInWhere":
              "Создать Слайдер(myId), начальные данные: standartValue, минимальное число: myMIN, максимальное число: myMAX, один шаг: oneStep, сохранить данные в myName, стиль: myStyle, абсолютные координаты: myX, y: myY"
        },
        {
          "text": ["Палитра(myId)"],
          "textInWhere":
              "Создать палитру(myId), цвет: standartValue, сохранить данные в myName, абсолютные координаты: myX, y: myY"
        },
        {
          "text": ["Переключатель(myId)"],
          "textInWhere":
              "Создать Переключатель(myId), начальные данные: standartValue, подсказка: myHint, сохранить данные в myName, стиль: myStyle, абсолютные координаты: myX, y: myY"
        },
        {
          "text": ["Радио кнопка(myId)"],
          "textInWhere":
              "Создать Радио кнопку(groupName) id: myId, данные: standartValue, подсказка: myHint, сохранить данные в myName, стиль: myStyle, абсолютные координаты: myX, y: myY"
        },
        {
          "text": ["Кнопка(myId)"],
          "textInWhere":
              "Создать Кнопку(myId), текст: myText, при нажатии выполнить: myCode, абсолютные координаты: myX, y: myY, стиль: myStyle"
        },
        {
          "text": ["Изображение(myId)"],
          "textInWhere":
              "Создать изображение(myId), текстура: myTexture, абсолютные координаты: myX, y: myY, стиль: myStyle"
        },
        {
          "text": ["Удалить HTML элемент myId"]
        },
        {
          "text": ["Установить object.newProperty 10"]
        },
        {
          "text": ["Добавить к object.myProperty -1"]
        }
      ]
    }
  },
};
