uniform mat4 transform;
uniform mat3 normalMatrix;
uniform vec3 rotation;
attribute vec4 vertex;
attribute vec3 normal;
varying vec3 texCoords;

mat3 vec3RotMat(vec3 axis, float ang) {
    vec3  a = normalize(axis);
    float s = sin(ang);
    float c = cos(ang);
    float oc = 1.0 - c; 
    return mat3(oc*a.x*a.x+c,oc*a.x*a.y-a.z*s,oc*a.z*a.x+a.y*s,
                oc*a.x*a.y+a.z*s,oc*a.y*a.y+c,oc*a.y*a.z-a.x*s,
                oc*a.z*a.x-a.y*s,oc*a.y*a.z+a.x*s,oc*a.z*a.z+c);
}
void main() {  	
   gl_Position = transform * vertex;      
   texCoords = normalize(normalMatrix * normal)
             * vec3RotMat(vec3(0.0,0.0,1.0),rotation.z)
             * vec3RotMat(vec3(0.0,1.0,0.0),rotation.y)   					 
             * vec3RotMat(vec3(1.0,0.0,0.0),rotation.x);
}