extends Node
@export var node_scene: PackedScene;
const SPIN_SPEED = 0.5;
const SPEED = 15;
func _ready() -> void:
	$Timer.wait_time /= SessionParameters.spawn_rate;
	spawn_node(); 

func spawn_node():
	var spawn_location = $Paths/SpawnLocationPath/SpawnLocation;
	var facing_location = $Paths/FacingLocationPath/FacingLocation;
	spawn_location.progress_ratio = randi();
	facing_location.progress_ratio = randi();
	
	var node =node_scene.instantiate();
	node.position = spawn_location.position;
	
	
	var facing_vector = spawn_location.position.direction_to(facing_location.position);
	node.linear_velocity = facing_vector * SPEED;
	node.angular_velocity = randf_range(-SPIN_SPEED , SPIN_SPEED);
	
	add_child(node); 
	pass

func _on_timer_timeout() -> void:
	spawn_node();

	
	
