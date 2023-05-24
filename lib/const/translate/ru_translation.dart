const russianLanguage = {
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
        "text": ["Если condition, иначе", "Иначе", "Конец"]
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
        "text": ["Нарисовать //Object"],
        "textInWhere": "Нарисовать //Object, с границей: undefined",
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
        "text": ["Задержка на some мс", "Конец задержки"],
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
            "На позиции where в array удалить some элементы (метод splice в JS)"
      },
      {
        "text": ["Добавить elements в array"],
        "textInWhere":
            "На позицию where в array добавить elements (метод splice в JS)"
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
        "text": ["Добавить к //Object X 10"],
      },
      {
        "text": ["Добавить к //Object Y 10"],
      },
      {
        "text": ["Добавить к //Object Ширины 20"],
      },
      {
        "text": ["Добавить к //Object Высоты 20"],
      },
      {
        "text": ["Добавить к //Object Направления 20"],
      },
      {
        "text": ["Object плавноПерейти до endX, endY"],
        "textInWhere":
            "Object Плавно переместить до x: endX, y: endY за duration миллисекунд<span style='font-size:10px;'>(1s/1000)</span>"
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
        "text": ["Удалить Variable из хранилища"],
      },
      {
        "text": ["GET метод variable url"],
        "textInWhere": "GET метод, сохранить в variable, ссылка: url"
      },
      {
        "text": ["POST метод variable url"],
        "textInWhere":
            "POST метод, сохранить в variable, ссылка: url, body: myBODY, headers: myHEADERS"
      },
      {
        "text": ["PUT метод variable url"],
        "textInWhere":
            "PUT метод, сохранить в variable, ссылка: url, body: myBODY, headers: myHEADERS"
      },
      {
        "text": ["PATCH метод variable url"],
        "textInWhere":
            "PATCH метод, сохранить в variable, ссылка: url, body: myBODY, headers: myHEADERS"
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
};
