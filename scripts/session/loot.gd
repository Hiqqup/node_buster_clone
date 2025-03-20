extends Node2D
var cursor: Cursor;
func _ready() -> void:
	cursor = get_parent().get_node("Gui/Cursor");

const REPEL_FROM_MOUSE = -.7
var follow_mouse: bool = false;
var mouse_follow_speed: float = REPEL_FROM_MOUSE;

func collect():
	queue_free();
	
func _process(delta: float) -> void:
	if follow_mouse and is_instance_valid(cursor):
		var to_cusor: Vector2 =  cursor.position - position;
		position+= to_cusor.normalized() * mouse_follow_speed;
		mouse_follow_speed += 0.1;
		if to_cusor.length() <= 0.9:
			collect();
		
func _on_collection_area_mouse_entered() -> void:
	follow_mouse = true;


func _on_collection_area_mouse_exited() -> void:
	follow_mouse = false;
	mouse_follow_speed = REPEL_FROM_MOUSE;
