extends AudioStreamPlayer3D

@onready var character: CharacterBody3D = get_parent()

func play_footstep() -> void:
	if not character.is_on_floor():
		return
	
	for index in character.get_slide_collision_count():
		var col := character.get_slide_collision(index)
		if col.get_normal() != character.get_floor_normal():
			continue
		
		var collider := col.get_collider()
		if collider is not WorldSound:
			continue
		
		var info := collider as WorldSound
		stream = info.footstep_sounds
		break
	
	play()
