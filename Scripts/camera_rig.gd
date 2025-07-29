extends SpringArm3D

@export var turn_rate := 120
@export var mouse_sensitivity := 0.75
@export var height := 1.35

@onready var camera: Camera3D = $Camera3D
@onready var player: CharacterBody3D = get_parent()

var mouse_input := Vector2(0, 0)

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _physics_process(delta: float) -> void:
	position = player.position
	position.y += height
	
func _process(delta: float) -> void:
	var look_input := Input.get_vector("view_right", "view_left", "view_down", "view_up")
	
	look_input = look_input  * turn_rate * delta
	look_input += mouse_input
	mouse_input = Vector2(0, 0)

	rotation_degrees.x += look_input.y
	rotation_degrees.y += look_input.x
	
	rotation_degrees.x = clampf(rotation_degrees.x, -70, 50)

func _input (event: InputEvent) -> void: 
	if event is InputEventMouseMotion:
		mouse_input = -1 * event.relative * mouse_sensitivity
	elif event is InputEventKey and event.keycode == KEY_ESCAPE and event.pressed:
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	elif event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and Input.mouse_mode == Input.MOUSE_MODE_VISIBLE:
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
