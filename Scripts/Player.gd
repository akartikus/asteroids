extends KinematicBody2D

export (int) var speed = 200
export (float) var rotation_speed = 2.5

var _velocity := Vector2()
var _rotation_dir := 0

func get_input() -> void:
	_rotation_dir = 0
	_velocity = Vector2()
	if Input.is_action_pressed('right'):
		_rotation_dir += 1
	if Input.is_action_pressed('left'):
		_rotation_dir -= 1
	if Input.is_action_pressed('down'):
		_velocity = Vector2(-speed, 0).rotated(rotation)
	if Input.is_action_pressed('up'):
		_velocity = Vector2(speed, 0).rotated(rotation)
		
func _process(delta: float) -> void:
	get_input()
	rotation += _rotation_dir * rotation_speed * delta
	_velocity = move_and_slide(_velocity)
