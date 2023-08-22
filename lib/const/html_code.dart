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

      #pieces > canvas,
      #main > div {
        display: none;
      }

      #main > div.active {
        display: block;
      }
      
      #pieces > canvas.active {
        display: block;
        width: 100vw;
        height: 100%;
      }
    </style>
  </head>
  <body>
    <!-- MADE BY GAFUM -->
    <div id="main"></div>
    <div id="pieces"></div>

    <dialog id="modal-window">
      <div id="inner-modal-window">Is it me?</div>
      <form method="dialog">
        <button>OK</button>
      </form>
    </dialog>

    <script>
      /* Classes of the objects ===================== */

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
          this.startAngle = data.startAngle || 0;
          this.endAngle = data.endAngle || 2 * Math.PI;
          this.counterclockwise = data.counterclockwise || false;
          this.height = this.radius * 2;
          this.width = this.radius * 2;
        }

        myDraw(ctx) {
          ctx.arc(
            0, 0,
            this.radius,
            this.startAngle,
            this.endAngle,
            this.counterclockwise
          );
        }
      }

      class Polygon extends rect {
        constructor(data) {
          super(data);
          this.shape = 'polygon';
          this.vertices = data.vertices || [];
        }

        myDraw(ctx) {
          if (this.vertices.length < 3) {
            return;
          }

          const vertices = this.vertices;
          const myCenter = this.findPolygonCenter();

          ctx.beginPath();
          ctx.moveTo(vertices[0].x - myCenter.x, vertices[0].y - myCenter.y);
          for (let i = 1; i < vertices.length; i++) {
            ctx.lineTo(
              Math.round(vertices[i].x - myCenter.x),
              Math.round(vertices[i].y - myCenter.y)
            );
          }
          ctx.closePath();
        }

        findPolygonCenter() {
          const vertices = this.vertices;
          let centerX = 0;
          let centerY = 0;
          for (let i = 0; i < vertices.length; i++) {
            centerX += vertices[i].x;
            centerY += vertices[i].y;
          }
          centerX /= vertices.length;
          centerY /= vertices.length;
          return { x: centerX, y: centerY };
        }

        findRightCoordinates() {
          const myCenter = this.findPolygonCenter();

          return this.vertices.map((point) => {
            return {
              x: Math.round(point.x - myCenter.x + this.x),
              y: Math.round(point.y - myCenter.y + this.y)
            };
          });
        }
      }


      /* Global constants ===================== */
      const mainElementInHTML = document.querySelector("#main");
      const piecesElement = document.querySelector("#pieces");


      /* Block's functions ===================== */
      
      function startPiece(idOfThePiece, callback) {
        let canva = document.querySelector(`#canvas\${idOfThePiece}`);
        let elementsInHTML = document.querySelector(`#elements\${idOfThePiece}`);

        if (!canva || !elementsInHTML) {
          /* Create CANVAS */
          canva = document.createElement("canvas");
          canva.id = `canvas\${idOfThePiece}`;
          piecesElement.append(canva);

          /* Create Elements */
          elementsInHTML = document.createElement("div");
          elementsInHTML.id = `elements\${idOfThePiece}`;
          mainElementInHTML.append(elementsInHTML);
        }
        const ctx = canva.getContext("2d");
        canva.width = window.innerWidth * 2;
        canva.height = window.innerHeight * 2;
        const DisplayWidth = canva.width;
        const DisplayHeight = canva.height;
        elementsInHTML.innerHTML = "";
        goToPieceUsingIndex(idOfThePiece.replace(/\\s/g,''), callback);
        return { canva, ctx, DisplayWidth, DisplayHeight, elementsInHTML };
      }

      function goToPieceUsingIndex(idOfThePiece, callback) {
        const localPiece = document.querySelector(`#canvas\${idOfThePiece}`);
        const localElementsInHTML = document.querySelector("#elements" + idOfThePiece);
        if (!localPiece || !localElementsInHTML) return callback();

        let sreenWidth = window.innerWidth;
        piecesElement
          .querySelector("canvas.active")
          ?.classList?.remove("active");
        localPiece.classList.add("active");

        mainElementInHTML
          .querySelector("div.active")
          ?.classList?.remove("active");
          localElementsInHTML.classList.add("active");
      }

      function colisionWithTouch({ object, MousePosition }) {
        if (object.direction && object.shape !== "circle") {
          object = checkForRotation(object);
        }

        if (object.shape === "circle") {
          if (distanceBetween(MousePosition, object) <= object.radius) {
            return true;
          }
        } else if (object.shape === "cub") {
          const myX = object.x - object.width / 2;
          const myY = object.y - object.height / 2;
          if (
            MousePosition.x >= myX &&
            MousePosition.x <= myX + object.width &&
            MousePosition.y >= myY &&
            MousePosition.y <= myY + object.height
          ) {
            return true;
          }
        } else if (object.shape === "polygon") {
          const vertices = object.findRightCoordinates();

          let inside = false;
          for (let i = 0, j = vertices.length - 1; i < vertices.length; j = i++) {
            let xi = vertices[i].x, yi = vertices[i].y;
            let xj = vertices[j].x, yj = vertices[j].y;

            let intersect = ((yi > MousePosition.y) != (yj > MousePosition.y))
              && (MousePosition.x < (xj - xi) * (MousePosition.y - yi) / (yj - yi) + xi);
            if (intersect) inside = !inside;
          }
          return inside;
        }
        return false;
      }

      function oppositeColision(first, second) {
        return colisionBetween(first, second, true);
      }

      class CollisionCoordinates {
        static getCoordinatesOfObjects(first, second) {
          if (first.shape === "cub" && second.shape === "circle") {
            return this.getCubCirCoordinates(first, second);
          } else if (first.shape === "circle" && second.shape === "cub") {
            return this.getCubCirCoordinates(second, first);
          }else if (first.shape === "polygon" && second.shape === "circle") {
            return this.getPolygonCirCoordinates(first, second);
          } else if (first.shape === "circle" && second.shape === "polygon") {
            return this.getPolygonCirCoordinates(second, first);
          } else if (first.shape === "polygon" && second.shape === "cub") {
            return this.getPolygonCubCoordinates(first, second);
          } else if (first.shape === "cub" && second.shape === "polygon") {
            return this.getPolygonCubCoordinates(second, first);
          }
          return undefined;
        }

        static getCubCirCoordinates(cub, circle) {
          return {
            whatCollision: "cubCir",
            cx: circle.x,
            cy: circle.y,
            radius: circle.radius,
            rx: Math.floor(Number(cub.x)) - cub.width / 2, /* Bice right coordinates */
            ry: Math.floor(Number(cub.y)) - cub.height / 2,
            rw: cub.width,
            rh: cub.height,
          };
        }

        static getPolygonCirCoordinates(polygon, circle) {
          return {
            whatCollision: "polyCir",
            polygon,
            cx: circle.x,
            cy: circle.y,
            radius: circle.radius,
          };
        }

        static getPolygonCubCoordinates(polygon, cub) {
          return {
            whatCollision: "polyCub",
            polygon,
            rx: Math.floor(Number(cub.x)) - cub.width / 2,
            ry: Math.floor(Number(cub.y)) - cub.height / 2,
            rw: cub.width,
            rh: cub.height,
          };
        }
      }

      class CollisionHandler {
        static cubCubCollision(first, second, opposite) {
          const firstX = first.x - first.width / 2;
          const firstY = first.y - first.height / 2;
          const secondX = second.x - second.width / 2;
          const secondY = second.y - second.height / 2;

          return opposite
            ? /* Opposite */
            first.width * first.height >= second.width * second.height
              ? /* First object is bigger than second */
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
        }

        static circleCollision(first, second, opposite) {
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

        static cubCirCollision({ cx, cy, rx, ry, rw, rh, radius }, opposite) {
          const testX = Math.max(rx, Math.min(cx, rx + rw));
          const testY = Math.max(ry, Math.min(cy, ry + rh));

          if (opposite) {
            if (
              testX === cx &&
              testY === cy &&
              rx <= cx - radius &&
              ry <= cy - radius &&
              rx + rw >= cx + radius &&
              ry + rh >= cy + radius
            ) {
              return true;
            }
          } else {
            return (
              distanceBetween({ x: cx, y: cy }, { x: testX, y: testY }) <= radius
            );
          }
          return false;
        }

        static polyCubCollision({ polygon, rx, ry, rw, rh }) {
          const vertices = polygon.findRightCoordinates();

          // check if any of the polygon's vertices are inside the rectangle
          for (let i = 0; i < vertices.length; i++) {
            let vertex = vertices[i];
            if (vertex.x >= rx && vertex.x <= rx + rw &&
              vertex.y >= ry && vertex.y <= ry + rh) {
              return true;
            }
          }

          // check if any of the rectangle's vertices are inside the polygon
          let rectangleVertices = [
            { x: rx, y: ry },
            { x: rx + rw, y: ry },
            { x: rx + rw, y: ry + rh },
            { x: rx, y: ry + rh }
          ];
          for (let i = 0; i < rectangleVertices.length; i++) {
            if (colisionWithTouch({ object: polygon, MousePosition: rectangleVertices[i] })) {
              return true;
            }
          }

          return false;
        }

        static polyCircleCollision({ polygon, cx, cy, radius }) {
          const vertices = polygon.findRightCoordinates();

          function distanceBetweenEdgeAndPoint(edge, point) {
            // calculate the distance between the point and the line defined by the edge
            let A = point.x - edge.a.x;
            let B = point.y - edge.a.y;
            let C = edge.b.x - edge.a.x;
            let D = edge.b.y - edge.a.y;

            let dot = A * C + B * D;
            let len_sq = C * C + D * D;
            let param = -1;
            if (len_sq != 0) param = dot / len_sq;

            let xx, yy;

            if (param < 0) {
              xx = edge.a.x;
              yy = edge.a.y;
            } else if (param > 1) {
              xx = edge.b.x;
              yy = edge.b.y;
            } else {
              xx = edge.a.x + param * C;
              yy = edge.a.y + param * D;
            }

            let dx = point.x - xx;
            let dy = point.y - yy;
            return Math.sqrt(dx * dx + dy * dy);
          }

          // check if the circle's center is inside the polygon
          if (colisionWithTouch({ object: polygon, MousePosition: { x: cx, y: cy } })) {
            return true;
          }

          // check if any of the polygon's edges are close to the circle
          for (let i = 0; i < vertices.length; i++) {
            let j = (i + 1) % vertices.length;
            let edge = { a: vertices[i], b: vertices[j] };
            if (distanceBetweenEdgeAndPoint(edge, { x: cx, y: cy }) <= radius) return true;
          }

          return false;
        }

        static polyCollision(polygon1, polygon2) {
          let vertices = polygon1.findRightCoordinates();
          for (let i = 0; i < vertices.length; i++) {
            if (colisionWithTouch({
              object: polygon2,
              MousePosition: { x: vertices[i].x, y: vertices[i].y }
            })) {
              return true;
            }
          }

          vertices = polygon2.findRightCoordinates();
          for (let i = 0; i < vertices.length; i++) {
            if (colisionWithTouch({
              object: polygon1,
              MousePosition: { x: vertices[i].x, y: vertices[i].y }
            })) {
              return true;
            }
          }

          return false;
        }
      }

      function checkForRotation(obj){
        function convertCubToPolygon(cub) {
          let halfWidth = cub.width / 2, halfHeight = cub.height / 2;
          let vertices = [
            { x: -halfWidth, y: -halfHeight },
            { x: halfWidth, y: -halfHeight },
            { x: halfWidth, y: halfHeight },
            { x: -halfWidth, y: halfHeight },
          ];
          let polygon = new Polygon({
            x: cub.x,
            y: cub.y,
            vertices,
            direction: cub.direction,
            height: cub.height,
            width: cub.width
          });
          return polygon;
        }

        function rotatePolygon(myPolygon) {
          let { x: centerX, y: centerY } = myPolygon.findPolygonCenter();
          let vertices = myPolygon.findRightCoordinates().map((point) => ({
            x:
              Math.cos(myPolygon.direction) * (point.x - centerX) -
              Math.sin(myPolygon.direction) * (point.y - centerY) +
              centerX,
            y:
              Math.sin(myPolygon.direction) * (point.x - centerX) +
              Math.cos(myPolygon.direction) * (point.y - centerY) +
              centerY,
          }));
          let rotatedPolygon = new Polygon({
            x: myPolygon.x,
            y: myPolygon.y,
            vertices,
            direction: 0,
          });
          return rotatedPolygon;
        }
        
        if (obj.direction && obj.direction % (2 * Math.PI) !== 0) {
          if (obj.shape === "cub") {
            if (obj.direction % (Math.PI / 2) == 0) {
              if (
                obj.direction % (2 * Math.PI) == Math.PI / 2 ||
                obj.direction % (2 * Math.PI) == (Math.PI / 2) * 3
              ) {
                obj = new rect({
                  x: obj.x,
                  y: obj.y,
                  width: obj.height,
                  height: obj.width,
                  direction: 0,
                });
              }
            } else {
              obj = convertCubToPolygon(obj);
            }
          }
          if (obj.shape === "polygon") {
            obj = rotatePolygon(obj);
          }
        }
        return obj;
      }

      function colisionBetween(first, second, opposite = false) {
        if (first.direction && first.shape !== "circle") {
          first = checkForRotation(first);
        }

        if (second.direction && second.shape !== "circle") {
          second = checkForRotation(second);
        }

        if (first.shape === second.shape) {
          if (first.shape === "cub") {
            return CollisionHandler.cubCubCollision(first, second, opposite);
          } else if (first.shape === "circle") {
            return CollisionHandler.circleCollision(first, second, opposite);
          } else if (first.shape === "polygon") {
            return CollisionHandler.polyCollision(first, second, opposite);
          }
        } else {
          const coordinates = CollisionCoordinates.getCoordinatesOfObjects(first, second);
          if (coordinates && coordinates.whatCollision === "cubCir") {
            return CollisionHandler.cubCirCollision(coordinates, opposite);
          } else if (coordinates && coordinates.whatCollision === "polyCub") {
            return CollisionHandler.polyCubCollision(coordinates, opposite);
          }else if (coordinates && coordinates.whatCollision === "polyCir") {
            return CollisionHandler.polyCircleCollision(coordinates, opposite);
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

      function addElementByHtml(elementsInHTML, code, myid) {
        let newElement = document.querySelector("#" + myid + "conteiner");
        if (!newElement) {
          newElement = document.createElement("div");
          newElement.id = myid + "conteiner";
          newElement.style.pointerEvents = "all";
          elementsInHTML.append(newElement);
        }else{
          alert(`Element with id "\${myid}" already exists! Event was rewritten!`);
          return;
        }
        newElement.innerHTML = code;
      }


      /* Functions in the formula editor ===================== */

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


      /* Different variables and function */
      HereMustBeCodeWithVariables====>

      /* Main Script */
      setTimeout(() => {
        try {
          HereMustBeMainCode====>
        } catch (e) {
          alert(e);
        }
      }, 300);
    </script>
  </body>
</html>

''';
