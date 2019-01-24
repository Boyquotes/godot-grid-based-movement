extends KinematicBody2D

var direction = Vector2();

const UP = Vector2(0, -1);
const DOWN = Vector2(0, 1);
const RIGHT = Vector2(1, 0);
const LEFT = Vector2(-1, 0);

var type;
var grid

var speed = 0;
const MAX_SPEED = 200;

var velocity = Vector2();

func _ready():
	grid = get_parent();
	type = grid.ENTITY_TYPES.PLAYER
	pass


func  _process(delta):
	
	var is_moving = Input.is_action_pressed("ui_up") or Input.is_action_pressed("ui_right") or Input.is_action_pressed("ui_down") or Input.is_action_pressed("ui_left")
	
	direction = Vector2()
	if is_moving:
		speed = MAX_SPEED;
		
		if Input.is_action_pressed("ui_up"):
			direction += UP;		
		elif Input.is_action_pressed("ui_down"):
			direction += DOWN;
		
		if Input.is_action_pressed("ui_right"):
			direction += RIGHT;
		elif Input.is_action_pressed("ui_left"):
			direction += LEFT;
	else:
		speed = 0;
		
	var target_pos = grid.update_child_pos(self)
	position = (target_pos)
	#velocity = speed * direction.normalized() * delta;
	#move_and_collide(velocity);
		
	pass