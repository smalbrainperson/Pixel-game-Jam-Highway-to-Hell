shader_type canvas_item;
render_mode unshaded;

uniform sampler2D SCREEN_TEXTURE: hint_screen_texture, repeat_disable, filter_nearest;
uniform float pixel_size: hint_range(1.0, 16.0, 1.0) = 1.0;
uniform float color_range: hint_range(1.0, 255, 1.0);

void fragment() {
	float x = FRAGCOORD.x - mod(FRAGCOORD.x, pixel_size);
	float y = FRAGCOORD.y - mod(FRAGCOORD.y, pixel_size);
	float shift = floor(pixel_size / 2.0);
	COLOR = texture(SCREEN_TEXTURE, vec2(x + shift, y + shift) * SCREEN_PIXEL_SIZE);
	COLOR.r = floor(COLOR.r * color_range)/color_range;
	COLOR.g = floor(COLOR.g * color_range)/color_range;
	COLOR.b = floor(COLOR.b * color_range)/color_range;
}
