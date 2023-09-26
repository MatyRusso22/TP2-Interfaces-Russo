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
  for (int x = 0; x < img.width; x++) {
    for (int y = 0; y < img.height; y++ ) {
      // calula la ubicación de 1D pixel 
      int loc = x + y*img.width;
      // Valores R,G,B 
      float r = red   (img.pixels[loc]);
      float g = green (img.pixels[loc]);
      float b = blue  (img.pixels[loc]);
      
      // Crea un color para el pixel y lo asigna - Processing guarda los pixels en un vector
      color c = color(0,0,b);
      pixels[loc] = c;
    }
  }
  // actualiza pixels
  updatePixels();
}
