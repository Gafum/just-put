const htmlCode = '''
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, user-scalable=no">
	<title>View</title>
	<style>
		*{
			margin: 0%;
			padding: 0%;
			box-sizing: border-box;
			border: 0;
		}
		html, body, canvas{
			height: 100%;
			width: 100%;
		}

		.input-text-container{
			margin-top: 10px;
			position: relative;
			background: white;
		}
		.input-text-container label{
			position:absolute;
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
		.input-text-container input{ 
			border:0;
			border-bottom:1px solid black;  
			background: transparent;
			width:100%;
			padding: 8px 0 5px 4px;
			font-size:16px;
			color:black;
		}
		.input-text-container input:focus{ 
			border:none;	
			outline:none;
			border-bottom: 2px solid black;	
		}

		.input-text-container input:focus ~ label,
		.input-text-container input:valid ~ label{
			top: -50%;
			font-size:12px;
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

		.input-checkbox{
			display: none;
		}

		.input-checkbox:checked~label .checkbox-bipolar:after {
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
			content: '';
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

		dialog{
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

		.show-modal{
			animation-name: show-dialog;
			animation-duration: 500ms;
			animation-iteration-count: 1;
		}

		#inner-modal-window{
			max-height: calc(68vh - 50px);
			max-width: 100%;
			overflow-wrap: break-word;
			overflow-y: scroll;
			text-align: center;
			margin-bottom: 6px;
		}

		dialog::backdrop{
			background: rgba(0, 0, 0, 0.2);
		}

		dialog>form{
			display: flex;
			flex-direction: column;
			justify-content: space-between;
			align-items: center;
		}

		button{
			padding: 4px 7px;
			font-size: 16px; 
			border-radius: 7px;
			border: none;
			background-color: #191919;
			color: #fff;
			text-align: center;
			outline: none;
		}

		@keyframes show-dialog {
			from {
				opacity: 0;
				top: 60%
			}
			to {
				opacity:1
				top: 50%
			}
		}

	</style>
</head>
<body>
	<!-- MADE BY GAFUM -->
	<div id="main" style="position: relative;"></div>

	<canvas style="display: block;" width="640" height="1440">Error</canvas>

	<div class="loadTips">
		<h1>Loading...</h1>
		<p>will restart the game if you see this text for a long time</p>
	</div>

	<dialog id="modal-window">
		<div id="inner-modal-window"> Is it me? </div>
		<form method="dialog">
			<button onclick='document.querySelector("#modal-window").classlist.remove("show-modal")'>
				OK
			</button>
		</form>
	</dialog>

	<script>
	const mainElementInHTML = document.querySelector('#main')
	class rect {
		constructor({ 
		x = 0,
		y = 0,
		width = 50,
		height = 50,
		radius = 100,
		color = "#000",
		shape = "cub",
		startAngle = 0,
		endAngle = 2 * Math.PI,
		counterclockwise = false,
		texture = undefined,
		direction = 0}) {
			this.color = color
			this.x = x
			this.y = y
			this.width = width
			this.height = height
			this.radius = radius
			this.shape = shape
			this.startAngle = startAngle
			this.endAngle = endAngle
			this.counterclockwise = counterclockwise
			this.texture = texture
			this.direction = direction

			this.go = (steps = 0) => {
				this.x += Math.sin(this.direction)* steps
				this.y -= Math.cos(this.direction)* steps
			}

			this.draw = (isfill=true)=>{
				ctx.fillStyle = this.color
				ctx.strokeStyle = this.color
				ctx.beginPath()
				if(shape=="cub"){
					ctx.save();
					ctx.translate(this.x, this.y);

					if(this.texture&&this.texture.a){
						ctx.rotate(this.direction + this.texture.standartDirection);
						ctx.drawImage(this.texture.a, this.texture.sx, this.texture.sy, this.texture.swidth, this.texture.sheight, -this.width/2, -this.height/2, this.width, this.height);
						ctx.restore();
						return
					}

					ctx.rotate(this.direction);
					ctx.roundRect( -this.width/2, -this.height/2, this.width, this.height, [this.radius] );
					ctx.restore();
				}else	if(shape=="circle"){
					ctx.arc( this.x, this.y, this.radius, this.startAngle, this.endAngle, this.counterclockwise);
				}

				if(isfill){
					ctx.fill()
				}else{
					ctx.stroke()
				}
			}
		}
	}

	const canva = document.querySelector("canvas")
	const ctx = canva.getContext("2d")
	canva.width = window.innerWidth * 2
	canva.height = window.innerHeight * 2


	function colisionWithTouch({object, MousePosition}){
		if(object.shape == "circle"){
			if (distanceBetween(MousePosition, object) <= object.radius) {
				return true
			}
		}else if(object.shape == "cub"){
			myX = object.x-object.width/2
			myY = object.y-object.height/2
			if (MousePosition.x >= myX &&
				MousePosition.x <= myX + object.width &&   
				MousePosition.y >= myY &&        
				MousePosition.y <= myY + object.height) {  
					return true
			}
		}
	}

	function getCoordinatOfObjects(first, second){
		if (first.shape == "cub" && second.shape == "circle") {
			return { whatcolision: "cubCir", cx: second.x, cy: second.y, radius: second.radius, rx: first.x-first.width/2, ry: first.y-first.height/2, rw: first.width, rh: first.height }
		}
		if (first.shape == "circle" && second.shape == "cub") {
			return { whatcolision: "cubCir", cx: first.x, cy: first.y, radius: first.radius, rx: second.x-second.width/2, ry: second.y-second.height/2, rw: second.width, rh: second.height }
		}
		return undefined
	}


	function colisionBetween(first, second) {
		if(first.shape == second.shape){
			if(first.shape == "cub"){
				firstX = first.x-first.width/2
				firstY = first.y-first.height/2
				secondX = second.x-second.width/2
				secondY = second.y-second.height/2
				if (
					firstX + first.width >= secondX &&
					secondX + second.width >= firstX &&
					firstY + first.height >= secondY &&
					secondY + second.height >= firstY
				) {
					return true
				}
			}else if(first.shape == "circle"){
				if (distanceBetween(first, second) <= first.radius+second.radius) {
					return true;
				}
			}
		}
		else {
			let {whatcolision, cx, cy, rx, ry, rw, rh, radius} = getCoordinatOfObjects(first, second)
			if(whatcolision == "cubCir"){
				let testX = cx, testY = cy

				if (cx < rx)         testX = rx      // test left edge
				else if (cx > rx+rw) testX = rx+rw   // right edge
				if (cy < ry)         testY = ry    	 // top edge
				else if (cy > ry+rh) testY = ry+rh   // bottom edge

				if (Math.floor(Math.sqrt(Math.pow(cx-testX,2)+Math.pow(cy-testY,2))) <= radius) {
					return true
				}
			}
		}
		return false
	}

	function CreateFradionAddPoints(myName, list, points){//use in gradient (Point)
		list.forEach((i, index)=>myName.addColorStop(points[index], i))
	}

	function getpositionOfMouse(e){
		if(e.type == 'touchstart' || e.type == 'touchmove' || e.type == 'touchend' || e.type == 'touchcancel'){
			let touch = e.touches[0] || e.changedTouches[0];
			return {x: touch.pageX*2, y: touch.pageY*2}
		} else if (e.type == 'mousedown' || e.type == 'mouseup' || e.type == 'mousemove' || e.type == 'mouseover'|| e.type=='mouseout' || e.type=='mouseenter' || e.type=='mouseleave' || e.type == 'click') {
			return { x: e.offsetX*2, y: e.offsetY*2 }
		}
	}

	function delay(ms){
		return new Promise((resolve, reject) => {
			setTimeout(() => {
				resolve();
			}, ms)
		})
	}

	function shuffle(array) {
		array.sort(() => Math.random() - 0.5);
	}

	const SmothMove = async ({ movedObject = { x: 0, y: 0 }, X = 0, Y = 0, MyTime = 0 }) => {
		let cycleTimes = Math.floor(MyTime / 40);
		let distX = (X - movedObject.x) / cycleTimes;
		let distY = (Y - movedObject.y) / cycleTimes;
		for (let index = 0; index < cycleTimes; index++) {
			await delay(40);
			movedObject.x += distX;
			movedObject.y += distY;
		}
		movedObject.x = X;
		movedObject.y = Y;
	}

	function addElementByHtml(code, myid){
		let newElement = document.querySelector("#"+myid+"conteiner")
		if(!newElement){
			newElement = document.createElement("div");
			newElement.id = myid+"conteiner";
			mainElementInHTML.append(newElement);
		}
		newElement.innerHTML = code;
	}


	/* Blocks in EditParams ===================== */

	function joinStrings(a,b){
		return String(a)+String(b)
	}

	function degToRadian(deg) {
		return (Math.PI / 180) * deg
	}

	function randomInteger(min, max) {
		let rand = min + Math.random() * (max + 1 - min)
		return Math.floor(rand)
	}

	function distanceBetween(first, second){
		return Math.floor(Math.sqrt(Math.pow(first.x - second.x, 2) + Math.pow(first.y - second.y, 2)))
	}

	function getModule(first, second) {
		return first % second;
	}

	function showMessege(myText){
		document.querySelector("#modal-window").showModal();
		document.querySelector("#inner-modal-window").innerHTML = myText;
		document.querySelector("#modal-window").classList.add("show-modal");
	}


	/* Different variables and function */
  HereMustBeCodeWithVariables====>


	/* Main Script */
	setTimeout(()=>{	
		canva.width =  window.innerWidth*2
		canva.height = window.innerHeight*2
		document.querySelector(".loadTips").style.display = "none"
		const DisplayWidth = canva.width
		const DisplayHeight = canva.height
		try{
			HereMustBeMainCode====>
		}catch(e){
			alert(e)
		}
	}, 300)
	</script>
</body>
</html>
''';
