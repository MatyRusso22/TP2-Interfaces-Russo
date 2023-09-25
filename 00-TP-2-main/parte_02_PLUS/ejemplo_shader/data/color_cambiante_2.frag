#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform float u_time;

void main(){
    vec3 color=vec3(0.3,0.5,0.9);
    vec2 st = gl_FragCoord.xy/u_resolution.xy;

    float pct = 0.0;
    // a. The DISTANCE from the pixel to the center
    pct = distance(st,vec2(sin(u_time)));
    color = vec3(pct*0.6,pct*.34,pct*0.98);

    // Show the coordinates of the space on the background
    //color = vec3(st.y,st.y,0.0);

    //color = vec3(sin(st.x),sin(st.y),0.6);


    gl_FragColor = vec4(color,1.0);
}