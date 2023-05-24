function deleteElement(event) {
  if (event.target.closest("li").classList.contains("start")) {
    let firstElement = Array.from(ListInEditor.children).findIndex(
      (i) => i == event.target.closest("li")
    );
    let listDelete = [];
    for (
      let i = firstElement + 1;
      i < getTheListOfChangeElem(firstElement, 0) + 1;
      i++
    ) {
      listDelete.push(ListInEditor.children[i]);
    }
    listDelete.forEach((i) => i.remove());
  }
  event.target.closest("li").remove();
  saveData();
}

function copyElement(event) {
  let element = event.target.closest("li");
  copyList = [];
  if (element.classList.contains("start")) {
    let firstElement = Array.from(ListInEditor.children).findIndex(
      (i) => i == element
    );
    for (
      let i = firstElement + 1;
      i < getTheListOfChangeElem(firstElement, 0) + 1;
      i++
    ) {
      copyList.push(ListInEditor.children[i].cloneNode(true));
    }
  }
  copyList.unshift(element.cloneNode(true));
}

function pasteElement(event) {
  if (copyList.length > 0) {
    copyList.forEach((i, index) => {
      const cloneOfElement = i.cloneNode(true);

      if (index === 0) {
        cloneOfElement.style.color = "black";
        cloneOfElement.style.backgroundColor =
          mainColors[ListOfElements[cloneOfElement.dataset.id].color];
        setTimeout(() => {
          cloneOfElement.style.color =
            mainColors[ListOfElements[cloneOfElement.dataset.id].color];
          cloneOfElement.style.backgroundColor = "transparent";
        }, 100);
      }

      if (cloneOfElement.querySelector(".active")) {
        cloneOfElement
          .querySelectorAll(".active")
          .forEach((i) => i.classList.remove("active"));
      }

      event.target.closest("li").before(cloneOfElement);

      if (tapElements.includes(String(cloneOfElement.dataset.id))) {
        let parameter = cloneOfElement.dataset.parameter;
        let newParameter = JSON.parse(parameter);
        newParameter[1] = [
          "A" + Date.now() + Math.random().toString(32).slice(4)
        ];
        cloneOfElement.dataset.parameter = JSON.stringify(newParameter);
      }
    });
    saveData();
  }
}

function showBtnElement(event) {
  let element = event.target.closest("li");
  if (element) {
    element.querySelector(".btn-in-element").classList.toggle("active");
    element.querySelector(".my-handle-inner").classList.toggle("active");
  }
}
