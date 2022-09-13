extends Node2D

var direcao_cima = Vector2(0,-1)
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
#func _ready():
	#$AudioStreamPlayer.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


############################################################################
######################        NOTES        #################################
############################################################################
#var screen_coord = get_viewport_transform() * (get_global_transform() * local_pos)

#work in Canvas coordinates (CanvasItem.get_global_transform()), 
#to allow automatic screen resolution resizing to work properly.



#func _on_AudioStreamPlayer_finished():
#	$AudioStreamPlayer.play()
