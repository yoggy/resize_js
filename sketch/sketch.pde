//
// code.pde - sample sketch for resize.js
//

// for html canvas...
float canvas_scale = 1.0;
int canvas_w = 640;
int canvas_h = 480;

int getCanvasWidth()  { return canvas_w; }
int getCanvasHeight() { return canvas_h; }
void setCanvasScale(float val) { canvas_scale = val;}

///////////////////////////////////////////////////

int count = 0;
PFont pfont;
PImage img;

void setup() {
  size(canvas_w, canvas_h);
  frameRate(30);

  pfont = createFont("Meiryo", 64);
}

void draw() {
  // for html canvas...
  pushMatrix();
  scale(canvas_scale);

  // draw content...
  background(0, 0, 255);

  translate(canvas_w/2, canvas_h/2);
  rotate(PI * count / 100.0);
  count ++;

  int w = canvas_w / 2 - 10;
  int h = canvas_h / 2 - 10;

  stroke(255, 255, 255);
  strokeWeight(5);
  for (int x0 = -w; x0 < w; x0 += 30) {
	int x1 = -x0;
    line(x0, -h, x1, h);
  }

  fill(255,255,0);
  drawText("あいうえお", -150, 20, 3, #ffffff, #000000, pfont);

  // for html canvas...
  popMatrix();
}

void drawText(String str, int x, int y, int weight, color fg, color bg, PFont pfont) {
  textFont(pfont);
  for (int dy = -weight; dy <= weight; ++dy) {
    for (int dx = -weight; dx <= weight; ++dx) {
    if (dx*dx + dy*dy > weight*weight) continue;
    fill(bg);
    text(str, x + dx, y + dy);
    }
  }
  fill(fg);
  text(str, x, y);
}