Array.from(document.querySelector("#tree").children).forEach(
  (element) =>
    (element.onclick = () => {
      element.classList.toggle("LiAfterTap");
    })
);

function openParams(event) {
  whichPosition = 0;
  editingElement = event.target.closest(".ElementsInEditor");
  idOfElement = editingElement.dataset.id;

  if (!ListOfElements[idOfElement].listChengers) {
    /*===== Element is not have parameter (return, continue) */
    return;
  }

  TextInWhereOnStart = appLanguage["elements"][idOfElement].text[0];
  if (appLanguage["elements"][idOfElement].textInWhere) {
    /*===== Sometime the text of Element is more longer than right version */
    TextInWhereOnStart = appLanguage["elements"][idOfElement].textInWhere;
  }

  listOfChageParams = ListOfElements[idOfElement].listChengers;
  List = JSON.parse(editingElement.dataset.parameter);
  if (listOfChageParams.length > List.length) {
    /*===== New version can have more element in listOfChageParams */
    if (!List) {
      List = [];
    }
    for (let i = 0; i < listOfChageParams.length - List.length; i++) {
      List.push(ListOfElements[idOfElement].standartParameter[List.length + i]);
    }
  }

  where.scrollTo(0, 0);
  document.querySelector("#tree").scrollTo(0, 0);

  onStart();

  /* close all element in formulas */
  document.querySelectorAll(".LiAfterTap").forEach((i) => {
    i.classList.remove("LiAfterTap");
  });

  /* Add style to where */
  editparams.querySelector("#where").style.backgroundColor =
    mainColors[ListOfElements[idOfElement].color];

  /* Does Element work with texure? */
  editparams.querySelector("#texturesListEditor").style.display = "none";
  if (
    listOfTexture.length > 0 &&
    texturesElements.includes(editingElement.dataset.id)
  ) {
    editparams.querySelector("#eventList").style.display = "flex";
    editparams.querySelector("#texturesListEditor").innerHTML = `Textures
				<ul>
			${listOfTexture.reduce((a, b) => {
        return (
          a +
          `
						<li onclick="tapofbtn('${b.name}');">${b.name}</li>`
        );
      }, "")}
				</ul>`;
  }

  /* Is element inside the mouse or touch function? */
  editparams.querySelector("#eventList").style.display = "none";
  if (event.target.closest(".ElementsInEditor").style.paddingLeft !== "0px") {
    if (
      tapElements.includes(
        getFirstElement(
          Array.from(ListInEditor.children).indexOf(
            event.target.closest(".ElementsInEditor")
          ) - 1
        )
      )
    ) {
      editparams.querySelector("#eventList").style.display = "flex";
    }
  }
  editparams.classList.add("active");
  body.classList.add("no-scroll");
}

function closeEditParams() {
  editparams.classList.remove("active");
  body.classList.remove("no-scroll");
}

function addColor() {
  tapofbtn('"' + editparams.querySelector("#color-picker").value + '"');
}

function getFirstElement(index) {
  if (index < 0) {
    return false;
  }
  if (ListInEditor.children[index].style.paddingLeft == "0px") {
    return String(ListInEditor.children[index].dataset.id);
  } else {
    return getFirstElement(index - 1);
  }
}

function setTextInWhere() {
  let resultat = TextInWhereOnStart;
  let realChenge = [];
  for (let i = 0; i < listOfChageParams.length; i++) {
    resultat = resultat.replace(
      listOfChageParams[i],
      `<button class="whereBtn" onClick = "newParameter(${i});" ${
        i == whichPosition && 'style="background-color: #c5c5c580;"'
      }> </button>`
    );
    if (List[i].length > 0) {
      realChenge.push(
        List[i].reduce((a, b) => {
          let elementText =
            formulasTranslation.indexOf(String(b)) + 1
              ? appLanguage["formuls"]["btns"][
                  formulasTranslation.indexOf(String(b))
                ]
              : String(b);
          return a + elementText;
        }, "")
      );
    } else {
      realChenge.push(" ");
    }
  }
  where.innerHTML = resultat;
  let whereBtns = document.querySelectorAll(".whereBtn");
  whereBtns.forEach((i, index) => (i.textContent = realChenge[index]));
}

function changeText() {
  let textFromList = " ";
  if (listOfParams.length > 0) {
    textFromList = listOfParams.reduce((a, b, i) => {
      let c = "";
      let elementText =
        formulasTranslation.indexOf(String(b)) + 1
          ? appLanguage["formuls"]["btns"][
              formulasTranslation.indexOf(String(b))
            ]
          : String(b);
      if (i == 0 && position == 0) {
        return (c = "|" + elementText);
      }

      c = String(a) + elementText;
      if (i + 1 == position) {
        c += "|";
      }
      return c;
    }, "");
    result.textContent = textFromList;
  } else {
    result.textContent = "|";
  }

  List[whichPosition] = listOfParams;
  document.querySelectorAll(".whereBtn")[whichPosition].innerHTML =
    textFromList.replace("|", "");

  return textFromList;
}

function newParameter(parameter) {
  if (parameter !== whichPosition) {
    whichPosition = parameter;
    onStart();
  }
}

function addTextOrCode(isText) {
  let defaultParameter = "";
  if (position < listOfParams.length) {
    if (isText && listOfParams[position].startsWith('"')) {
      defaultParameter = listOfParams[position].slice(1, -1);
    } else if (!isText && listOfParams[position].startsWith(" ")) {
      defaultParameter = listOfParams[position].substring(1);
    }
  }
  modalInput.querySelector("input").maxLength = 221244;
  modalInput.querySelector("#ok-btn").onclick = () => {
    let userAnswer = modalInput.querySelector("input").value;
    if (!userAnswer) {
      return false;
    }
    let numberOfDelate = 0;
    if (defaultParameter.length > 0) {
      numberOfDelate = 1;
    }
    listOfParams.splice(
      position,
      numberOfDelate,
      isText ? '"' + userAnswer + '"' : " " + userAnswer
    );
    position++;
    changeText();
  };
  showMessege({
    text: isText
      ? appLanguage["message"]["writeText"]
      : appLanguage["message"]["writeCode"],
    defaultValue: defaultParameter
  });
}

function tapOfFunctionBtn() {
  event.stopPropagation();
  for (let index = 1; index < arguments.length; index++) {
    listOfParams.splice(position, 0, arguments[index]);
    position++;
  }
  position -= arguments[0];
  changeText();
}

function tapofbtn(text) {
  event.stopPropagation();
  switch (text) {
    case "@0left**":
      if (position > 0) {
        position--;
      } else {
        position = 0;
      }
      break;
    case "@0right**":
      if (position < listOfParams.length) {
        position++;
      } else {
        position = listOfParams.length;
      }
      break;
    case "@0Text**":
      addTextOrCode(true);
      break;
    case "@0Code**":
      addTextOrCode(false);
      break;
    case "@0delete**":
      if (listOfParams.length > 0) {
        if (position > 0) {
          listOfParams.splice(position - 1, 1);
          position--;
        }
      } else {
        listOfParams = [];
        position = 0;
      }
      break;
    case "@0Ok**":
      editingElement.dataset.parameter = JSON.stringify(List);
      editingElement.querySelector(".elementText").textContent =
        CreateInnerTextOfElement(idOfElement, List);
      saveData();
      closeEditParams();
      break;
    default:
      listOfParams.splice(position, 0, text);
      position++;
      break;
  }
  changeText();
}

function onStart() {
  listOfParams = List[whichPosition];
  position = listOfParams.length;
  changeDataList(true);
  changeDataList(false);
  setTextInWhere();
  changeText();
}
