import peasy.PeasyCam;
PeasyCam cam;
PShader fx;

void setup() {
  size(600, 600, P3D);
  frameRate(30);
  cam = new PeasyCam(this, 400);
  fx = loadShader("fx.frag", "fx.vert");
  shader(fx);  
  noStroke();
  hint(DISABLE_OPTIMIZED_STROKE);
}

void draw() {
  background(0);
  sphere(150);
}
