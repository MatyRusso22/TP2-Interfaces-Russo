// ejemplo extraido y modificado de: https://processing.org/tutorials/p3d

int concentration = 600;  // probar 1 -> 10000  

void setup() {
  size(640, 480, P3D);
  frameRate(30);
  
}

void draw() {
  // prender y apagar luces descomentando o comentando
  background(0);

  noStroke();
  directionalLight(126, 126, 126, 0, 0, -1);
  //ambientLight(102, 102, 102);
  
  //directionalLight(128, 102, 126, 1, 0, 0);
  
  translate(240, 200, 0);
  rotateY(PI/5);
  box(160);
  
  spotLight(51, 102, 126, 200, 200, 1600, 
          0, 0, -1, PI/16, concentration); 
  
  translate(320, 200, 0);
  sphere(120);
  
}
