function changeCodePiecesList() {
  codepiecesList.innerHTML = listOfCodePieces.reduce((prev, item, index) => {
    let a = [];
    for (let c = 0; c < 550; c++) {
      a.push(Math.round(Math.random()));
    }
    return (
      prev +
      `
		<li class="one-file" onclick='otherPiece(${index})'>
			<div class="img-in-file img-in-piece">
				<span>
					${a.join("")}
				</span>
			</div>
			<div class="text-in-file">
				<h3>${item}</h3>
			</div>
		</li>`
    );
  }, "");
}

function otherPiece(newPiece) {
  if (newPiece == codePiece) return;
  codePiece = newPiece;
  renderList(MainList[1][codePiece]);
  closeFileCodes();
  document.querySelector(".open-nav").classList.remove("open");
}

function CreateNewPiece() {
  showMessege({
    text: appLanguage["message"]["createPiece"],
    defaultValue: ""
  });
  modalInput.querySelector("#ok-btn").onclick = () => {
    let userAnswer = modalInput.querySelector("input").value.slice(0, 20);
    if (!userAnswer) return false;
    MainList[1].push([]);
    listOfCodePieces.push(userAnswer);
    codePiece = listOfCodePieces.length - 1;
    changeCodePiecesList();
    renderList([]);
    saveData();
    closeFileCodes();
    document.querySelector(".open-nav").classList.remove("open");
  };
  modalInput.querySelector("input").maxLength = 20;
}
