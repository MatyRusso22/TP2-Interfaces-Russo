uniform sampler2D mytexture;
varying vec3 texCoords;

void main(void) {
     vec2 uv = vec2((atan(texCoords.x, texCoords.z) / 3.1415926 + 1.0) * 0.5
                   ,(asin(texCoords.y) / 3.1415926 + 0.5));
     gl_FragColor = texture2D(mytexture, uv);
}