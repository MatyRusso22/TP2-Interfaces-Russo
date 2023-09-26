import peasy.*;

PShader   shader;
PImage    tex;
//https://discourse.processing.org/t/pshader-peasycam-texture-not-rotating/31224/4

PeasyCam  cam;

void setup() {
  size(500,500,P3D);
  frameRate(30);
  cam        = new PeasyCam(this, 300);
  tex        = loadImage("uv_mapper.jpg");
  shader     = loadShader("shader.frag", "shader.vert");
  shader.set("mytexture", tex);
}

void draw() {
  background(0);
  shader.set("rotation",cam.getRotations(),3);  
  shader(shader);    
  //stroke(128);
  noStroke();
  hint(DISABLE_OPTIMIZED_STROKE);
  fill(255);
  sphere(100);
}
