//dmg
get_dmg(ODmgEnemy);

//death
if hp <= 0
{
	global.enemyKillCount++;
	instance_destroy()
}
