// ejemplo extraido y modificado de: https://processing.org/tutorials/p3d


void setup() {
  size(200, 200, P3D);
  frameRate(30);
}

void draw() {
  background(0);
  translate(100, 100, 0);
  if (mousePressed) {
    lights();
    // probar cambiar los ejes
    directionalLight(0, 255, 0, 0, 1, 0);
  }
  noStroke();
  fill(128);
  sphere(50);
}
