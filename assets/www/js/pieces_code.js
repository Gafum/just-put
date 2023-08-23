function changeCodePiecesList() {
  codepiecesList.innerHTML = listOfCodePieces.reduce((prev, item, index) => {
    let a = [];
    for (let c = 0; c < 550; c++) {
      a.push(Math.round(Math.random()));
    }
    return (
      prev +
      `
		<li class="one-file ${codePiece == index && listOfCodePieces.length > 1 ? "active" : "'"
      }" onclick='otherPiece(${index})'>
			<div class="img-in-file img-in-piece">
				<span>
					${a.join("")}
				</span>
			</div>
			<div class="text-in-file">
				<h3>${item}</h3>
        ${listOfCodePieces.length > 1 ? `
        <div class="textures-btns">
          <button onclick="deletePiece(event, ${index}, '${item}')">
            ${appLanguage["message"]["delete"]}
          </button>
        </div>` : ""}
			</div>
      ${listOfCodePieces.length > 1
        ? `<div class="piece-btns">
            <button style="padding: 4px 7px 0;" onclick="changePositionPiece(event, -1, ${index})">
              <svg viewBox="0 0 24 24" width="24" height="24">
                <path d="M17.71,11.29l-5-5a1,1,0,0,0-.33-.21,1,1,0,0,0-.76,0,1,1,0,0,0-.33.21l-5,5a1,1,0,0,0,1.42,1.42L11,9.41V17a1,1,0,0,0,2,0V9.41l3.29,3.3a1,1,0,0,0,1.42,0A1,1,0,0,0,17.71,11.29Z" />
              </svg>
            </button>
            <button style="padding: 4px 7px 0;" onclick="changePositionPiece(event, 1, ${index})">
              <svg viewBox="0 0 24 24" width="24" height="24">
                <path d="M17.71,11.29a1,1,0,0,0-1.42,0L13,14.59V7a1,1,0,0,0-2,0v7.59l-3.29-3.3a1,1,0,0,0-1.42,1.42l5,5a1,1,0,0,0,.33.21.94.94,0,0,0,.76,0,1,1,0,0,0,.33-.21l5-5A1,1,0,0,0,17.71,11.29Z" />
              </svg>
            </button>
          </div>`
        : ""
      }
		</li > `
    );
  }, "");
}

function otherPiece(newPiece) {
  if (newPiece == codePiece) return;
  codePiece = newPiece;
  renderList(MainList[1][codePiece]);
  changeCodePiecesList();
  closeFileCodes();
  document.querySelector(".open-nav").classList.remove("open");
}

function CreateNewPiece() {
  showMessege({
    text: appLanguage["message"]["createPiece"],
    defaultValue: "",
  });
  modalInput.querySelector("#ok-btn").onclick = () => {
    let userAnswer = modalInput
      .querySelector("input")
      .value.replace(/\\s/g, "")
      .slice(0, 20);
    if (!userAnswer) return false;
    MainList[1].push([]);
    listOfCodePieces.push(userAnswer);
    otherPiece(listOfCodePieces.length - 1);
  };
  modalInput.querySelector("input").maxLength = 20;
}

function changePositionPiece(event, pos, index) {
  event.stopPropagation();
  if (listOfCodePieces.length <= 1 || index < 0 || index >= listOfCodePieces.length) {
    return;
  }

  let newIndex = index + pos;
  if (newIndex < 0) {
    newIndex = listOfCodePieces.length - 1;
  } else if (newIndex >= listOfCodePieces.length) {
    newIndex = 0;
  }

  /* swap places elements */
  [listOfCodePieces[index], listOfCodePieces[newIndex]] = [
    listOfCodePieces[newIndex],
    listOfCodePieces[index],
  ];

  [MainList[1][index], MainList[1][newIndex]] = [
    MainList[1][newIndex],
    MainList[1][index],
  ];

  if (index == codePiece) {
    codePiece = newIndex;
  } else {
    if (newIndex == codePiece) {
      codePiece = index;
    }
  }

  changeCodePiecesList();
  saveData();
}

function deletePiece(event, index, name) {
  event.stopPropagation();
  if (listOfCodePieces.length <= 1 || index < 0 || index >= listOfCodePieces.length) {
    return;
  }

  showMessege({
    text: `${appLanguage["message"]["delete"]} ${name}?`,
    defaultValue: "empty",
  });
  modalInput.querySelector("#ok-btn").onclick = () => {
    listOfCodePieces.splice(index, 1);
    MainList[1].splice(index, 1);
    changeCodePiecesList();
    otherPiece(0);
  };
}