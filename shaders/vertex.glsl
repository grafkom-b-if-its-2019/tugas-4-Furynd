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

  // mat4 rotate = mat4(cos(theta), 0.0, -sin(theta), 0.5*cos(theta)-0.5,
  //                    0.0,        1.0,        0.0, 0.0,
  //                    sin(theta), 0.0, cos(theta), 0.5*sin(theta),//+sin(alpha)/10.0,
  //                    0.0,        0.0,        0.0, 1.0);

  gl_Position = pos;
}
