var _camX = camera_get_view_x(view_camera[0]);
var _camY = camera_get_view_y(view_camera[0]);
var _border = 8;
var _hudX = _camX + _border;
var _hudY = _camY + _border;



if instance_exists(OPlayer)
{
	
	draw_sprite(HealthBar, 0, _hudX, _hudY);

	for( var i = 0; i < PlayerMaxHp; i++)
	{
		var _img = 1;
		if i+1 <= PlayerHp 
		{
			_img = 2;
		}
	
		var _sep = 4;
		draw_sprite(HealthBar, _img, _hudX + _sep*i, _hudY);
	}
}

var _enemyCountOffset = 24;
var _echudX = _hudX;
var _ecHudY = _hudY + _enemyCountOffset;
draw_sprite(enemycount, 0, _echudX, _ecHudY)

draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_font(global.font_main);

draw_text( _echudX + 20, _ecHudY + 4, string(global.enemyKillCount));
draw_text( _echudX + 40, _ecHudY + 4, "/" + string(global.enemyRoomMax));

