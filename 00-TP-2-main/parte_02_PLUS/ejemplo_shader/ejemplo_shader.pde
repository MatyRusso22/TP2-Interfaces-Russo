// COMPLETAR CON LO NECESARIO PARA USAR LA LIBRERÍA PeasyCam
// u otro tipo de cámara

PShader fx;



void setup(){
  size(800, 600, P3D);
  frameRate(30);
  
  // Esta instrucción carga el Shader desde el archivo que esté en la carpeta data
  // fx = loadShader("color_cambiante_2.frag");
  // invocar el shader que corresponda
   
}


void draw(){
  background(0);
  
  lights();
  
  translate(0,0,0);
  
  // ejemplos de como pasarle datos al shader
  //float currentTime=millis()/1000.0;
  //fx.set("u_time",currentTime);
  // fx.set("u_resolution", float(width), float(height));
  
  // se invoca al shader antes de armar el objeto
  //shader(fx); 
  //hint(DISABLE_OPTIMIZED_STROKE);
  
  scale(5);
  box(40);
  
  
}
