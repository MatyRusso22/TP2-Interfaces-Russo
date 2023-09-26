size(200,200);

// carga el array de pixels
loadPixels();

for (int cadaPixel = 0; cadaPixel < pixels.length; cadaPixel++) {
 pixels[cadaPixel] = color(0,255,0); 
}

//actualiza la pantalla
updatePixels();
