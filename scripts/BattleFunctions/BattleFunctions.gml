function NewEncounter (_enemies, _bg)
{
	instance_create_depth
	(
	camera_get_view_x(view_camera[0]),
	camera_get_view_x(view_camera[0]),
	-9999,
	oBattle,
	{enemies: _enemies, creator: id, battleBackground: _bg}
	);
}

function BattleChargeHP(_target, _amout, _AliveDeadOrEither = 0)
{
	//_AliveDeadOrEither: 0 = alive only, 1 = dead only, 2 = any
	var _failed = false;
	if (_AliveDeadOrEither == 0) && (_target.hp <= 0) _failed = true;
	if (_AliveDeadOrEither == 1) && (_target.hp > 0) _failed = true;
	
	var _col = c_white;
	if (_amout > 0) _col = c_lime;
	if (_failed)
	{
		_col = c_white;
		_amout = "Failed";
	}
	instance_create_depth
	( 
		_target.x,
		_target.y,
		_target.depth-1,
		oBattleFloatingText,
		{font: fnM5x7, col: _col, text: string(_amout)}
	);
	if (!_failed) _target.hp = clamp(_target.hp + _amout, 0, _target.hpMax);
}
