varying vec4 vertColor;
varying vec3 ecNormal;
varying vec3 lightDir;

void main() {  
  vec3 direction = normalize(lightDir);
  vec3 normal = normalize(ecNormal);
  float intensity = max(0.0, dot(direction, normal));//Pattern 3
  gl_FragColor = vec4(intensity, intensity, intensity, 1) * vertColor;
}