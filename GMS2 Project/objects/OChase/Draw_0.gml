draw_sprite_ext(sprite_index, image_index, x, y, face, image_yscale, image_angle, image_blend, image_alpha);

var _healthPercent = hp/maxhp;
var _hpimage = _healthPercent * (sprite_get_number(EnemyHealth) - 1);
draw_sprite(EnemyHealth, _hpimage, x, y - sprite_height);