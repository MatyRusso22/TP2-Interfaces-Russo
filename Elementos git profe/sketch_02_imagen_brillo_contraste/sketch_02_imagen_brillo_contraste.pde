// Fuente de material y ejemplos: https://processing.org

PImage img;

void setup() {
  // partimos de un pantalla igual al tamaño de la imagen
  size(640, 359);
  img = loadImage("01_imagen.jpg");
}

void draw() {
  loadPixels();
  img.loadPixels();
  for (int x = 0; x < img.width; x++) {
    for (int y = 0; y < img.height; y++ ) {
      // calula la ubicación de 1D pixel 
      int loc = x + y*img.width;
      // Valores R,G,B 
      float r = red   (img.pixels[loc]);
      float g = green (img.pixels[loc]);
      float b = blue  (img.pixels[loc]);
      // Cambiar el brillo en función de la posición del mouse
      float adjustBrightness = ((float) mouseX / width) * 8.0;
      r *= adjustBrightness;
      g *= adjustBrightness;
      b *= adjustBrightness;
      // Evita que los  RGB estén fuera del rango correcto 0-255
      r = constrain(r,0,255);
      g = constrain(g,0,255);
      b = constrain(b,0,255);
      // nuevo color asignado al pixel, considera cada canal * el cambio de brillo
      color c = color(r,g,b);
      pixels[loc] = c;
    }
  }
  updatePixels();
}
