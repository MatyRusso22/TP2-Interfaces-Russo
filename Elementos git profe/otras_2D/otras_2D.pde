void setup()
{
  size(400, 400);
}

void draw(){
  background(255);
  smooth();
  fill(192);
  noStroke();
  // dibujo un rect
  rect(100, 100, 40, 40);

  pushMatrix();
  // muevo el origen al punto PIVOT (coincide con el origen del triángulo)
  translate(100, 100);

  // roto
  rotate(radians(45));

  // dibujo otro rectángulo y aplico escalado a la vez
  fill(0);
  scale(width/(mouseY+10),height/(mouseY+10));
  rect(0, 0, 40, 40);
  popMatrix();
}
