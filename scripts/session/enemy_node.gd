extends Area2D
signal get_hit
@export var loot_scene: PackedScene;


var linear_velocity = Vector2.ZERO;
var angular_velocity = 0;

func _process(delta: float) -> void:
	position += linear_velocity * delta;
	rotation += angular_velocity*delta;

var health = 1.0;
var damage_factor= SessionParameters.damage;

func display_health():
	$Visuals/Body.scale.y = health * 16;
	$Visuals/Body.position.y = (8 * (1-health)) +2;

func drop_loot():
	var loot = loot_scene.instantiate();
	loot.position = position;
	var session = get_parent().get_parent();
	if session.name == "Session":
		session.add_child(loot);

func get_killed():
	drop_loot();
	queue_free();

func take_damage():
	get_hit.emit();
	$AnimationPlayer.play("hit");
	if $AnimationPlayer/ModulateAnimationPlayer:
		$AnimationPlayer/ModulateAnimationPlayer.play("hit")
	health -= 0.2 * damage_factor;
	if health <= 0:
		get_killed();
	display_health();

func _on_area_entered(body: Area2D) -> void:
	if body is Cursor:
		body.shoot.connect(take_damage);
	if body.name == "DespawnZone":
		queue_free();


func _on_area_exited(body: Area2D) -> void:
	if body is Cursor:
		body.shoot.disconnect(take_damage);
