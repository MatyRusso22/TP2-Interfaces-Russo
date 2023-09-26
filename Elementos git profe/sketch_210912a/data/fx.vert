// fx.vert
uniform mat4 transformMatrix;
attribute vec4 position;

varying vec3 p;

void main() {
  gl_Position = transformMatrix * position;
    
  p = position.xyz;
}