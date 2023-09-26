// Fuente de material y ejemplos: https://processing.org
PImage img;

void setup() {
  size(640, 359);
  frameRate(30);
  img = loadImage("01_imagen.jpg");
}

//lado del cuadrado
int sideWidth = 200;

// se pueden usar diferentes matrices

float[][] matrix = { { 0.15, 0.15, 0.15 },
                     { 0.15,  0.15, 0.15 },
                     { 0.15, 0.15, 0.15 } };


void draw() {
  //Se aplicará la convolución en una parte de la imagen
  // se setea como imagen de fondo "la imagen completa"
  image(img,0,0);
  // rectángulo a procesar: hay un origen y tamaño de lado
  int xstart = 200;
  int ystart = 100;
  int xend = xstart + sideWidth;
  int yend = ystart + sideWidth;
  int matrixsize = 3;
  loadPixels();
  // para cada pixel pixel
  for (int x = xstart; x < xend; x++) {
    for (int y = ystart; y < yend; y++ ) {
      // pixel (x,y) se trata con una función de convolution()
      // que retorna un nuevo color 
      color c = convolution(x,y,matrix,matrixsize,img);
      int loc = x + y*img.width;
      pixels[loc] = c;
    }
  }
  updatePixels();

  stroke(0);
  noFill();
  rect(xstart,ystart,sideWidth,sideWidth);
}

color convolution(int x, int y, float[][] matrix, int matrixsize, PImage img) {
  float rtotal = 0.0;
  float gtotal = 0.0;
  float btotal = 0.0;
  int offset = matrixsize / 2;
  // Loop por la matriz de convolución
  for (int i = 0; i < matrixsize; i++){
    for (int j= 0; j < matrixsize; j++){
      // pixel analizado
      int xloc = x+i-offset;
      int yloc = y+j-offset;
      int loc = xloc + img.width*yloc;
      // controlar no sobrepasar los límites del array de pixels
      loc = constrain(loc,0,img.pixels.length-1);
      // Calcular la convolución
      // Sumar todos los vecinos multiplicados por la  matrix. Para cada canal
      rtotal += (red(img.pixels[loc]) * matrix[i][j]);
      gtotal += (green(img.pixels[loc]) * matrix[i][j]);
      btotal += (blue(img.pixels[loc]) * matrix[i][j]);
    }
  }
  // Asegurar rando RGB
  rtotal = constrain(rtotal,0,255);
  gtotal = constrain(gtotal,0,255);
  btotal = constrain(btotal,0,255);
  // Retornar nuevo color
  return color(rtotal,gtotal,btotal);
}
