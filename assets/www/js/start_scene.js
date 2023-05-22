const mainColors = ["#96b38e", "#f59073", "#913e5f", "#eb4464"];

let ListOfElements = [
  {
    id: 0,
    code: "function name(params){",
    text: "Function name(params)",
    color: 1,
    listChengers: ["name", "params"],
    standartParameter: [["name"], ["params"]],
    secondArgument: [{ code: "};", text: "End" }],
    isfunction: true
  },
  {
    id: 1, // PROPERTIES
    code: "//Coment",
    text: "Coment",
    color: 0,
    listChengers: ["Coment"],
    standartParameter: [["Coment"]]
  }
];

const tapElements = ["12", "14", "25", "26"];
const texturesElements = ["8", "30", "81"];
let listOfCodePieces = [];
let MainList = [];
let listOfData = [];
let listOfTexture = [];
let listOfFunct = [];
let copyList = [];
let projectName = "";
let codePiece = 0;
let appLanguage = {};
let formulasTranslation = [
  "+Create",
  "MousePosition.x",
  "MousePosition.y",
  "colisionWithTouch({ MousePosition, object: ",
  "event.type",
  "event.target",
  "tappedElement",
  "hi",
  "Math.pow",
  "Math.random()",
  "Math.sqrt",
  "Math.sin",
  "Math.cos",
  "Math.tan",
  "Math.asin",
  "Math.acos",
  "Math.atan",
  "Math.atan2",
  "Math.max",
  "Math.min",
  "Math.abs",
  "Math.sign",
  "Math.ceil",
  "Math.floor",
  "Math.round",
  "Math.trunc",
  "getModule",
  "Math.log",
  "Math.log10",
  "Math.PI",
  ".x",
  ".y",
  ".width",
  ".height",
  ".color",
  ".radius",
  ".direction",
  ".startAngle",
  ".endAngle",
  "DisplayWidth",
  "DisplayHeight",
  "==",
  "!==",
  ">",
  "<",
  ">=",
  "<=",
  "&&",
  "||",
  "!",
  "true",
  "false",
  "undefined",
  "showMessege",
  "prompt",
  "confirm",
  "JSON.stringify",
  "JSON.parse",
  "joinStrings",
  "degToRadian",
  "randomInteger",
  "colisionBetween",
  "oppositeColision",
  "distanceBetween",
  ".length",
  ".indexOf",
  ".lastIndexOf",
  ".includes",
  ".isArray",
  "Object.keys",
  "+Create",
  "[",
  "]",
  "{",
  "}",
  "()=>",
  "ternary",
  "ADD",
  "CodeInHTML"
];

let listOfchangeElemnents = []; /*        Copy, paste, change position list */

/* Edit Params  ==========================================================> */
let TextInWhereOnStart = ""; /*                            Where inner text */
let listOfChageParams = []; /*                         list of the chengers */

let List = []; /*                                       Array of paramaters */
let listOfParams = []; /*                     Array of data in one pramater */
let position = 0; /*                                    Where the mouse now */
let whichPosition = 0; /*       Number of element in List, which is editing */
let editingElement = 0; /*                 Element that editing now in html */
let idOfElement = 0; /*                               Id of editing element */

/* Elements from HTML  ===================================================> */
const body = document.querySelector("body");
const ListInEditor = body.querySelector("#listEditor"); /* Main List ======>*/
const addblocks = body.querySelector("#addblocks"); /* ADD Block ==========>*/
const ListAddBlock = body.querySelector("#listAddBlock"); /*   AddBlock List*/
const editparams = body.querySelector("#editparams"); /* Edit Params ======>*/
const where = editparams.querySelector("#inner-where"); /* button of params */
const result = editparams.querySelector("#result"); /*     show the formula */
const dataList = editparams.querySelector("#dataList"); /*        data List */
const functList = editparams.querySelector("#functList"); /*  function List */
const modalInput = body.querySelector("#modal-window"); /*     Modal Window */
const settings = body.querySelector("nav"); /*         NAV bar with buttons */
const files = body.querySelector("#files-scene"); /* Files scene ==========>*/
const filesList = files.querySelector("#files-list"); /*      List Of files */
const codePieces = body.querySelector("#pieces-scene"); /*Pieces scene ====>*/
const codepiecesList = codePieces.querySelector("#pieces-list"); /*Pieces list*/

/* Start Project  ========================================================> */
window.onload = () => PageIsReady.postMessage("Hi. Page is Ready");

function readData(data, nameOfProject) {
  let result = data[0];
  listOfTexture = data[1];
  if (!result) return;

  MainList = data[0];
  listOfData = result[0].data ? [...result[0].data] : [];
  listOfFunct = result[0].functions ? [...result[0].functions] : [];
  codePiece = result[0].codePiece;
  projectName = nameOfProject;
  listOfCodePieces = result[0].piecesName;

  htmlSpawner(appLanguage);
  renderList(result[1][codePiece]);
  changeCodePiecesList();
  changeTextureList();
  document.querySelector("#header-text").innerHTML = nameOfProject;
}

let sortable = Sortable.create(ListInEditor, {
  handle: ".my-handle-inner",
  animation: 150,
  filter: ".filtered",
  fallbackTolerance: 5,
  touchStartThreshold: 4,
  onStart: (evt) => {
    if (evt.item.classList.contains("start")) {
      listOfchangeElemnents = [];
      for (
        let i = evt.oldIndex + 1;
        i < getTheListOfChangeElem(evt.oldIndex, 0) + 1;
        i++
      ) {
        listOfchangeElemnents.push(ListInEditor.children[i]);
        ListInEditor.children[i].style.display = "none";
      }
    }
  },
  onEnd: (evt) => {
    if (
      evt.newIndex == 0 &&
      ListInEditor.children[0] &&
      ListOfElements[ListInEditor.children[0].dataset.id].isfunction
    ) {
      ListInEditor.children[1].style.marginTop = "15px";
    }
    if (evt.item.classList.contains("start")) {
      if (ListOfElements[evt.item.dataset.id].isfunction) {
        evt.item.style.marginTop = "15px";
      }
      listOfchangeElemnents.reverse();
      listOfchangeElemnents.forEach((i) => {
        evt.item.after(i);
        i.style.display = "flex";
      });
      listOfchangeElemnents = [];
    }
  },
  store: {
    set: function (sortable) {
      /* Save Data */
      saveData();
    }
  }
});
