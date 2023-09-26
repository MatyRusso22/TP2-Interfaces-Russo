
void setup(){
  size(640, 360, P3D);
  frameRate(30);
}

void draw(){
  //background(0);
  // Especifica la cantidad a desplazar un objeto en la pantalla
  // translate(x,y,z)
  // x--> izq/der  , y --> arriba/abajo , z --> hacia adelante/hacia atrás
  //translate(width/2, height/2, 0);
  translate(width/2, height/2, mouseX-mouseY);
  stroke(255);
  // se puede usar la función radians(anguloEnGrados)
  rotateX(PI/2);
  rotateZ(PI/8);
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
  
}
