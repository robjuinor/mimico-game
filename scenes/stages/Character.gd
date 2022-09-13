extends KinematicBody2D

var velocidade = Vector2()
var direcao_cima2 = Vector2(0,-1)
var gravidade = 5000
var velocidadex = 1000*1
var velocidadepulo = -1200
var caixa_status

func _ready():
	caixa_status = get_tree().get_root().get_node("Stage1").get_node("ParallaxBackground").get_node("status")
	
func move_character():
	var pular =  Input.is_action_just_pressed("jump")
	var direita = Input.is_action_pressed("go_right")
	var esquerda = Input.is_action_pressed("go_left")
	velocidade.x = 0
	if direita:
		velocidade.x = velocidadex
		$charmodel_anim.flip_h = false
		$charmodel_anim.set_animation("run")
	elif esquerda:
			velocidade.x = -velocidadex
			$charmodel_anim.flip_h = true
			$charmodel_anim.set_animation("run")
	else:
		$charmodel_anim.set_animation("idle")
	
	if self.is_on_floor() and pular:
			velocidade.y = velocidadepulo

func _process(delta):
	velocidade.y += gravidade * delta
	move_character()
	velocidade = move_and_slide(velocidade,direcao_cima2)
	
	#Imprimindo status do game:
	
	
#	$Camera2D/GameStats.text = "GAME STATUS:\n\n"
#	$Camera2D/GameStats.text += "Velocidade x: "+ str(velocidade.x) + ".\n"
#	$Camera2D/GameStats.text += "Velocidade y: "+ str(velocidade.y) + ".\n"
#	$Camera2D/GameStats.text += str(get_tree().get_root().get_node("Stage1").get_node("portal").global_position)
	caixa_status.get_node("GameStats").text = "GAME STATUS:\n\n"
	caixa_status.get_node("GameStats").text += "Velocidade x: " + str(velocidade.x) + ".\n"
	caixa_status.get_node("GameStats").text += "Velocidade y: " + str(velocidade.y) + ".\n"
	caixa_status.get_node("GameStats").text += "Pos: " + str(self.global_position) + ".\n"
	caixa_status.get_node("GameStats").text += "Pos portal 2: " + str(get_tree().get_root().get_node("Stage1").get_node("portal").global_position)

# self.global_position = get_tree().get_root().get_node("Stage1").get_node("portal").global_position


#func _on_portal_area_entered(area):
#	# self.global_position = get_tree().get_root().get_node("Stage1").get_node("portal2").global_position
#	# self.global_position = Vector2(0,2)
#	get_tree().get_root().get_node("Stage1").get_node("Character").global_position =get_tree().get_root().get_node("Stage1").get_node("portal").global_position

#func _on_portal_area_shape_entered(area_id, area, area_shape, self_shape):
	#pass # Replace with function body.


func _on_portal_body_entered(body):
	self.global_position = get_tree().get_root().get_node("Stage1").get_node("portal2").global_position
