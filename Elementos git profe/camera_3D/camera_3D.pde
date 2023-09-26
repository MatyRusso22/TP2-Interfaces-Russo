// ejemplo extraido y modificado de: https://processing.org/tutorials/p3d

void setup() {
  size(640, 360, P3D);
  frameRate(30);
}

void draw() {
  background(0);
  camera(mouseX, height/2, (height/2) / tan(PI/6), width/2, height/2, 0, 0, 1, 0);
  translate(width/2, height/2, -100);
  stroke(255);
  noFill();
  box(200);

  stroke(0,255,0);
  line(-200, 0, 0, 200, 0, 0);
  line(0, -200, 0, 0, 200, 0);
  line(0, 0, -200, 0, 0, 200);
}
