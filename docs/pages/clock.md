---
layout: page
title: The end is the beginning is the end
excerpt: "The end is the beginning is the end"
date: '2020-09-26T18:00:00+01:00'
enable_chat: true
hidelogo: true
search_omit: true
permalink: '/clock/'
---
<figure class="center" title="Εν το παν και δι' αυτού το παν και εις αυτό το παν, και ει μη έχοι το παν, ουδέν έστι το παν.">
    <canvas id="canvas"></canvas><br />
</figure>

<figure>
    {% include responsive-embed url="https://www.youtube.com/embed/vWD7k6TrJ-g?rel=0" ratio="16:9" %}
</figure>

<script type="text/javascript">
var canvas = document.getElementById('canvas');
var ctx = canvas.getContext('2d');
var min, sec, hr, ms, amOrPm = 'AM';
var radH, radM, radS;
const threePIByTwo = (3 * Math.PI) / 2;
var backgroundSrc = "/images/ouroboros-white-transparent.png";
var backgroundImage = new Image();

function init() {
    backgroundImage.src = backgroundSrc;

   // window.addEventListener('resize', resizeCanvas, false);
   resizeCanvas();
}

function resizeCanvas() {
    var size = Math.min(window.innerWidth / 2, window.innerHeight / 2);
    canvas.width = 530; //size;
    canvas.height = 530; //size;
    window.requestAnimationFrame(draw);
}

function draw(now) {
	var centerX = canvas.width / 2,
		centerY = canvas.height / 2,
		date = new Date();

	hr = date.getHours();
	min = date.getMinutes();
	sec = date.getSeconds();
	ms = date.getMilliseconds();
	if(hr > 12)	{
		amOrPm = 'PM';
        hr -= 12;
	}
	radH = 0.000008333 * ( ( hr * 60 * 60 * 1000 ) + ( min * 60 * 1000 ) + ( sec * 1000 ) + ms );
	radM = 0.0001 * ( ( min * 60 * 1000 ) + ( sec * 1000 ) + ms );
	radS = 0.006 * ( ( sec * 1000 ) + ms );

	drawRect(0, 0, canvas.width, canvas.height, '#ffffff');
	drawCircle(centerX, centerY, 220, 0, Math.PI * 2, false, '#FBFBFB', 'stroke', 30); //secondgrey
	drawCircle(centerX, centerY, 220, threePIByTwo, rad(radS) + threePIByTwo, false, '#000000', 'stroke', 30); //second
	drawCircle(centerX, centerY, 180, 0, Math.PI * 2, false, '#FBFBFB', 'stroke', 50); //minutegrey
	drawCircle(centerX, centerY, 180, threePIByTwo, rad(radM) + threePIByTwo, false, '#808080', 'stroke', 50); //minute
	drawCircle(centerX, centerY, 110, 0, Math.PI * 2 , false, '#FBFBFB', 'stroke', 90); //hourgrey
	drawCircle(centerX, centerY, 110, threePIByTwo, rad(radH) + threePIByTwo, false, '#C0C0C0', 'stroke', 90); //hour
	drawCircle(centerX, centerY, 95, 0, Math.PI * 2, false, '#ffffff', 'fill', '50'); //inner
	drawText(`${hr.toString().length == 1?'0'+hr:hr}:${min.toString().length == 1?'0'+min:min}:${sec.toString().length == 1?'0'+sec:sec}`, canvas.width / 2 - 63, canvas.height / 2 + 15, '#000000', '40px');
	drawText(amOrPm, canvas.width / 2 - 15, canvas.height / 2 + 50, '#000000', '25px');
    ctx.drawImage(backgroundImage, -5, -5, canvas.width+10, canvas.height+10);    
    window.requestAnimationFrame(draw);
}

init();

function rad(deg){
	return  (Math.PI / 180) * deg;
}

function drawText(text, x, y, color, size) {
	ctx.font = `${size} "Passion One"`;
	ctx.fillStyle = color;
	ctx.fillText(text, x, y);
}

function drawRect(x, y, width, height, color) {
	ctx.fillStyle = color;
	ctx.fillRect(x, y, width, height);
}

function drawArc(x, y, radius, start, end, clockwise)
{
	ctx.beginPath();
	ctx.arc(x, y, radius, start, end, clockwise);
}

function drawCircle(x, y, radius, start, end, clockwise, color, type, thickness) {
	if(type == 'fill') 	{
		ctx.fillStyle = color;
		drawArc(x, y, radius, start, end, clockwise)
		ctx.fill();
	} else if(type == 'stroke') {
		ctx.strokeStyle = color;
		ctx.lineWidth = thickness;
		drawArc(x, y, radius, start, end, clockwise)
		ctx.stroke();
	}
}

</script>