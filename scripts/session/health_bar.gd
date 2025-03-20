extends Node2D
signal die
var base_health = 10.0;
var health;
@export var cursor: Cursor;
var died: bool = false;
func _ready() -> void:
	cursor.shoot.connect(calculate_shoot_damage);
	base_health = SessionParameters.health;
	health = base_health;
	update_health();

func _process(delta: float) -> void:
	passive_life_drain(delta);
func update_health():
	if health <= 0 and not died:
		die.emit();
		died = true;
	display_health();
func display_health():
	$Frame/HealthNumber.text = "%.0f/%.0f" %[health,base_health] ;
	$Frame/Body.scale.x = 47 * (health/base_health);
	
	
func passive_life_drain(delta):
	health -= delta/20;
	update_health();
func calculate_shoot_damage():
	health -= 0.5;
	update_health();
	
