precision highp float;

attribute vec3 aVertexPosition;
attribute vec3 aVertexNormal;

uniform mat4 uMVPMatrix;
uniform mat3 uNMatrix;

varying vec3 vLightWeighting;

void main(void) {
  gl_Position = uMVPMatrix * vec4(aVertexPosition, 1.0);
  vec3 transformedNormal = uNMatrix * aVertexNormal;
  vec3 uLightingDirection = vec3(1.0, 1.0, -1.0);
  vec3 uAmbientColor = vec3(0.2, 0.2, 0.2);
  vec3 uDirectionalColor = vec3(0.8, 0.8, 0.8);
  float directionalLightWeighting = max(dot(transformedNormal, uLightingDirection), 0.0);
  vLightWeighting = uAmbientColor + uDirectionalColor * directionalLightWeighting;
}
