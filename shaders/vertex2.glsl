precision mediump float;

attribute vec3 vPosition;
attribute vec3 vColor;
varying vec3 fColor;

uniform float scale;
// uniform float alpha;
uniform vec3 trans3d;

uniform mat4 uModelViewMatrix;
uniform mat4 uProjectionMatrix;

void main() {
  fColor = vColor;

  vec4 pos = vec4(vPosition, 1.0);

  mat4 rotate = mat4(
    scale,            0.0, 0.0, 0.0,
      0.0,              1.0, 0.0, 0.0,
      0.0,              0.0, 1.0, 0.0,
    -0.5*scale+0.5,   0.0, 0.0, 1.0
  );

  mat4 translate = mat4(
    1.0,          0.0,        0.0,    0.0,
    0.0,          1.0,        0.0,    0.0, 
    0.0,          0.0,        1.0,    0.0,
    -0.5 + trans3d.x, trans3d.y, trans3d.z,  1.0
  );

  mat4 translate1 = mat4(
    1.0, 0.0, 0.0, 0.0,
    0.0, 1.0, 0.0, 0.0,
    0.0, 0.0, 1.0, 0.0,
    -0.5, 0.0, 0.0, 1.0
  );

  gl_Position = translate * rotate * pos;
}
