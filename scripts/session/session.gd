extends Node2D

@export var session_result_scene: PackedScene;

func terminate_session():
	$Gui/TerminateButton.disabled = true;
	add_child(session_result_scene.instantiate());
	$Gui/Cursor.queue_free();
	


func _on_health_bar_die() -> void:
	terminate_session();

func _on_terminate_button_clicked() -> void:
	terminate_session();
	
	pass;
