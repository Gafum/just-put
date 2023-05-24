function saveData(createCode = false) {
  let a = [];
  MainList[0] = {
    data: [...listOfData],
    functions: [...listOfFunct],
    name: projectName,
    codePiece: codePiece,
    piecesName: listOfCodePieces
  };
  let attachment = 0;
  Array.from(ListInEditor.children).forEach((i, index) => {
    if (i.classList.contains("finish")) {
      attachment--;
    }

    a.push({
      id: i.dataset.id,
      parameter: JSON.parse(i.dataset.parameter)
    });

    i.querySelector(".innerOfElement").style.paddingLeft =
      (attachment < 6 ? attachment * 20 : 120) + "px";
    if (i.classList.contains("start")) {
      attachment++;
    }
  });
  if (
    ListInEditor.children[0] > 0 &&
    ListOfElements[ListInEditor.children[0].dataset.id].isfunction
  ) {
    ListInEditor.children[0].style.marginTop = "0px";
  }
  try {
    MainList[1][codePiece] = a;
    if (createCode) {
      StartView.postMessage(
        "[" +
          JSON.stringify(MainList) +
          "," +
          JSON.stringify(listOfTexture) +
          "]"
      );
    } else {
      SaveDataInFlutter.postMessage(JSON.stringify(MainList));
    }
  } catch (e) {
    console.log("save error: " + e);
  }
}
