extends CustomButton

@export var color: Color;
@export var text: String;
@export var width: float;


func _ready() -> void:

	if color:
		$Visuals/Frame/Body.color = color;
	var text_width: int;
	if text:
		$Visuals/Frame/Label.text = text;
		text_width = 14 + text.length() * 8;
	if width and text:
		$Visuals/Frame/Label.position.x += (width - text_width) /2;
	if not width and text:
		width = text_width;
	if width:
		$Visuals/Frame.size.x = width;
		$Visuals/Frame/Body.size.x = width-4;
		$Visuals/ColorFilter.size.x = width;
		$CollisionShape2D.shape.size.x = width;
		var offset = (width-40)/2;
		$Visuals/Frame.position.x -= offset;
		#$Visuals/Frame/Body.size.x -= offset;
		$Visuals/ColorFilter.position.x-= offset;
		
