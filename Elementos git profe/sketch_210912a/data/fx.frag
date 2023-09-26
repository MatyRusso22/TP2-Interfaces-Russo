// fx.frag
#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

varying vec3 p;

void main() {
  float gray = step(0.5, fract(p.x * 0.05));
  gl_FragColor = vec4(vec3(gray), 1.0);
}