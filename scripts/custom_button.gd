extends Area2D
class_name CustomButton;
signal clicked;

var disabled:bool = false;

func _on_mouse_entered() -> void:
	if not disabled:
		$Visuals/ColorFilter.color.a = 0.5;
		$AnimationPlayer.play("mouse_over");


func _on_mouse_exited() -> void:
	$Visuals/ColorFilter.color.a = 0.0;


func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index ==  MOUSE_BUTTON_LEFT and event.pressed and not disabled:
			$AnimationPlayer.play("click");
