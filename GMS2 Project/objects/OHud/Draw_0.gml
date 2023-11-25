var _camX = camera_get_view_x(view_camera[0]);
var _camY = camera_get_view_y(view_camera[0]);

if instance_exists(OPlayer)
{
	var _border = 8;
	draw_sprite(HealthBar, 0, _camX+_border, _camY+_border);

	for( var i = 0; i < PlayerMaxHp; i++)
	{
		var _img = 1;
		if i+1 <= PlayerHp 
		{
			_img = 2;
		}
	
		var _sep = 4;
		draw_sprite(HealthBar, _img, _camX+_border + _sep*i, _camY+_border);
	}
}


