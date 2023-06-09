function createVarieble(isData) {
  event.stopPropagation();
  showMessege({
    text: isData
      ? appLanguage["message"]["createData"]
      : appLanguage["message"]["createFunction"],
    defaultValue: ""
  });
  modalInput.querySelector("#ok-btn").onclick = () => {
    let userAnswer = modalInput.querySelector("input").value.slice(0, 10);
    userAnswer = userAnswer.replace(/\s/g, "");
    if (!userAnswer) return false;

    let inputPlaceholder = checkForIncludesVarieblse(userAnswer);

    if (inputPlaceholder) {
      modalInput.querySelector("label").innerHTML = inputPlaceholder;
      return false;
    }

    (isData ? listOfData : listOfFunct).push(String(userAnswer));
    changeDataList(isData);
  };
  modalInput.querySelector("input").maxLength = 10;
}

function daleteVarOrFunc(isData, element) {
  showMessege({
    text: `${appLanguage["message"]["delete"]} ${element}?`,
    defaultValue: "empty"
  });
  modalInput.querySelector("#ok-btn").onclick = () => {
    let listh = isData ? listOfData : listOfFunct;
    listh.splice(listh.indexOf(element), 1);
    changeDataList(isData);
    saveData();
  };
}

function changeDataList(isData) {
  let resultat = (isData ? listOfData : listOfFunct).reduce((a, b) => {
    return (
      a +
      `
		<li>
				<span class="nameOfvarieble" onclick="tapofbtn('${b}'); event.stopPropagation();">${b}</span>
				<span class="btn-delete" onclick="daleteVarOrFunc(${isData}, '${b}'); event.stopPropagation();">
						<svg class="icon-delete-editor">
							<use xlink:href="#icon-delete"></use>
						</svg>
				</span>
				</li>
				`
    );
  }, "");
  if (isData) {
    resultat += `<li style="color: #777; display: block;" onclick="createVarieble(true)">${appLanguage["formuls"]["btns"][0]}</li>`;
    dataList.innerHTML = resultat;
  } else {
    resultat += `<li style="color: #777; display: block;" onclick="createVarieble(false)">${appLanguage["formuls"]["btns"][0]}</li>`;
    functList.innerHTML = resultat;
  }
}

function checkForIncludesVarieblse(userAnswer) {
  if (
    listOfData.includes(userAnswer) ||
    listOfTexture.findIndex(({ name }) => name == userAnswer) + 1
  ) {
    return appLanguage["message"]["alreadyIncledes"][0];
  }
  if (/[0-9]/gm.test(userAnswer[0])) {
    return appLanguage["message"]["alreadyIncledes"][1];
  }
  if (userAnswer.match(/[^A-Za-z0-9]/gm)) {
    return appLanguage["message"]["alreadyIncledes"][2];
  }
  return false;
}
