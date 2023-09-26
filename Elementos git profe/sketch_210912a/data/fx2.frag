// fx.frag
#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif



varying vec3 p;

void main() {

  vec3 color = vec3(0.9 * sin(p.x) + 0.5, 0.3 * sin(p.y) + 0.4, sin(p.z));

  gl_FragColor = vec4(color, 1.0);
}