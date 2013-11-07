//
// resize.js - resize canvas for processing.js
//
function resize() {
  var p = Processing.getInstanceById("processing-canvas");

  var canvas_aspect = p.getCanvasWidth() / p.getCanvasHeight();
  var window_aspect = window.innerWidth / window.innerHeight;
  
  var canvas_w, canvas_h, canvas_scale;
  
  if (window_aspect >= canvas_aspect) {
	// 縦幅を合わせるパターン
	canvas_w = window.innerHeight * canvas_aspect;
	canvas_h = window.innerHeight;
	canvas_scale = window.innerHeight / p.getCanvasHeight();
	$('#processing-canvas-container').css("padding-top", "0px");
  }
  else {
	// 横幅を合わせるパターン
	canvas_w = window.innerWidth;
	canvas_h = window.innerWidth / canvas_aspect;
	canvas_scale = window.innerWidth / p.getCanvasWidth();
	var padding_top = (window.innerHeight - canvas_h) / 2;
	$('#processing-canvas-container').css("padding-top", "" + padding_top + "px");
  }
  
  p.size(canvas_w, canvas_h);
  p.setCanvasScale(canvas_scale);
}

function init() {
  $(window).resize(resize);
  setTimeout(resize, 100);
}

$(document).ready(init);
