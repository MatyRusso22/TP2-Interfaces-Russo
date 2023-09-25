// El terreno está armado en base a este tutorial:  Code for: https://youtu.be/IKB1hWWedMk (Daniel Shiffman)
// Los OBJ son de Turbosquid

// SE DEBE IMPLEMENTAR EL CÓDIGO DONDE SE INDICA // *** COMPLETAR ACÁ *** 

PImage img;
PShape model;

float velocidadRotacion = 3;

float rotaX, rotaY, rotaZ = 0;

int cols, rows;
int scl = 20;
int w = 1600;
int h = 800;
float flying = 0;
float[][] terrain;

boolean grillaOn = true;

boolean cameraOn = false;
float anguloCamera = 0;

void setup(){
  size(800, 600, P3D);
  frameRate(30);
  
  model = loadShape("dice.obj");
  shapeMode(CORNERS);
  
  cols = w / scl;
  rows = h/ scl;
  terrain = new float[cols][rows];
}

void dibujarGrilla(int espacio){
  stroke(96, 96, 0);
  for (int x = 0; x <= w; x += espacio) {
    line(x, 0, x, h);
  }
  
  for (int y = 0; y <= h; y += espacio) {
    line(0, y, w, y);
  }
}

void terreno3D(){
  flying -= 0.1;

  float yoff = flying;
  for (int y = 0; y < rows; y++) {
    float xoff = 0;
    for (int x = 0; x < cols; x++) {
      terrain[x][y] = map(noise(xoff, yoff), 0, 1, -100, 50);
      xoff += 0.2;
    }
    yoff += 0.2;
  }

  stroke(255);
  noFill();
  translate(width/2, height/2);
  rotateX(PI/3);
  translate(-w/2, -h/2);
  for (int y = 0; y < rows-1; y++) {
    beginShape(TRIANGLE_STRIP);
    for (int x = 0; x < cols; x++) {
      vertex(x*scl, y*scl, terrain[x][y]);
      vertex(x*scl, (y+1)*scl, terrain[x][y+1]);
    }
    endShape();
  }
  translate(w/2, h/2);
  rotateX(-PI/3);
}

void draw(){
  background(0);
  
  if (cameraOn) {
    beginCamera();
    camera();
    rotateY(radians(anguloCamera));
    endCamera();
  }
  
  if (grillaOn) {
    translate(0, -50, 150);
    dibujarGrilla(20);
    translate(0, 50, -150);
  }

  terreno3D();
  
  lights();
  
  translate(0, -50, 150);
  
  if (keyPressed) {
    if (key == 'W' || key == 'w') {
      rotaX += velocidadRotacion;
    }
    if (key == 'S' || key == 's') {
      rotaX -= velocidadRotacion;
    }
    if (key == 'A' || key == 'a') {
      rotaY += velocidadRotacion;
    }
    if (key == 'D' || key == 'd') {
      rotaY -= velocidadRotacion;
    }
    if (key == 'Q' || key == 'q') {
      rotaZ += velocidadRotacion;
    }
    if (key == 'E' || key == 'e') {
      rotaZ -= velocidadRotacion;
    }
  }
  
  rotateX(radians(rotaX));
  rotateY(radians(rotaY));
  rotateZ(radians(rotaZ));
  
  stroke(0, 255, 0);
  line(0, -100, 0, 0, 100, 0);
  
  scale(10);
  shape(model);
}

void keyReleased(){
  if (key == 'G' || key == 'g') {
    grillaOn = !grillaOn;
  }
}

void mouseDragged() {
  if (cameraOn) {
    float deltaMouseX = mouseX - pmouseX;
    anguloCamera += deltaMouseX * 0.5;
  }
}

void mouseReleased() {
  cameraOn = false;
}

void mousePressed() {
  cameraOn = true;
}
