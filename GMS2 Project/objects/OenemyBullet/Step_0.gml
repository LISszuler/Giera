switch(state)
{
	case 0:
		
		if instance_exists(OPlayer)
		{
			dir = point_direction(x, y, OPlayer.x, OPlayer.y);
		}
		
		depth = -y - 50;
			
	break;
	
	case 1:
	
		xspd = lengthdir_x(spd, dir);
		yspd = lengthdir_y(spd, dir);
		x += xspd;
		y += yspd;
		
	break;
}

if bbox_right < 0 || bbox_left > room_width || bbox_bottom < 0 || bbox_top > room_height
{
	destroy = true;
}

if hitconfirm == true && PlayerDestroy == true
{
	destroy = true;
}

if destroy == true
{
	instance_destroy();
}

if place_meeting(x, y, OSolidWall)
{
	destroy = true;
}

