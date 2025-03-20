extends Area2D;
class_name Cursor;
signal shoot;
@export var camera:Camera2D;

func _ready() -> void:
	$Shoot.wait_time /= SessionParameters.attack_speed;
	scale *= SessionParameters.cursor_area;

func follow_camera():
	#assuming camera.zoom.x == camera.zoom.y
	var zoom = 1.0 if !camera else camera.zoom.x;
	position = get_viewport().get_mouse_position()/(zoom) - get_viewport().size /(2* zoom);

func _process(_delta: float) -> void:
	follow_camera();


func _on_shoot_timeout() -> void:
	$AnimationPlayer.play("shoot");
	shoot.emit();
