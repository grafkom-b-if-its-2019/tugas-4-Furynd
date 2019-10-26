precision mediump float;

attribute vec2 vPosition;
attribute vec3 vColor;
varying vec3 fColor;

uniform float scale;
uniform float alpha;

void main() {
  fColor = vColor;

  vec4 pos = vec4(vPosition, 0.0, 1.0);

  mat4 dilate = mat4(scale, 0.0, 0.0, -0.5*scale+0.5,
                     0.0,   1.0, 0.0, 0.0,// -sin(alpha)/10.0,
                     0.0,   0.0, 1.0, 0.0,
                     0.0,   0.0, 0.0, 1.0);

  gl_Position = pos*dilate;
}
