precision mediump float;

attribute vec3 vPosition;
attribute vec3 vColor;
varying vec3 fColor;

uniform float theta;
uniform mat4 uModelViewMatrix;
uniform mat4 uProjectionMatrix;

void main() {
  fColor = vColor;

  vec4 pos = vec4(vPosition, 1.0);

  gl_Position = uProjectionMatrix * uModelViewMatrix * pos;
}
