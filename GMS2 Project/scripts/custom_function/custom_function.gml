function draw_weapon()
{
	
var _xOffset = lengthdir_x(weaponOffset, aimDir);
var _yOffset = lengthdir_y(weaponOffset, aimDir);

var _weaponYscale = 1;
if aimDir > 90 && aimDir < 270
{
	_weaponYscale = -1;
}

draw_sprite_ext(weapon.sprite, 0, x + _xOffset, centerY + _yOffset, 1, _weaponYscale, aimDir, c_white, 1);

}

function get_dmg(_dmgObj, _iframes = false)
{
	if _iframes == true && iframeTimer > 0
	{
		iframeTimer--;
		
		if iframeTimer mod 5 == 0
		{
			if image_alpha == 1
			{
				image_alpha = 0;
			} else {
				image_alpha = 1;
			}
		}	
		
		hp = clamp(hp, 0, maxhp)
		
		exit;
	}
	
	image_alpha = 1;
	
	if place_meeting(x, y, _dmgObj)
	{	
		var _instlist = ds_list_create();
		instance_place_list(x, y, _dmgObj, _instlist, false);
		var _listsize = ds_list_size( _instlist );
	
		var _hitConfirm = false	
		for(var i = 0; i < _listsize; i++)
		{
			var _inst = ds_list_find_value(_instlist, i);
	
			if _iframes == true || ds_list_find_index(dmgList, _inst) == -1
			{
				if _iframes == false
				{
				ds_list_add(dmgList,_inst);
				}
				
				hp -= _inst.dmg;
				_hitConfirm = true
				_inst.hitconfirm = true;
			}
		}
		if _iframes == true && _hitConfirm
		{
			iframeTimer = iframeNumber;
		}
		
		ds_list_destroy(_instlist)	
	}
	if _iframes == false
	{
		var _dmgListSize = ds_list_size(dmgList);
		for(var i = 0; i < _dmgListSize; i++)
		{
			var _inst = ds_list_find_value(dmgList, i);
			if !instance_exists(_inst) || !place_meeting(x, y, _inst)
			{
				ds_list_delete(dmgList, i);
				i--;
				_dmgListSize--;
			}
		}
	}
	
	hp = clamp(hp, 0, maxhp)
}	

function get_dmg_create(_hp = 10, _iframes = false)
{
	maxhp = _hp;
	hp = _hp;
	
	if _iframes == true
	{
		iframeTimer = 0;
		iframeNumber = 90;
	}
	
	if _iframes == false
	{
	dmgList = ds_list_create();
	}
}

function get_dmg_cleanup()
{
	ds_list_destroy(dmgList);
}
