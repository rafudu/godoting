extends CharacterBody2D


const MAX_SPEED = 300.0
@onready var ball=%Ball
func _ready():
	pass
	
func _physics_process(delta):
	var velocity_magnitude = velocity.length();


	#rotation = (position.angle_to_point(bola.position))
	if(velocity_magnitude == 0):
		velocity = position.direction_to(ball.position)
	if(velocity.length() <= MAX_SPEED):
		velocity *= 2;
	
	var collision = move_and_collide(velocity*delta)
	if collision:
		print(collision.get_collider())
		velocity = velocity.bounce(collision.get_normal())
	

	
	

