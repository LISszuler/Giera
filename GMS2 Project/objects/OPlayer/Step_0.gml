//Keys
#region
rightKey = global.rightKey
leftKey = global.leftKey
upKey = global.upKey
downKey = global.downKey
shootKey = global.shootKey
swapKey = global.swapKey
#endregion

//movement
#region
	var _horizKey = rightKey - leftKey;
	var _vertKey = downKey - upKey;
	moveDir = point_direction(0, 0,_horizKey, _vertKey);

	var _spd = 0;
	var _inputlevel = point_distance(0, 0, _horizKey, _vertKey);
	_inputlevel = clamp(_inputlevel, 0, 1)
	_spd = moveSpd * _inputlevel;

	xspd = lengthdir_x(_spd, moveDir);
	yspd = lengthdir_y(_spd, moveDir);
	
	if place_meeting(x + xspd, y,Owall)
	{
		xspd = 0;
	}
	
	if place_meeting(x, y + yspd, Owall)
	{
		yspd = 0;
	}
	
	x += xspd;
	y += yspd;
	
	depth = -bbox_bottom;
#endregion

//dmg
get_dmg(ODmgPlayer, true);

//aim
#region
centerY = y + centerYOffset;
aimDir = point_direction(x, centerY, mouse_x, mouse_y);
#endregion

//sprite control
#region
face = round(aimDir/90);
if face == 4 {face = 0;};

//if xspd == 0 && yspd == 0
//{
//	image_index = 0;
//}

sprite_index = sprite[face];
#endregion

//swaping
#region
var _playerweapons = global.inventory;
if swapKey
{
	
	selectedWeapon++;
	if selectedWeapon >= array_length(_playerweapons)
	{
		selectedWeapon = 0
	}
	
	weapon = _playerweapons[selectedWeapon]
}

#endregion

//shooting
#region
if shootTimer > 0
{
	shootTimer--;
}

if shootKey && shootTimer <= 0
{
	shootTimer = weapon.cooldown;
	
	var _xOffset = lengthdir_x(weapon.length + weaponOffset, aimDir);
	var _yOffset = lengthdir_y(weapon.length + weaponOffset, aimDir);
	var _spread = weapon.spread;
	var _spreadDiv = _spread / max(weapon.bulletNum-1, 1);
	
	
	for (var i = 0; i < weapon.bulletNum; i++)
	{
		var _bulletinst = instance_create_depth(x +_xOffset, centerY + _yOffset - 2, depth-100, weapon.bullet);
		with(_bulletinst)
		{
			dir = other.aimDir - _spread/2 + _spreadDiv*i;
			
			if dirFix == true
			{
				image_angle = dir;
			}
		}		
	}
}
#endregion

//death
if hp <= 0
{
	instance_create_depth(0, 0, 0, OGameOver);
	instance_destroy()
}	
