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

  if (!List) {
    List = [];
  }

  where.scrollTo(0, 0);
  document.querySelector("#tree").scrollTo(0, 0);
  copyFormula.style.display = "none";
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
    editparams.querySelector("#texturesListEditor").style.display = "flex";
    editparams.querySelector("#texturesListEditor").innerHTML = `
			<span>Textures</span>
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
  if (
    editingElement.querySelector(".innerOfElement").style.paddingLeft !== "0px"
  ) {
    console.log(
      getFirstElement(
        Array.from(ListInEditor.children).indexOf(editingElement) - 1
      )
    );
    if (
      tapElements.includes(
        getFirstElement(
          Array.from(ListInEditor.children).indexOf(editingElement) - 1
        )
      )
    ) {
      editparams.querySelector("#eventList").style.display = "flex";
    }
  }
  editparams.classList.add("active");
  body.classList.add("no-scroll");
}

function onStart() {
  listOfParams = List[whichPosition];
  position = listOfParams.length;
  changeDataList(true);
  changeDataList(false);
  setTextInWhere();
  changeText();
}

function closeEditParams() {
  editparams.classList.remove("active");
  body.classList.remove("no-scroll");
}

function getFirstElement(index) {
  if (index < 0) {
    return false;
  }
  if (
    ListInEditor.children[index].querySelector(".innerOfElement").style
      .paddingLeft == "0px"
  ) {
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

function cursorMove(event, index) {
  let newCursor =
    event.offsetX >
    (event.target.offsetWidth -
      parseFloat(
        getComputedStyle(event.target).getPropertyValue("padding-right")
      )) /
      2
      ? index + 1
      : index;
  if (newCursor == position) {
    return;
  }
  position = newCursor;
  changeText();
}

function changeText() {
  if (listOfParams.length > 0) {
    result.innerHTML = "";
    let cursor = document.createElement("b");
    cursor.innerHTML = "|";
    listOfParams.forEach((element, index) => {
      if (index === position) {
        result.append(cursor);
      }
      let newSpan = document.createElement("span");
      newSpan.onclick = (event) => cursorMove(event, index);
      newSpan.textContent =
        formulasTranslation.indexOf(String(element)) + 1
          ? appLanguage["formuls"]["btns"][
              formulasTranslation.indexOf(String(element))
            ]
          : String(element);
      result.append(newSpan);
    });

    if (position === listOfParams.length) {
      result.append(cursor);
    } else {
      let lastElement = result.children[result.children.length - 1];
      lastElement.style.paddingRight = `${
        Math.floor(
          result.offsetWidth -
            lastElement.getBoundingClientRect().left -
            lastElement.offsetWidth
        ) - 40
      }px`;
    }
  } else {
    result.innerHTML = "<b>| </b>";
  }

  List[whichPosition] = listOfParams;
  document.querySelectorAll(".whereBtn")[whichPosition].textContent =
    result.textContent.replace("|", "");
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
      for (let index = List.length - 1; index >= 0; index--) {
        if (List[index].length == 0) {
          List[index] = ListOfElements[idOfElement].standartParameter[index];
        }
      }
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

function addColor() {
  tapofbtn('"' + editparams.querySelector("#color-picker").value + '"');
}

function setupCopyFormula() {
  let touchEventTriggered = false;
  let copyListFormula = [];
  const doubleTapHandler = createDoubleTapHandler(openCopyPaste);

  result.addEventListener("touchend", (event) => {
    touchEventTriggered = true;
    doubleTapHandler(event);
  });

  result.addEventListener("dblclick", (event) => {
    if (!touchEventTriggered) {
      openCopyPaste();
    }
    touchEventTriggered = false;
  });

  function createDoubleTapHandler(handler) {
    let lastTouchTime = 0;
    return (event) => {
      const currentTime = new Date().getTime();
      const tapLength = currentTime - lastTouchTime;
      if (tapLength < 300 && tapLength > 0) {
        event.preventDefault();
        handler();
      }
      lastTouchTime = currentTime;
    };
  }

  function openCopyPaste() {
    copyFormula.style.top =
      Number(result.getBoundingClientRect().top + 3) + "px";
    if (copyFormula.style.display === "flex") {
      copyFormula.style.display = "none";
    } else {
      copyFormula.style.display = "flex";
    }

    if (copyListFormula.length > 0) {
      copyFormula.children[1].style.display = "";
    } else {
      copyFormula.children[1].style.display = "none";
    }
  }

  copyFormula.children[0].onclick = () => {
    copyListFormula = [...listOfParams];
    copyFormula.children[1].style.display = "";
  };

  copyFormula.children[1].onclick = () => {
    listOfParams.splice(position, 0, ...copyListFormula);
    position += copyListFormula.length;
    changeText();
  };
}

setupCopyFormula();
