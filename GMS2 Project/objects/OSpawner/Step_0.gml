timer++

if instance_number(OEnemyParent) >= global.activeEnemyMax || global.totalEnemiesSpawned >= global.enemyRoomMax
{
	timer = 0;
}

if timer >= spawnTime && !place_meeting(x, y, OChase)
{
	var _inst = instance_create_depth(x, y, depth-1, OChase)
	with(_inst)
	{
		image_alpha = 0;
		state = -1;
	}
	
	timer = 0
}










