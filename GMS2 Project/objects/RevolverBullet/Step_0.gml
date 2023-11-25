xspd = lengthdir_x(spd, dir);
yspd = lengthdir_y(spd,dir);

x += xspd;
y += yspd;


//destroy
#region
if hitconfirm == true && enemyDestroy == true
{
	destroy =true
}

if destroy == true
{
	instance_destroy();
}

if place_meeting(x, y, OSolidWall)
{
	destroy = true
}

if point_distance(xstart, ystart, x, y) > maxDist
{
	destroy = true
}
#endregion



