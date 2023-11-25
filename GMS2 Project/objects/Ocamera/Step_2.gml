var _camw = camera_get_view_width(view_camera[0]);
var _camh = camera_get_view_height(view_camera[0]);

if instance_exists(OPlayer)
{
	x = OPlayer.x - _camw/2;
	y = OPlayer.centerY - _camh/2;
}

x = clamp(x, 0, room_width - _camw)
y = clamp(y, 0, room_height - -_camh)

camera_set_view_pos( view_camera[0], x, y);



