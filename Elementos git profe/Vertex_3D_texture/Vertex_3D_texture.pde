PImage img;
PShape model;

void setup(){
  size(640, 360, P3D);
  frameRate(30);
  img = loadImage("ojo.jpg");
  // necesita el archivo ojo.mtl (biblioteca de materiales)
  model = loadShape("ojo.obj");
}

void draw(){
  background(0);
  lights();
    // directionalLigth --> (red, green, blue, direcionEnX, direccionEnY, direccionEnZ)
    directionalLight(51, 102, 126, -1, 0, 0);
    directionalLight(255, 0, 100, 1, 0, 0);
  scale(50);
  translate(5, 3, 0);
  rotateY(radians(mouseX));
  rotateX(radians(mouseY));
  shape(model);
  
}
