extends MeshInstance


# Declare member variables here. Examples:
var initialRotation = Vector3.ZERO
var initialTranslation = Vector3.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	initialRotation = rigidBody().rotation
	initialTranslation = rigidBody().translation

func rigidBody():
	return self.get_parent()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

	if Input.is_key_pressed(KEY_RIGHT):
		rigidBody().add_torque(Vector3.FORWARD * 15 * delta)
	if Input.is_key_pressed(KEY_LEFT):
		rigidBody().add_torque(Vector3.BACK * 15 * delta)
	if Input.is_key_pressed(KEY_UP):
		rigidBody().add_torque(Vector3.LEFT * 15 * delta)
	if Input.is_key_pressed(KEY_DOWN):
		rigidBody().add_torque(Vector3.RIGHT * 15 * delta)


func _input(event):
	if event is InputEventKey and event.pressed:
		if event.scancode == KEY_ESCAPE:
			self.get_tree().quit()
		elif event.scancode == KEY_R:
			rigidBody().rotation = initialRotation
			rigidBody().translation = initialTranslation
			rigidBody().linear_velocity = Vector3.ZERO
			rigidBody().angular_velocity = Vector3.ZERO
			rigidBody().gravity_scale = 0.0
		elif event.scancode == KEY_SPACE:
			rigidBody().gravity_scale = 1.0
