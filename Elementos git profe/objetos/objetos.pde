PImage img;

void setup() {
  size(800, 600);
  img = loadImage("imagen.jpg"); 
  img.resize(width, height);
  image(img, 0, 0);
  thresholdImage();
}

void thresholdImage() {
  img.loadPixels();
  for (int i = 0; i < img.pixels.length; i++) {
    color pixelColor = img.pixels[i];
    float brightnessValue = brightness(pixelColor);
    if (brightnessValue > 150) {  // umbral
      img.pixels[i] = color(255);  // Color fondo
    } else {
      img.pixels[i] = color(0);    // Color objetos
    }
  }
  img.updatePixels();
  image(img, 0, 0);
}
