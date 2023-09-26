// ejemplo extraido y modificado de: https://processing.org/tutorials/p3d

void setup() {
  size(640, 360, P3D);
  frameRate(30);
}

void draw() {
  background(0);
  // modificar los ejes 
  camera(mouseX, height/2, (height/2) / tan(PI/6), mouseX, height/2, 0, -1, 1, 0);
  translate(width/2, height/2, -100);
  stroke(255);
  noFill();
  box(200);
}
