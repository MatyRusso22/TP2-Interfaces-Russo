// El terreno está armado en base a este tutorial:  Code for: https://youtu.be/IKB1hWWedMk (Daniel Shiffman)
// Los OBJ son de Turbosquid

// SE DEBE IMPLEMENTAR EL CÓDIGO DONDE SE INDICA // *** COMPLETAR ACÁ *** 

PImage img;
PShape model;

// velocidadRotacion indicará cuántos grados queremos rotar el cubo 
// cada vez que presionamos una tecla (la tecla determinará el eje y sentido de rotación
float velocidadRotacion = 3;

// se usan para mantener los ángulos de rotación
float rotaX, rotaY, rotaZ = 0;

// estas definiciones son para el terreno
int cols, rows;
int scl = 20;
int w = 1600;
int h = 800;
float flying = 0;
float[][] terrain;
// 

// permitirá activar o desactivar la grilla
boolean grillaOn = true;


void setup(){
  size(800, 600, P3D);
  frameRate(30);
  
  // necesita el archivo ojo.mtl (biblioteca de materiales)
  model = loadShape("dice.obj");
  // este modo establece como ejes locales el centro del objeto (modelo) importado
  shapeMode(CORNERS);
  
  // definiciones para el terreno 3D
  cols = w / scl;
  rows = h/ scl;
  terrain = new float[cols][rows];
  //
  
  
}

// Este procedimiento crea una grilla plana en la vista 
// se deben dibujar líneas verticales y líneas horizontales
void dibujarGrilla(int espacio){
  stroke(96,96,0);
   // Dibuja las líneas verticales
  for (int x = 0; x <= w; x += espacio) {
    line(x, 0, x, h);
  }
  
  // Dibuja las líneas horizontales
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
      // la función noise retorna secuencias al asar https://processing.org/reference/noise_.html
      // la función map MAPEA esos random a coordenadas de nuestra escena
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
      // probar comentar los VERTEX anteriores y descomentar esto
      //rect(x*scl, y*scl, scl, scl);
    }
    endShape();
  }
  translate(w/2, h/2);
  rotateX(-PI/3);

  
}

void draw(){
  background(0);
    
  if (grillaOn) {
    translate(0, -50, 150);
    dibujarGrilla(20);
    translate(0, 50, -150);
  }


  // dibuja el terreno
  terreno3D();
  
  
  lights();
  
  // posiciona el CUBO
  translate(0,-50,150);
  
  if (keyPressed) {
    if (key == 'W' || key == 'w') {
      // Rotar el cubo en el eje X en sentido positivo
      rotaX += velocidadRotacion;
    }
    if (key == 'S' || key == 's') {
      // Rotar el cubo en el eje X en sentido negativo
      rotaX -= velocidadRotacion;
    }
    if (key == 'A' || key == 'a') {
      // Rotar el cubo en el eje Y en sentido positivo
      rotaY += velocidadRotacion;
    }
    if (key == 'D' || key == 'd') {
      // Rotar el cubo en el eje Y en sentido negativo
      rotaY -= velocidadRotacion;
    }
    if (key == 'Q' || key == 'q') {
      // Rotar el cubo en el eje Z en sentido positivo
      rotaZ += velocidadRotacion;
    }
    if (key == 'E' || key == 'e') {
      // Rotar el cubo en el eje Z en sentido negativo
      rotaZ -= velocidadRotacion;
    }
  }
  
  // Aplicar las rotaciones en función de los ángulos
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
      grillaOn =  !(grillaOn);
    }
   
}
