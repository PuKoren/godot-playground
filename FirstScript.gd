extends MeshInstance


# Declare member variables here. Examples:
var initialRotation = Vector3.ZERO
var rotationVelocity = Vector3.ZERO


# Called when the node enters the scene tree for the first time.
func _ready():
	initialRotation = self.rotation

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var direction = Vector3.ZERO
	
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
	
	if Input.is_key_pressed(KEY_R):
		self.rotation = initialRotation
		rotationVelocity = Vector3.ZERO
