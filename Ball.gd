extends RigidBody2D


const MAX_SPEED = 150


func _integrate_forces(state):
	if state.linear_velocity.length() > MAX_SPEED:
		state.linear_velocity = state.linear_velocity.normalized() * MAX_SPEED
