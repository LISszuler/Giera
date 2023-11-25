function create_weapon(_sprite, _length, _bullet, _cooldown, _bulletNum = 1, _spread = 0,) constructor
{
	sprite = _sprite;
	length = _length;
	bullet = _bullet;
	cooldown = _cooldown;
	bulletNum = _bulletNum;
	spread = _spread;
	
}

//weapon inventory
global.inventory = array_create(0);


//weapons
#region
global.WeaponList = 
{
	shotgun : new create_weapon
	(
	Shotgun,
	sprite_get_bbox_right(Shotgun),
	ShotgunBullet,
	15,
	8,
	45
	),
	
	revolver : new create_weapon
	(
	Revolver,
	sprite_get_bbox_right
	(Revolver),
	RevolverBullet,
	20,
	1
	),	
	
	rocket : new create_weapon
	(
	Rocket,
	sprite_get_bbox_right(Rocket),
	RocketBullet,
	30
	) 
}
#endregion