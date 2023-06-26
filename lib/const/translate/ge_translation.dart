const germanLanguage = {
  "home": {
    "home": {
      "name": "Startseite",
      "alert": {
        "text": ["Neues Projekt", "Import"],
        "btns": ["Abbrechen", "OK"],
        "hint": "Geben Sie einen Namen ein",
        "problem":
            "Der Name darf nur aus lateinischen Buchstaben und Zahlen bestehen"
      }
    },
    "view": "Ergebnis",
    "main-settings": {"name": "Einstellungen", "language": "Sprache"},
    "project-settings": {
      "change": "Namen ändern",
      "saved": "Gespeichert in Ordner",
      "delete": "Projekt löschen",
      "just-put": "JustPut-Datei erstellen",
      "html": "HTML-Datei erstellen",
      "file-saved": "Datei gespeichert unter /Download/JustPut",
    },
    "paint": {
      "name": "Malen",
      "option-list": ["Zoomen", "Farbe", "Optionen", "Formen"],
      "start-dialog": {
        "title": "Leinwandgröße",
        "inputs": ["Breite", "Höhe"],
        "btn": "Bestätigen"
      },
      "leaving-dialog": {
        "title": "Möchten Sie beenden?",
        "btns": ["NEIN", "JA"],
      }
    }
  },
  "html": {
    "name-add-block": "Block hinzufügen",
    "nav": ["Einstellungen", "Dateien", "Fragments"],
    "main-fab-btn": ["Eigenschaften", "Steuerung", "Objekte", "Daten", "Start"],
    "files-fab": ["Musik", "Zeichnen", "Dateien", "URL"],
    "btns-edit-params": ["Code", "Text", "OK", "+"],
    "formuls": {
      "group-name": [
        "Daten",
        "Mausereignisse",
        "Dateien",
        "Mathematik",
        "Eigenschaften",
        "Logik",
        "Funktion",
        "Meine Funktionen",
        "Sonstiges"
      ],
      "btns": [
        "+Erstellen",
        "Mausposition",
        "MausX",
        "MausY",
        "Kollision mit Berührung({",
        "Klicktyp",
        "Ziel",
        "Angeklicktes Objekt",
        "hgtrthgfsddfeghj",
        "Potenz",
        "Zufällige",
        "Wurzel",
        "Sinus",
        "Kosinus",
        "Tangens",
        "Arcussinus",
        "Arcuskosinus",
        "Arcustangens",
        "Arcustangens2",
        "Maximum",
        "Minimum",
        "Absolutwert",
        "Vorzeichen",
        "Aufrunden",
        "Abrunden",
        "Runden",
        "Ganzzahliger Teil",
        "Betrag erhalten",
        "Logarithmus",
        "Logarithmus10",
        "Pi",
        ".x",
        ".y",
        ".Breite",
        ".Höhe",
        ".Farbe",
        ".Radius",
        ".Richtung",
        ".Startwinkel",
        ".Endwinkel",
        "Bildschirmbreite",
        "Bildschirmhöhe",
        "=",
        "!=",
        ">",
        "<",
        ">=",
        "<=",
        "und",
        "oder",
        "nicht",
        "wahr",
        "falsch",
        "undefiniert",
        "Nachricht anzeigen",
        "Anfrage",
        "Bestätigen",
        "JSON.stringify",
        "JSON.parse",
        "Zeichenketten verbinden",
        "Grad in Radiant",
        "Zufällige Ganzzahl",
        "Kollision zwischen",
        "Vollständige Kollision",
        "Entfernung zwischen",
        ".Länge",
        ".Index nach Wert",
        ".Index nach Wert vom Ende",
        ".Enthält",
        ".istArray",
        "Objekt.Keys",
        "+Erstellen",
        "[",
        "]",
        "{",
        "}",
        "()=>",
        "Bedingter",
        "+",
        "Code in HTML"
      ]
    },
    "message": {
      "writeText": "Schreiben Sie den Text",
      "writeCode": "Schreiben Sie den Code",
      "writeName": "Schreiben Sie den Name",
      "writeURL": "Schreiben Sie die URL",
      "createFunction": "Funktion erstellen",
      "createData": "Variable erstellen",
      "createPiece": "Fragment erstellen",
      "delete": "Löschen",
      "isAudio": "Ist das ein Audio?",
      "btns": ["ZURÜCK", "OK"],
      "notRecomended": [
        "Nicht empfohlen",
        "Verwenden Sie anstelle davon die URL",
        "Große Bilder benötigen lange Verarbeitungszeit"
      ],
      "alreadyIncledes": [
        "BEREITS VORHANDEN",
        "Beginnt mit einer Zahl",
        "Nur lateinische Zeichen"
      ]
    },
    "elements": [
      {
        "text": ["Funktion name(params)", "Ende"]
      },
      {
        "text": ["Coment"]
      },
      {
        "text": ["Setzen //a Wert 2"]
      },
      {
        "text": ["//code"]
      },
      {
        "text": ["Aufruf //name('a')"]
      },
      {
        "text": ["Wenn condition dann", "Ende"]
      },
      {
        "text": ["Wenn condition, sonst", "Sonst, Ende"]
      },
      {
        "text": ["Zeige Nachricht (Text)"]
      },
      {
        "text": ["Erstelle Rechteck myName"],
        "textInWhere":
            "myName: x: myX, y: myY, Breite: myW, Höhe: myH, Ausrichtung: myDir, Farbe: myColor, Radius: myR, Textur: myIMG"
      },
      {
        "text": ["Erstelle Kreis myName"],
        "textInWhere":
            "myName: x: myX, y: myY, Radius: myR, Startwinkel(Bogenmaß): myS, Endwinkel(Bogenmaß): myE, Uhrzeigersinn-Drehung: myCl, Farbe: myColor, Ausrichtung: myDir"
      },
      {
        "text": ["Mal-Schleife", "Ende Mal-Schleife"],
        "textInWhere": "Mal-Schleife (Hintergrund löschen: true, FPS abrufen)",
      },
      {
        "text": ["Zeichne //Object"],
        "textInWhere": "Zeichne //Object, mit Rand: undefined",
      },
      {
        "text": ["Szene berührt", "Ende Berührung"],
        "textInWhere":
            "Berühren <span style='font-size:10px;'>(nur auf Hintergrund)</span> Berührtes Objekt: //Object <span style='font-size:10px;'>(optional)</span>"
      },
      {
        "text": ["Zeichne Text: myText"],
        "textInWhere":
            "myText: x: myX, y: myY, Farbe: myColor, Textstil: myStyle, Ausrichtung: myAligned"
      },
      {
        "text": ["Berührung von //Object", "Ende Berührung"],
      },
      {
        "text": ["Setze //Object myX, myY"],
        "textInWhere": "Setze Koordinaten von //Object x: myX, y: myY"
      },
      {
        "text": ["Bewege //Object nach X 100"],
      },
      {
        "text": ["Bewege //Object nach Y 101"],
      },
      {
        "text": ["//Object.Breite = 50"],
      },
      {
        "text": ["//Object.Höhe = 60"],
      },
      {
        "text": ["//Object.Radius = 30"],
      },
      {
        "text": ["//Object.Farbe = myColor"],
      },
      {
        "text": ["//Object.Ausrichtung = myDirection"],
      },
      {
        "text": ["Linearer Farbverlauf myName"],
        "textInWhere":
            "myName:<span style='font-size:10px;'>(Position absolut)</span> Start-X: myX, Start-Y: myY, Ende-X: myfX, Ende-Y: myfY, Farbliste: myColor, Zusätzliche Punkte-Liste: points"
      },
      {
        "text": ["Radialer Farbverlauf myName"],
        "textInWhere":
            "myName:<span style='font-size:10px;'>(Position absolut)</span> X-Position des ersten Kreises: myX, Y-Position: myY, Radius: myR1, X-Position des zweiten Kreises: myfX, Y-Position: myfY, Radius: myR2, Farbliste: myColor, Zusätzliche Punkte-Liste: points"
      },
      {
        "text": ["Mausbewegung", "Ende Berührung"],
        "textInWhere":
            "Maus oder Berührung bewegt sich, Berührtes Objekt: //Object<span style='font-size:10px;'>(optional)</span>"
      },
      {
        "text": ["Ende Mausbewegung", "Ende Berührung"],
        "textInWhere":
            "Mausbewegung endet, Berührtes Objekt: //Object<span style='font-size:10px;'>(optional)</span>"
      },
      {
        "text": ["Warte some ms", "Ende Warten"],
        "textInWhere":
            "Warte some Millisekunden <span style='font-size:10px;'>(1s/1000)</span>"
      },
      {
        "text": ["Wiederholen Sie alle some ms", "Ende der Wiederholungen"],
        "textInWhere":
            "Wiederholen Sie alle some Millisekunden <span style='font-size:10px;'>(1s/1000)</span> Wiederholungsname: myInterval <span style='font-size:8px;'>Sie können es später stoppen</span>"
      },
      {
        "text": ["Stop die Wiederholung myInterval"],
      },
      {
        "text": ["Beschneiden Sie die Textur"],
        "textInWhere":
            "Beschneiden Sie die Textur: Start-X: myStartX, Start-Y: myStartY, Beschneidungsbreite: myWidth, Beschneidungshöhe: myHeight"
      },
      {
        "text": ["//a hinzufügen 1 "],
      },
      {
        "text": ["//a mit 2 multiplizieren "],
      },
      {
        "text": ["//a durch 2 teilen "],
      },
      {
        "text": ["//a = JSON.parse(REALDATA)"],
      },
      {
        "text": ["Wiederholen Sie 10 Mal", "Ende der Wiederholung"],
        "textInWhere": "Wiederholen Sie 10 Mal, Wiederholungsnummer: index"
      },
      {
        "text": ["In array ergänzen newElement"]
      },
      {
        "text": ["Entferne letzte Element aus dem array"]
      },
      {
        "text": ["Neues erstes element im array"]
      },
      {
        "text": ["Entferne erste Element aus dem array"]
      },
      {
        "text": ["array.fürJedes(element, index)", "Ende der Wiederholung"]
      },
      {
        "text": ["array1 neu bearbeiten mit array2", "Ende der Bearbeitung"],
        "textInWhere":
            "Neue Liste: array1, array2.durchgehen(element, index) <span style='font-size:14px;'>Verwenden Sie 'Rückgabe'</span>"
      },
      {
        "text": ["array1 mit array2 filtern", "Ende der Filterung"],
        "textInWhere":
            "Neue Liste: array1, array2.filtern(element, index) <span style='font-size:14px;'>Verwenden Sie 'Rückgabe'</span>"
      },
      {
        "text": ["array1 reduzieren mit array2", "Ende der Reduzierung"],
        "textInWhere":
            "Neue Liste: array1, array2.reduzieren(previousResult , currentValue, index) <span style='font-size:14px;'>Verwenden Sie 'Rückgabe'</span>"
      },
      {
        "text": ["Entferne some Elemente"],
        "textInWhere":
            "An Position where im array Entferne some Elemente (splice-Methode in JS)"
      },
      {
        "text": ["Füge elements in das array ein"],
        "textInWhere":
            "An Position where füge im array elements (splice-Methode in JS)"
      },
      {
        "text": ["array.finden(element, index)", "Ende der Suche"],
        "textInWhere":
            "In der Liste: array1, füge die gefundenen Elemente in array2 ein (element, index) <span style='font-size:14px;'>Verwenden Sie 'Rückgabe'</span>"
      },
      {
        "text": ["array.findenIndex(element, index)", "Ende der Suche"],
        "textInWhere":
            "In der Liste: array1, füge die Indizes der gefundenen Elemente aus der Liste: array2 ein (element, index) <span style='font-size:14px;'>Verwenden Sie 'Rückgabe'</span>"
      },
      {
        "text": ["array.sortieren(+)"]
      },
      {
        "text": ["array.umdrehen"]
      },
      {
        "text": ["array.mischen"]
      },
      {
        "text": ["array1 mit array2 verbinden"]
      },
      {
        "text": ["Rückgabe, Ende"],
      },
      {
        "text": ["Fortsetzen"]
      },
      {
        "text": ["Stoppen"]
      },
      {
        "text": ["Gehe //Objekt HowSteps Schritte"],
      },
      {
        "text": ["Hintergrund X, Y vergrößern"],
      },
      {
        "text": ["Transformiere Hintergrund X, Y"],
        "textInWhere":
            "Hintergrund-Transformation <span style='font-size:14px;'>Horizontale Skalierung:</span>HSc, <span style='font-size:14px;'>Vertikale Schräglage:</span>VSk, <span style='font-size:14px;'>Horizontale Schräglage:</span>HSk, <span style='font-size:14px;'>Vertikale Skalierung:</span>VSc, x: X, y: Y"
      },
      {
        "text": ["Dreh Hintergrund angle"],
      },
      {
        "text": ["Füge zu //Objekt X 10"],
      },
      {
        "text": ["Füge zu //Objekt Y 10"],
      },
      {
        "text": ["Füge zu //Objekt Breite 20"],
      },
      {
        "text": ["Füge zu //Objekt Höhe 20"],
      },
      {
        "text": ["Füge zu //Objekt Richtung 20"],
      },
      {
        "text": ["GlattBewegen myName nach endX, endY"],
        "textInWhere":
            "myName glatt bewegen nach x: endX, y: endY für duration Millisekunden<span style='font-size:10px;'>(1s/1000)</span>"
      },
      {
        "text": ["Hintergrundfarbe: myColor"],
      },
      {
        "text": ["variable speichern"],
      },
      {
        "text": ["variable lesen"],
      },
      {
        "text": ["Variable aus dem Speicher löschen"],
      },
      {
        "text": ["GET Methode variable url"],
        "textInWhere": "GET Methode, speichern in variable, Link: url"
      },
      {
        "text": ["POST Methode variable url"],
        "textInWhere":
            "POST Methode, speichern in variable, Link: url, Body: myBODY, Headers: myHEADERS"
      },
      {
        "text": ["PUT Methode variable url"],
        "textInWhere":
            "PUT Methode, speichern in variable, Link: url, Body: myBODY, Headers: myHEADERS"
      },
      {
        "text": ["PATCH Methode variable url"],
        "textInWhere":
            "PATCH Methode, speichern in variable, Link: url, Body: myBODY, Headers: myHEADERS"
      },
      {
        "text": ["DELETE Methode url"]
      },
      {
        "text": ["\"Text\" in HTML erstellen"],
        "textInWhere":
            "\"Text\" in HTML erstellen (myId), absolute Koordinaten x: myX, y: myY, Stil: myStyle"
      },
      {
        "text": ["Textfeld(myId)"],
        "textInWhere":
            "Textfeld (myId), Startdaten: standartValue, Hinweis: myPlaceholder, Maximale Länge: myLength, Stil: myStyle, Daten in myName speichern, ist Passwort: isPassword, absolute Koordinaten x: myX, y: myY"
      },
      {
        "text": ["Schieberegler(myId)"],
        "textInWhere":
            "Schieberegler (myId), Startdaten: standartValue, Mindestwert: myMIN, Maximalwert: myMAX, ein Schritt: oneStep, Daten in myName speichern, Stil: myStyle, absolute Koordinaten: myX, y: myY"
      },
      {
        "text": ["Farbpalette(myId)"],
        "textInWhere":
            "Farbpalette (myId), Farbe: standartValue, Daten in myName speichern, absolute Koordinaten: myX, y: myY"
      },
      {
        "text": ["Schalter(myId)"],
        "textInWhere":
            "Schalter (myId), Startdaten: standartValue, Hinweis: myHint, Daten in myName speichern, Stil: myStyle, absolute Koordinaten: myX, y: myY"
      },
      {
        "text": ["Radio knopf(myId)"],
        "textInWhere":
            "Erstelle eine radio knopf(groupName) mit der ID: myId, Daten: standartValue, Hinweis: myHint, speichere Daten in myName, Stil: myStyle, absolute Koordinaten: myX, y: myY"
      },
      {
        "text": ["Taste(myId)"],
        "textInWhere":
            "Erstelle eine Taste(myId) mit dem Text: myText, beim Klicken führe aus: myCode, absolute Koordinaten: myX, y: myY, Stil: myStyle"
      },
      {
        "text": ["Bild(myId)"],
        "textInWhere":
            "Erstelle ein Bild(myId) mit der Textur: myTexture, absolute Koordinaten: myX, y: myY, Stil: myStyle"
      },
      {
        "text": ["HTML-Element myId löschen"]
      },
      {
        "text": ["Object.newProperty = 10"]
      },
      {
        "text": ["Füge object.myProperty -1 hinzu"]
      },
      {
        "text": ["Object.textur = myIMG"]
      },
      {
        "text": ["Beginn des Klicks", "Ende des Klicks"],
        "textInWhere":
            "Beginn des Klicks, geklicktes Objekt: //Object <span style='font-size:10px;'>(optional)</span>"
      },
      {
        "text": ["Leere Liste //a"],
      },
      {
        "text": ["MyAudio abspielen"],
        "textInWhere": "MyAudio abspielen, Startzeit: StartTime"
      },
      {
        "text": ["MyAudio stoppen"],
      },
      {
        "text": ["MyAudio Lautstärke auf 50% einstellen"],
      },
    ]
  }
};
