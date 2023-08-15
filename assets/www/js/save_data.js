function saveData(createCode = false) {
  let saverList = [];
  MainList[0] = {
    data: [...listOfData],
    functions: [...listOfFunct],
    name: projectName,
    codePiece: codePiece,
    piecesName: listOfCodePieces,
  };
  let attachment = 0;
  Array.from(ListInEditor.children).forEach((i) => {
    if (i.classList.contains("finish")) {
      attachment--;
    }

    saverList.push({
      id: i.dataset.id,
      parameter: JSON.parse(i.dataset.parameter),
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
    MainList[1][codePiece] = saverList;
    if (createCode) {
      StartView.postMessage(
        "[" + JSON.stringify(MainList) + "," + JSON.stringify(listOfFiles) + "]"
      );
    } else {
      SaveDataInFlutter.postMessage(JSON.stringify(MainList));
    }
  } catch (e) {
    console.log("save error: " + e);
  }
}
