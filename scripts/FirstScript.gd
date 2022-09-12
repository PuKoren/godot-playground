extends MeshInstance


# Declare member variables here. Examples:
var initialRotation = Vector3.ZERO
var rotationVelocity = Vector3.ZERO


# Called when the node enters the scene tree for the first time.
func _ready():
	initialRotation = self.rotation

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

	if Input.is_key_pressed(KEY_RIGHT):
		rotationVelocity.y += 0.1 * delta
	if Input.is_key_pressed(KEY_LEFT):
		rotationVelocity.y -= 0.1 * delta
	if Input.is_key_pressed(KEY_UP):
		rotationVelocity.x -= 0.1 * delta
	if Input.is_key_pressed(KEY_DOWN):
		rotationVelocity.x += 0.1 * delta
	
	self.rotate(Vector3.FORWARD, rotationVelocity.y)
	self.rotate(Vector3.RIGHT, rotationVelocity.x)

func _input(event):
	if event is InputEventKey and event.pressed:
		if event.scancode == KEY_ESCAPE:
			self.get_tree().quit()
		elif event.scancode == KEY_R:
			self.rotation = initialRotation
			rotationVelocity = Vector3.ZERO
		elif event.scancode == KEY_SPACE:
			self.get_parent().gravity_scale = 1.0
