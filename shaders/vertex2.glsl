precision mediump float;

attribute vec3 vPosition;
attribute vec3 vColor;
varying vec3 fColor;

uniform float scale;
// uniform float alpha;
uniform vec3 rot3d;

void main() {
  fColor = vColor;

  vec4 pos = vec4(vPosition, 1.0);

  mat4 dilate = mat4(scale, 0.0, 0.0, -0.5*scale+0.5,
                     0.0,   1.0, 0.0, 0.0,// -sin(alpha)/10.0,
                     0.0,   0.0, 1.0, 0.0,
                     0.0,   0.0, 0.0, 1.0
  );

  mat4 translate = mat4(
    1.0, 0.0, 0.0, rot3d.x,
    0.0, 1.0, 0.0, rot3d.y,
    0.0, 0.0, 1.0, rot3d.z,
    0.0, 0.0, 0.0, 1.0
  );

  gl_Position = pos*dilate * translate;
}
