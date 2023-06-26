function changeTextureList() {
  try {
    filesList.innerHTML = listOfFiles.reduce((a, b, index) => {
      return (
        a +
        `
			<li class="one-file">
			<div class="img-in-file" style="background-image: url('${b.data}');">
				${
          b.data == "0"
            ? `<svg width='40' height='40' onclick='switchMusic(${index});'><use xlink:href='#icon-sound'></use></svg>`
            : ""
        }
			</div>
			<div class="text-in-file">
				<h3>${b.name}</h3>
				<button onclick="deleteTexture(${index}, '${b.name}')">${
          appLanguage["message"]["delete"]
        }</button>
			</div>
		</li>`
      );
    }, "");
  } catch (e) {
    return "ListChanger" + e;
  }
  return "Status: ok";
}

function addNewImage({ name = "myName", data = false, isAudio = false }) {
  if (!data) return;
  let newElement = { name, data };
  if (isAudio) {
    newElement.audioData = isAudio;
  }
  listOfFiles.push(newElement);
  SaveTextures.postMessage(JSON.stringify(listOfFiles));
  return changeTextureList();
}

function createTextureFile() {
  showMessege({
    text: `<span style="color: red; text-align: center; font-size: 19px;">
			${appLanguage["message"]["notRecomended"][0]}!
			<br/> ${appLanguage["message"]["notRecomended"][1]}.
			</span>
			<br/><span style="color: #888; text-align: center; font-size: 12px;">
				${appLanguage["message"]["notRecomended"][2]}.
			</span>`,
    defaultValue: "empty"
  });
  modalInput.querySelector("#ok-btn").onclick = () => {
    setTimeout(() => {
      modalInput.querySelector("#ok-btn").onclick = () => {
        let userAnswer = modalInput.querySelector("input").value.slice(0, 20);
        userAnswer = userAnswer.replace(/\s/g, "");
        if (!userAnswer) return false;
        let inputPlaceholder = checkForIncludesVarieblse(userAnswer);

        if (inputPlaceholder) {
          modalInput.querySelector("label").innerHTML = inputPlaceholder;
          return false;
        }
        SelectFile.postMessage(
          JSON.stringify({ name: userAnswer, isAudio: false })
        );
      };
      modalInput.querySelector("input").maxLength = 20;
      showMessege({
        text: appLanguage["message"]["writeName"],
        defaultValue: ""
      });
    }, 400);
  };
}

function createTextureURL() {
  showMessege({
    text: appLanguage["message"]["writeName"],
    defaultValue: "",
    checkbox: appLanguage["message"]["isAudio"]
  });
  modalInput.querySelector("input").maxLength = 20;
  modalInput.querySelector("#ok-btn").onclick = () => {
    let userAnswer = modalInput.querySelector("input").value.slice(0, 20);
    let isAudio = modalInput.querySelector("#checkbox-input").checked;
    userAnswer = userAnswer.replace(/\s/g, "");
    if (!userAnswer) return false;

    let inputPlaceholder = checkForIncludesVarieblse(userAnswer);
    if (inputPlaceholder) {
      modalInput.querySelector("label").innerHTML = inputPlaceholder;
      return false;
    }
    setTimeout(() => {
      modalInput.querySelector("input").maxLength = 1000;
      showMessege({
        text: appLanguage["message"]["writeURL"],
        defaultValue: ""
      });
      modalInput.querySelector("#ok-btn").onclick = () => {
        let userAnswerURL = modalInput.querySelector("input").value;
        if (!userAnswerURL) return false;
        let newImage = { data: userAnswerURL, name: userAnswer };
        if (isAudio) {
          newImage.isAudio = newImage.data;
          newImage.data = "0";
        }
        addNewImage(newImage);
      };
    }, 400);
  };
}

function createTextureDraw() {
  modalInput.querySelector("#ok-btn").onclick = () => {
    let userAnswer = modalInput.querySelector("input").value.slice(0, 20);
    userAnswer = userAnswer.replace(/\s/g, "");
    if (!userAnswer) return false;

    let inputPlaceholder = checkForIncludesVarieblse(userAnswer);
    if (inputPlaceholder) {
      modalInput.querySelector("label").innerHTML = inputPlaceholder;
      return false;
    }
    PaintImg.postMessage(userAnswer);
  };
  modalInput.querySelector("input").maxLength = 20;
  showMessege({ text: appLanguage["message"]["writeName"], defaultValue: "" });
}

function deleteTexture(id, name) {
  showMessege({
    text: `${appLanguage["message"]["delete"]} ${name}?`,
    defaultValue: "empty"
  });
  modalInput.querySelector("#ok-btn").onclick = () => {
    listOfFiles.splice(id, 1);
    SaveTextures.postMessage(JSON.stringify(listOfFiles));
    return changeTextureList();
  };
}

function createMusic() {
  showMessege({
    text: `<span style="color: red; text-align: center; font-size: 19px;">
			${appLanguage["message"]["notRecomended"][0]}!
			<br/> ${appLanguage["message"]["notRecomended"][1]}.
			</span>
			<br/><span style="color: #888; text-align: center; font-size: 12px;">
				${appLanguage["message"]["notRecomended"][2]}.
			</span>`,
    defaultValue: "empty"
  });
  modalInput.querySelector("#ok-btn").onclick = () => {
    setTimeout(() => {
      modalInput.querySelector("#ok-btn").onclick = () => {
        let userAnswer = modalInput.querySelector("input").value.slice(0, 20);
        userAnswer = userAnswer.replace(/\s/g, "");
        if (!userAnswer) return false;

        let inputPlaceholder = checkForIncludesVarieblse(userAnswer);
        if (inputPlaceholder) {
          modalInput.querySelector("label").innerHTML = inputPlaceholder;
          return false;
        }
        SelectFile.postMessage(
          JSON.stringify({ name: userAnswer, isAudio: true })
        );
      };
      modalInput.querySelector("input").maxLength = 20;
      showMessege({
        text: appLanguage["message"]["writeName"],
        defaultValue: ""
      });
    }, 400);
  };
}

function switchMusic(indexInList) {
  if (audio.paused) {
    audio.pause();
    audio.currentTime = 0;
    if (!listOfFiles[indexInList].audioData) {
      return;
    }
    audio = new Audio(listOfFiles[indexInList].audioData);
    audio.play();
  } else {
    audio.pause();
    audio.currentTime = 0;
  }
}
