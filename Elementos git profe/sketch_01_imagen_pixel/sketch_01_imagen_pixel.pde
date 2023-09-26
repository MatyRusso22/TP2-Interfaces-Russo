// Fuente de material y ejemplos: https://processing.org

PImage img;

void setup() {
  // partimos de un pantalla igual al tamaño de la imagen
  size(640, 359);
  img = loadImage("01_imagen.jpg");
}

void draw() {
  loadPixels();
  // Se lee la imagen pixel por pixel
  img.loadPixels();
  for (int y = 0; y < height; y++) {
    for (int x = 0; x < width; x++) {
      // calula la ubicación de 1D pixel 
      int loc = x + y*width;

      //  red(), green(), and blue() toman los 3 componentes de color de un pixel.
      float r = red(img.pixels[loc]);
      float g = green(img.pixels[loc]);
      float b = blue(img.pixels[loc]);
      // coloca el pixel de la imagen en el pixel de la pantalla
      pixels[loc] =  color(r,g,b);
    }
  }
  updatePixels();
}
