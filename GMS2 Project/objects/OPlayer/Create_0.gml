moveDir = 0;
moveSpd = 2;
xspd = 0;
yspd = 0;
get_dmg_create(20, true);

centerYOffset = -3;
centerY = y +centerYOffset;

weaponOffset = 1;
aimDir= 0;

face = 3;
sprite[0] = PlayerRight;
sprite[1] = PlayerBack;
sprite[2] = PlayerLeft;
sprite[3] = PlayerFront;

shootTimer = 0;

array_push(global.inventory, global.WeaponList.shotgun, global.WeaponList.revolver, global.WeaponList.rocket);

selectedWeapon = 0;
weapon = global.inventory[selectedWeapon];
