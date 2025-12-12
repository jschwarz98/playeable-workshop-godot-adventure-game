class_name BasePlayerState
extends RefCounted

## Called when we enter this state. Usually for setup
func enter(_player: Player) -> void:
	pass

## Called before updating this state. 
## Usually used to switch to a new state before running the update
func before_update(_player: Player) -> void:
	pass

## Called to update/progress the state
func update(_player: Player, _delta: float) -> void:
	pass

## Called when exiting the state. Usually for clean up
func exit(_player: Player) -> void:
	pass
