function CreateInnerTextOfElement(idOfElement, DataOfElement) {
  let textInEditor = appLanguage["elements"][idOfElement].text[0];
  if (ListOfElements[idOfElement].listChengers) {
    let maxTextWidth = Math.max(
      Math.floor((window.screen.availWidth - textInEditor.length * 10) / 17),
      2
    );
    for (let i = 0; i < ListOfElements[idOfElement].listChengers.length; i++) {
      if (!DataOfElement[i] || DataOfElement[i].length == 0) {
        /* Create if undefined */
        DataOfElement[i] = ListOfElements[idOfElement].standartParameter[i];
      }

      let realChenge = DataOfElement[i]
        .reduce((a, b) => {
          let elementText =
            formulasTranslation.indexOf(String(b)) + 1
              ? appLanguage["formuls"]["btns"][
                  formulasTranslation.indexOf(String(b))
                ]
              : String(b);
          return a + elementText;
        }, "")
        .slice(0, maxTextWidth);
      textInEditor = textInEditor.replace(
        ListOfElements[idOfElement].listChengers[i],
        realChenge
      );
    }
  }
  return textInEditor;
}

function addBlockToMainList(element, where, isNew = false) {
  if (element.id.startsWith("AMain") || element.id.startsWith("CONTI")) {
    let addLi = document.createElement("li");
    addLi.classList.add(
      "ElementsInEditor",
      element.id.startsWith("AMain") ? "finish" : "newElement"
    );

    ListInEditor.children[where].after(addLi);

    addLi.dataset.id = element.id;
    addLi.dataset.parameter = '"' + element.parameter + '"';
    addLi.innerHTML = `
							<div class="innerOfElement">
								<span style="margin-left: 38px; color: ${
                  mainColors[ListOfElements[element.id.slice(6)].color]
                };" class="elementText">
									${appLanguage["elements"][element.id.slice(6)].text[Number(element.id[5]) + 1]}
								</span>
							</div>`;
    return;
  }

  /* MAIN Element ====================================================> */
  let innerTextOfElement = CreateInnerTextOfElement(
    element.id,
    element.parameter
  );

  let li = "";
  if (ListInEditor.children.length) {
    li = document.createElement("li");
    ListInEditor.children[where].after(li);
  } else {
    ListInEditor.innerHTML = "<li id='newElement'></li>";
    li = document.querySelector("#newElement");
    where = -1;
  }

  li.classList.add(
    "ElementsInEditor",
    ListOfElements[element.id].secondArgument ? "start" : "newElement"
  );
  li.style.marginTop = ListOfElements[element.id].isfunction ? "15px" : "0px";
  li.dataset.id = element.id;
  li.dataset.parameter = JSON.stringify(element.parameter);

  if (isNew) {
    li.style.color = "black";
    li.style.backgroundColor = mainColors[ListOfElements[element.id].color];
    setTimeout(() => {
      li.style.color = mainColors[ListOfElements[element.id].color];
      li.style.backgroundColor = "transparent";
    }, 100);
  } else {
    li.style.color = mainColors[ListOfElements[element.id].color];
  }

  li.innerHTML = `<div class="innerOfElement">
		<div class="my-handle" onclick="showBtnElement(event);">
			<span></span>
			<div class="my-handle-inner"></div>
		</div>
		<div class="btn-in-element">
			<div class="btn-delete" onclick="deleteElement(event);">
				<svg class="icon-delete-editor">
					<use xlink:href="#icon-delete"></use>
				</svg>
			</div>
			<div class="btn-delete" onclick="copyElement(event);">
				<svg class="icon-delete-editor">
					<use xlink:href="#icon-copy"></use>
				</svg>
			</div>
			<div class="btn-delete" onclick="pasteElement(event);">
				<svg class="icon-delete-editor">
					<use xlink:href="#icon-paste"></use>
				</svg>
			</div>
		</div>
		<span class="elementText">
			${innerTextOfElement.replaceAll("<", "&#60;").replaceAll(">", "&#62;")}
		</span>
	</div>
	<span class="EditParameterBtn" onclick="openParams(event);">
		<svg>
			<use xlink:href="#icon-edit"></use>
		</svg>
	</span>`;
}

function renderList(data) {
  ListInEditor.innerHTML = "";
  data.forEach((element) => {
    addBlockToMainList(element, ListInEditor.children.length - 1);
  });
  if (data.length > 0) saveData();
}

function addBlock(element) {
  if (tapElements.includes(String(element))) {
    ListOfElements[element].standartParameter[1] = [
      "A" + Date.now() + Math.random().toString(32).slice(4)
    ];
  }

  let adderElement =
    Math.floor(
      (document.documentElement.scrollTop + window.innerHeight / 2) /
        (40 + listOfFunct.length * 2)
    ) - 2;

  if (ListInEditor.children.length * 40 < window.innerHeight * 0.7) {
    adderElement = ListInEditor.children.length - 1;
  }

  addBlockToMainList(
    {
      id: String(element),
      parameter: ListOfElements[element].standartParameter
    },
    adderElement,
    true
  );

  /* Second Arguments ==========================> */
  if (ListOfElements[element].secondArgument) {
    ListOfElements[element].secondArgument.forEach((i, index) => {
      adderElement++;
      addBlockToMainList(
        {
          id:
            (index == ListOfElements[element].secondArgument.length - 1
              ? "AMain"
              : "CONTI") +
            String(index) +
            String(element),
          parameter: String(i.code)
        },
        adderElement
      );
    });
  }
  saveData();
  addblocks.classList.remove("active");
  body.classList.remove("no-scroll");
}
