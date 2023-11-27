var _getDmg = true;
var _wallcollisions = true;

switch(state)
{
	case -1:
	
	if image_alpha < 1
	{
		spd = 0;
		image_alpha += fadeSpd;
	}
	
	_wallcollisions = false
	_getDmg = false
	if image_alpha >= 1
	{
		spd = spawnSpd;
		dir = 270;
	}
	
	if !place_meeting(x, y, Owall)
	{
		state = 0;
	}
	
	break;
	
	case 0:
		
		if instance_exists(OPlayer)
		{
			dir = point_direction(x, y, OPlayer.x, OPlayer.y);
		}
		
		spd = chaseSpd;
		
		var _camLeft = camera_get_view_x(view_camera[0]);
		var _camRight = _camLeft + camera_get_view_width(view_camera[0]);
		var _camTop = camera_get_view_y(view_camera[0]);
		var _camBottom = _camTop + camera_get_view_height(view_camera[0]);
		
		if bbox_right > _camLeft && bbox_left < _camRight && bbox_bottom > _camTop && bbox_top < _camBottom
		{
			shootTimer++;
		}
		
		if shootTimer > cooldownTime
		{
			state = 1;
			shootTimer = 0;
		}
	break;
	
	case 1:
		
		if instance_exists(OPlayer)
		{
			dir = point_direction(x, y, OPlayer.x, OPlayer.y);
		}
		
		spd = 0;
		
		image_index = 0;
		
		shootTimer ++;
		
		if shootTimer == 1
		{
			bulletInst = instance_create_depth(x + bulletxOffset * face, y + bulletyOffset, depth, OenemyBullet);
		}
		
		if shootTimer <= windupTime && instance_exists(bulletInst)
		{
			bulletInst.x = x + bulletxOffset;
			bulletInst.y = y + bulletyOffset;
		}
		
		if shootTimer == windupTime && instance_exists(bulletInst)
		{
			bulletInst.state = 1;
		}
		
		if shootTimer > windupTime + recoverTime
		{
			state = 0;
			shootTimer = 0;
		}
	break;
	
}


	xspd = lengthdir_x(spd, dir);
	yspd = lengthdir_y(spd, dir);

if dir > 90 && dir < 270
{
	face = 1;
} else {
	face = -1;
}

if _wallcollisions = true
{
	if place_meeting(x + xspd, y, Owall)
	{
		xspd = 0;
	}
	
	if place_meeting(x, y + yspd, Owall)
	{
		yspd = 0;
	}
}

	if place_meeting(x + xspd, y, OEnemyParent)
	{
		xspd = 0;
	}
	
	if place_meeting(x, y + yspd, OEnemyParent)
	{
		yspd = 0;
	}

x += xspd;
y += yspd;

depth = -y;

if _getDmg = true
{
	event_inherited();
}
