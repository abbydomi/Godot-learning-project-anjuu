extends KinematicBody

var moveinput = Vector3(0,0,0)
var speed = Vector3(0,0,0)
const ACC = 0.4
const SPEED_MAX = 16

func _ready():
	pass

func _physics_process(delta):
	
	moveinput.x = (int(Input.is_action_pressed("ui_up"))-int(Input.is_action_pressed("ui_down")));
	moveinput.z = -(int(Input.is_action_pressed("ui_left"))-int(Input.is_action_pressed("ui_right")));
	
	if !moveinput.x: speed.x = lerp(speed.x,0,0.03)
	if !moveinput.z: speed.z = lerp(speed.z,0,0.03)
	speed += ACC * moveinput
	speed.x = clamp(speed.x,-SPEED_MAX,SPEED_MAX)
	speed.z = clamp(speed.z,-SPEED_MAX,SPEED_MAX)
	
	$MeshInstance.rotate_z(-deg2rad(0.7)*speed.x)
	$MeshInstance.rotate_x(deg2rad(0.7)*speed.z)
	

	move_and_slide(speed)
