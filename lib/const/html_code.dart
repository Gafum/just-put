const htmlCode = '''
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, user-scalable=no" />
    <title>View</title>
    <style>
      * {
        margin: 0%;
        padding: 0%;
        box-sizing: border-box;
        border: 0;
      }
      html,
      body,
      canvas {
        height: 100%;
        width: 100%;
        background-color: white;
      }

      input[type="range"] {
        appearance: none;
        height: 10px;
        background: transparent;
        outline: none;
        background: transparent;
      }
      input[type="range"]::-webkit-slider-runnable-track {
        -webkit-appearance: none;
        background: white;
        border: 1px solid black;
        border-radius: 10px;
      }
      input[type="range"]::-webkit-slider-thumb {
        -webkit-appearance: none;
        border: none;
        width: 15px;
        height: 15px;
        border-radius: 50%;
        transition: transform 0.2s ease-in-out;
        background: black;
        cursor: ew-resize;
      }
      input[type="range"]:active::-webkit-slider-thumb {
        transform: scale(1.3);
      }

      .input-text-container {
        margin-top: 10px;
        position: relative;
        background: white;
      }
      .input-text-container label {
        position: absolute;
        top: 0px;
        left: 0px;
        display: block;
        font-size: 16px;
        color: gray;
        pointer-events: none;
        cursor: text;
        padding: 8px 0 5px 4px;
        transition: all 0.2s ease-in-out;
      }
      .input-text-container input {
        border: 0;
        border-bottom: 1px solid black;
        background: transparent;
        width: 100%;
        padding: 8px 0 5px 4px;
        font-size: 16px;
        color: black;
      }
      .input-text-container input:focus {
        border: none;
        outline: none;
        border-bottom: 2px solid black;
      }
      .input-text-container input:focus ~ label,
      .input-text-container input:valid ~ label {
        top: -50%;
        font-size: 12px;
      }

      .input-radio-container input {
        appearance: none;

        border-radius: 50%;
        width: 20px;
        height: 20px;

        border: 2px solid #999;
        transition: 0.1s all linear;
        margin-right: 5px;

        top: 4px;
        position: relative;
      }

      .input-radio-container input:checked {
        border: 6px solid black;
      }

      .input-checkbox-conteiner {
        display: flex;
        justify-content: center;
        gap: 3px;
      }

      .input-checkbox {
        display: none;
      }

      .input-checkbox:checked ~ label .checkbox-bipolar:after {
        left: 18px;
        right: 2px;
      }

      .checkbox-bipolar {
        width: 36px;
        height: 20px;
        border-radius: 10px;
        border: 1px solid #000;
        display: inline-block;
        position: relative;
      }

      .checkbox-bipolar:after {
        content: "";
        display: block;
        position: absolute;
        background: #000;
        left: 2px;
        top: 2px;
        bottom: 2px;
        right: 18px;
        border-radius: 8px;
        transition: all 0.2s;
      }

      dialog {
        border-radius: 17px;
        border: none;
        transform: translate(-50%, -50%);
        top: 50%;
        left: 50%;
        position: fixed;
        z-index: 100;
        width: 60vw;
        max-height: 70vh;
        overflow: hidden;
        padding: 8px 7px 10px;
      }

      .show-modal {
        animation-name: show-dialog;
        animation-duration: 500ms;
        animation-iteration-count: 1;
      }

      #inner-modal-window {
        max-height: calc(68vh - 50px);
        max-width: 100%;
        overflow-wrap: break-word;
        overflow-y: scroll;
        text-align: center;
        margin-bottom: 6px;
      }

      dialog::backdrop {
        background: rgba(0, 0, 0, 0.2);
      }

      dialog > form {
        display: flex;
        flex-direction: column;
        justify-content: space-between;
        align-items: center;
      }

      button {
        padding: 4px 7px;
        font-size: 16px;
        border-radius: 7px;
        border: none;
        background-color: #191919;
        color: #fff;
        text-align: center;
        outline: none;
        user-select: none;
        transition: filter 0.2s;
      }

      button:hover {
        filter: brightness(1.2);
      }

      @keyframes show-dialog {
        from {
          opacity: 0;
          top: 60%;
        }
        to {
          opacity: 1;
          top: 50%;
        }
      }

      
      #pieces {
        overflow: hidden;
        max-width: 100vw;
        width: 100%;
        height: 100%;
        display: flex;
      }

      #pieces > canvas {
        width: 100vw;
        height: 100%;
      }
    </style>
  </head>
  <body>
    <!-- MADE BY GAFUM -->
    <div id="main" style="position: relative"></div>
    <div id="pieces"></div>

    <dialog id="modal-window">
      <div id="inner-modal-window">Is it me?</div>
      <form method="dialog">
        <button>OK</button>
      </form>
    </dialog>

    <script>
      const mainElementInHTML = document.querySelector("#main");
      const piecesElement = document.querySelector("#pieces");

      class rect {
        constructor({
          x = 0,
          y = 0,
          width = 50,
          height = 50,
          radius = 100,
          color = "#000",
          shape = "cub",
          texture = undefined,
          direction = 0,
        }) {
          this.shape = "cub";
          this.color = color;
          this.x = x;
          this.y = y;
          this.width = width;
          this.height = height;
          this.radius = radius;
          this.texture = texture;
          this.direction = direction;
        }

        go(steps) {
          if (typeof steps !== "number") {
            return;
          }
          this.x += Math.sin(this.direction) * steps;
          this.y -= Math.cos(this.direction) * steps;
        }

        myDraw(ctx) {
          ctx.roundRect(
            -this.width / 2,
            -this.height / 2,
            this.width,
            this.height,
            [this.radius]
          );
        }

        draw(ctx, myStrokeWidth = false, opacity = 1) {
          if(!ctx) return alert("code error");
          ctx.globalAlpha = opacity;
          ctx.lineWidth = myStrokeWidth ? myStrokeWidth : 0;
          ctx.fillStyle = this.color;
          ctx.strokeStyle = this.color;
          ctx.beginPath();
          ctx.save();
          ctx.translate(this.x, this.y);
          ctx.rotate(this.direction);

          if (this.texture && this.texture.a) {
            ctx.drawImage(
              this.texture.a,
              this.texture.sx,
              this.texture.sy,
              this.texture.swidth,
              this.texture.sheight,
              -this.width / 2,
              -this.height / 2,
              this.width,
              this.height
            );
            ctx.restore();
            return;
          }

          this.myDraw(ctx);
          ctx.restore();

          if (myStrokeWidth) {
            ctx.stroke();
          } else {
            ctx.fill();
          }
        }
      }

      class Circle extends rect {
        constructor(data) {
          super(data);
          this.shape = 'circle';
          this.startAngle = data.startAngle;
          this.endAngle = data.endAngle;
          this.counterclockwise = data.counterclockwise;
        }

        myDraw(ctx) {
          ctx.arc(
            0,0,
            this.radius,
            this.startAngle,
            this.endAngle,
            this.counterclockwise
          );
        }
      }

      function colisionWithTouch({ object, MousePosition }) {
        if (object.shape == "circle") {
          if (distanceBetween(MousePosition, object) <= object.radius) {
            return true;
          }
        } else if (object.shape == "cub") {
          myX = object.x - object.width / 2;
          myY = object.y - object.height / 2;
          if (
            MousePosition.x >= myX &&
            MousePosition.x <= myX + object.width &&
            MousePosition.y >= myY &&
            MousePosition.y <= myY + object.height
          ) {
            return true;
          }
        }
      }

      function oppositeColision(first, second) {
        return colisionBetween(first, second, true);
      }

      function colisionBetween(first, second, opposite = false) {
        function getCoordinatOfObjects() {
          if (first.shape == "cub" && second.shape == "circle") {
            return {
              whatcolision: "cubCir",
              cx: second.x,
              cy: second.y,
              radius: second.radius,
              rx: Math.floor(Number(first.x)) - first.width / 2,
              ry: Math.floor(Number(first.y)) - first.height / 2,
              rw: first.width,
              rh: first.height,
            };
          }
          if (first.shape == "circle" && second.shape == "cub") {
            return {
              whatcolision: "cubCir",
              cx: first.x,
              cy: first.y,
              radius: first.radius,
              rx: Math.floor(Number(second.x)) - second.width / 2,
              ry: Math.floor(Number(second.y)) - second.height / 2,
              rw: second.width,
              rh: second.height,
            };
          }
          return undefined;
        }

        if (first.shape == second.shape) {
          if (first.shape == "cub") {
            firstX = first.x - first.width / 2;
            firstY = first.y - first.height / 2;
            secondX = second.x - second.width / 2;
            secondY = second.y - second.height / 2;

            return opposite
              ? /* Opposite */
                first.width * first.height >= second.width * second.height
                ? /* First object is bigger than second  */
                  firstX <= secondX &&
                  firstY <= secondY &&
                  firstX + first.width >= secondX + second.width &&
                  firstY + first.height >= secondY + second.height
                : secondX <= firstX &&
                  secondY <= firstY &&
                  secondX + second.width >= firstX + first.width &&
                  secondY + second.height >= firstY + first.height
              : /* Usual */
                firstX + first.width >= secondX &&
                  secondX + second.width >= firstX &&
                  firstY + first.height >= secondY &&
                  secondY + second.height >= firstY;
          } else if (first.shape == "circle") {
            if (opposite) {
              return (
                distanceBetween(first, second) <=
                Math.abs(first.radius - second.radius)
              );
            } else {
              return (
                distanceBetween(first, second) <= first.radius + second.radius
              );
            }
          }
        } else {
          let { whatcolision, cx, cy, rx, ry, rw, rh, radius } =
            getCoordinatOfObjects();

          if (whatcolision == "cubCir") {
            let testX = cx,
              testY = cy;
            if (cx < rx) testX = rx; // left edge
            else if (cx > rx + rw) testX = rx + rw; // right edge
            if (cy < ry) testY = ry; // top edge
            else if (cy > ry + rh) testY = ry + rh; // bottom edge

            if (opposite) {
              if (
                testX == cx &&
                testY == cy &&
                rx <= cx - radius &&
                ry <= cy - radius &&
                rx + rw >= cx + radius &&
                ry + rh >= cy + radius
              ) {
                return true;
              }
            } else {
              return (
                distanceBetween({ x: cx, y: cy }, { x: testX, y: testY }) <=
                radius
              );
            }
          }
        }
        return false;
      }

      function CreateFradionAddPoints(myName, list, points) {
        //use in gradient (Point)
        list.forEach((i, index) => myName.addColorStop(points[index], i));
      }

      function getpositionOfMouse(e) {
        if (
          e.type == "touchstart" ||
          e.type == "touchmove" ||
          e.type == "touchend" ||
          e.type == "touchcancel"
        ) {
          let touch = e.touches[0] || e.changedTouches[0];
          return { x: touch.pageX * 2, y: touch.pageY * 2 };
        } else if (
          e.type == "mousedown" ||
          e.type == "mouseup" ||
          e.type == "mousemove" ||
          e.type == "mouseover" ||
          e.type == "mouseout" ||
          e.type == "mouseenter" ||
          e.type == "mouseleave" ||
          e.type == "click"
        ) {
          return { x: e.offsetX * 2, y: e.offsetY * 2 };
        }
      }

      function delay(ms) {
        return new Promise((resolve, reject) => {
          setTimeout(() => {
            resolve();
          }, ms);
        });
      }

      function shuffle(array) {
        array.sort(() => Math.random() - 0.5);
      }

      function moveObject(object, endX, endY, duration) {
        function SmoothMove({ startTime, currentTime, distanceX, distanceY }) {
          let elapsedTime = (currentTime - startTime) % duration;
          let progress = elapsedTime / duration;
          if (duration <= currentTime - startTime) {
            object.x = endX;
            object.y = endY;
            return;
          }
          object.x = endX - distanceX + distanceX * progress;
          object.y = endY - distanceY + distanceY * progress;
          requestAnimationFrame((currentTime) => {
            SmoothMove({ startTime, currentTime, distanceX, distanceY });
          });
        }
        let distanceX = endX - object.x;
        let distanceY = endY - object.y;
        requestAnimationFrame((currentTime) => {
          SmoothMove({
            startTime: currentTime,
            currentTime,
            distanceX,
            distanceY,
          });
        });
      }

      function addElementByHtml(code, myid) {
        let newElement = document.querySelector("#" + myid + "conteiner");
        if (!newElement) {
          newElement = document.createElement("div");
          newElement.id = myid + "conteiner";
          mainElementInHTML.append(newElement);
        }
        newElement.innerHTML = code;
      }

      /* Blocks in EditParams ===================== */

      function joinStrings(a, b) {
        return String(a) + String(b);
      }

      function degToRadian(deg) {
        return (Math.PI / 180) * deg;
      }

      function randomInteger(min, max) {
        let rand = min + Math.random() * (max + 1 - min);
        return Math.floor(rand);
      }

      function distanceBetween(first, second) {
        return Math.floor(
          Math.sqrt(
            Math.pow(first.x - second.x, 2) + Math.pow(first.y - second.y, 2)
          )
        );
      }

      function getModule(first, second) {
        return first % second;
      }

      function showMessege(myText) {
        let dialog = document.querySelector("#modal-window");
        dialog.querySelector("#inner-modal-window").innerHTML = myText;
        if (dialog.open) {
          return;
        }
        dialog.showModal();
        dialog.classList.add("show-modal");
      }

      function updateSliderPosition(currentIndex) {
        let sreenWidth = window.innerWidth;
        Array.from(piecesElement.children).forEach((element, index) => {
          element.style.marginLeft = `-\${currentIndex * sreenWidth - index * sreenWidth}px`;
        });
      }

      /* Different variables and function */
      HereMustBeCodeWithVariables====>

      /* Main Script */
      setTimeout(() => {
        try {
          Main();
          HereMustBeMainCode====>
        } catch (e) {
          alert(e);
        }
      }, 300);
    </script>
  </body>
</html>

''';
