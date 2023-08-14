const ukrainianLanguage = {
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
    "main-settings": {
      "name": "Налаштування",
      "language": "мова",
      "topPanel": "Верхня панель у результаті",
    },
    "project-settings": {
      "change": "Змінити назву",
      "saved": "Збережено у папці",
      "delete": "Видалити проект",
      "just-put": "Створити файл Just Put",
      "html": "Створити HTML-файл",
      "file-saved": "Файл збережено у /Download/JustPut",
    },
    "paint": {
      "name": "Малювати",
      "option-list": ["Масштаб", "Колір", "Параметри", "Фігури"],
      "start-dialog": {
        "title": "Розмір полотна",
        "inputs": ["Ширина", "Висота"],
        "btn": "Застосувати"
      },
      "leaving-dialog": {
        "title": "Ви дійсно хочете вийти?",
        "btns": ["Ні", "Так"]
      }
    }
  },
  "html": {
    "name-add-block": "Додати блок",
    "nav": ["Налаштування", "Файли", "Фрагменти"],
    "main-fab-btn": ["Властивості", "Керування", "Об'єкти", "Дані", "Старт"],
    "files-fab": ["Музика", "Малювати", "Файли", "URL"],
    "btns-edit-params": ["Код", "Текст", "ОК", "+"],
    "formuls": {
      "group-name": [
        "Дані",
        "ПодіїМиші",
        "Файли",
        "Математика",
        "Властивості",
        "Логіка",
        "Функція",
        "Мої-функції",
        "Інше"
      ],
      "btns": [
        "+Створити",
        "позиціяМиші",
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
        ".тривалість",
        ".поточнийЧас",
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
        "ні ",
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
      "writeName": "Введи назву",
      "writeURL": "Напишіть URL",
      "createFunction": "Створити функцію",
      "createData": "Створити змінну",
      "createPiece": "Створити фрагмент",
      "delete": "Видалити",
      "edit": "Змінити",
      "isAudio": "Чи це аудіо?",
      "btns": ["НАЗАД", "ОК"],
      "notRecomended": [
        "Не рекомендується",
        "Використовуйте замість цього URL",
        "Великі зображення та аудіо оброблюватимуться довго"
      ],
      "alreadyIncledes": ["ВЖЕ ІСНУЄ", "Починається з числа", "Тільки латиниця"]
    },
    "elements": [
      {
        "text": ["Функція name(params)", "Кінець"]
      },
      {
        "text": ["Coment"]
      },
      {
        "text": ["Встановити //a значення 2"]
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
        "text": ["Якщо condition, інакше", "Інакше", "Кінець"]
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
            "myName: x: myX, y: myY, радіус: myR, початковийКут(радіан): myS, кінцевийКут(радіан): myE, годинниковаПерегоротка: myCl, колір: myColor, напрям: myDir"
      },
      {
        "text": ["Цикл Малювання", "Кінець малювання"],
        "textInWhere": "Цикл Малювання (очищати тло: true, Отримати FPS)",
      },
      {
        "text": ["Намалювати //Object"],
        "textInWhere":
            "Намалювати //Object, із краєм: undefined, прозорість: 'one'",
      },
      {
        "text": ["Сцена натиснута", "Кінець натиску"],
        "textInWhere":
            "Натиск <span style='font-size:10px;'>(лише по тлу)</span> натиснутийОб'єкт://Object <span style='font-size:10px;'>(не обов'язково)</span>"
      },
      {
        "text": ["Намалювати Текст: myText"],
        "textInWhere":
            "myText: x: myX, y: myY, колір: myColor, стильТексту: myStyle, вирівнювання: myAligned, прозорість: myOpacity"
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
        "text": ["Затримка на some мс", "Кінець затримки"],
        "textInWhere":
            "Затримка на some мілесекунд <span style='font-size:10px;'>(1s/1000)</span>"
      },
      {
        "text": ["Повторити кожні some ms", "Кінець повторів"],
        "textInWhere":
            "Повторити кожні some мілесекунд <span style='font-size:10px;'>(1s/1000)</span> Назва для повтору: myInterval <span style='font-size:8px;'>Потім ви зможете його зупиняти</span>"
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
            "На позиції where у array додати elements (метод splice в JS)"
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
        "text": ["плавноПеремістити myName до endX, endY"],
        "textInWhere":
            "myName Плавно перемістити до x: endX, y: endY за duration мілесекунд<span style='font-size:10px;'>(1s/1000)</span>"
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
        "text": ["Object.newProperty = 10"]
      },
      {
        "text": ["Додати до object.myProperty -1"]
      },
      {
        "text": ["Object.текстура = myIMG"]
      },
      {
        "text": ["Початок натиску", "Кінець натиску"],
        "textInWhere":
            "Початок натиску натиснутийОб'єкт://Object <span style='font-size:10px;'>(не обов'язково)</span>"
      },
      {
        "text": ["Порожній список //a"],
      },
      {
        "text": ["Відтворити MyAudio"],
        "textInWhere": "Відтворити MyAudio, час початку: StartTime"
      },
      {
        "text": ["Зупинити MyAudio"],
      },
      {
        "text": ["Гучність MyAudio 50%"],
      },
      {
        "text": ["Вимкнути звук MyAudio true"]
      },
      {
        "text": ["MyAudio зупинилось", "Кінець"]
      },
      {
        "text": ["//Object.розмір = 100px"],
      },
      {
        "text": ["Продовжити кусочок Main"],
      },
      {
        "text": ["myId.значення = newValue"],
      }
    ]
  }
};
