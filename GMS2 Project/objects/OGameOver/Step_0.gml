shootkey = global.shootKey

alpha += alphaSpd;
alpha = clamp(alpha,0 , 1);

if shootkey && alpha >= 1
{
	room_restart();
}




