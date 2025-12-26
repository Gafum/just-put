function htmlSpawner(translation) {
  document.querySelector("#name-add-block").innerHTML =
    translation["name-add-block"];

  Array.from(document.querySelectorAll(".big-text")).forEach(
    (element, index) => {
      element.innerHTML = translation["btns-edit-params"][index];
    }
  );

  Array.from(document.querySelector("nav").children).forEach(
    (element, index) => {
      element.innerHTML = translation["nav"][index];
    }
  );
  Array.from(document.querySelector("#inner-modal-window").children).forEach(
    (element, index) => {
      element.innerHTML = translation["message"]["btns"][index];
    }
  );

  Array.from(document.querySelector(".options").children).forEach(
    (element, index) => {
      element.querySelector("span").innerHTML =
        translation["main-fab-btn"][index];
    }
  );
  Array.from(document.querySelector("#files-fab").children).forEach(
    (element, index) => {
      element.querySelector("span").innerHTML = translation["files-fab"][index];
    }
  );

  let num = 0;
  Array.from(document.querySelector("#tree").children).forEach(
    (element, index) => {
      element.querySelector("span").textContent =
        translation["formuls"]["group-name"][index];
      Array.from(element.querySelector("ul").children).forEach((item) => {
        item.innerHTML = translation["formuls"]["btns"][num];
        num++;
      });
    }
  );

  /* Add Color!!! MUST BE HERE */
  document.querySelector("#btn-add").innerHTML = `
	<button onclick="event.stopPropagation(); addColor();" style="padding: 4px 7px; font-size: 16px; border-radius: 7px;border: none; background-color: #191919; color: #fff; text-align: center; outline: none;"> ${translation["btns-edit-params"][3]} </button>
	<div id="custom-color-trigger" onclick="event.stopPropagation(); openColorModal()" style="width: 25px; height: 25px; border-radius: 50%; background-color: #30c731; border: 2px solid #fff; cursor: pointer; box-shadow: 0 0 5px rgba(0,0,0,0.3); display: inline-block; vertical-align: middle; margin-left: 5px;"></div>
	<input type="hidden" id="color-picker" value="#30c731">
	`;
  return true;
}
