#version 140
in vec2 v_tex_coords;
in vec3 v_normal;
in float v_lighted;

uniform sampler2D tex;
uniform vec3 v_light;
uniform vec3 light_color;
uniform vec3 dark_color;

out vec4 color;

void main() {
    float brightness = dot(normalize(v_normal), normalize(v_light));
    float lighted = v_lighted;
    if (lighted < 0.2) {
      lighted = 0.2;
    }
    vec4 ratio = vec4(mix(dark_color, light_color, brightness), 1.0);
    ratio = vec4(lighted, lighted, lighted, 1.0) * ratio;
    color = ratio * texture(tex, v_tex_coords);
}
