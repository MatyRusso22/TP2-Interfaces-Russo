float x=0;
float anguloZ=0;

void setup(){
  size(640, 360, P3D);
  frameRate(30);
}

void draw(){
  background(0);
  translate(width/2, height/2, 0);
  stroke(255);
  // se puede usar la función radians(anguloEnGrados)
  rotateX(PI/2);
  rotateZ(radians(anguloZ));
  noFill();
  
  beginShape();
  vertex(-100, -100, -100);
  vertex( 100, -100, -100);
  vertex(   0,    0,  100);
  
  vertex( 100, -100, -100);
  vertex( 100,  100, -100);
  vertex(   0,    0,  100);
  
  vertex( 100, 100, -100);
  vertex(-100, 100, -100);
  vertex(   0,   0,  100);
  
  vertex(-100,  100, -100);
  vertex(-100, -100, -100);
  vertex(   0,    0,  100);
  endShape();
  
  // modificar números y pensarlo en base al framerate
  anguloZ=anguloZ+1;
}
