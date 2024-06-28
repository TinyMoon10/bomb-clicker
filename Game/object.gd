extends AnimatedSprite2D
var check = 0
var highscore = 0
var score = 0
var triggered = false
var exploded = false
var random = RandomNumberGenerator.new()

func _on_area_2d_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("click"):
		random.randomize()
		triggered = false
		if not triggered and not exploded:
			score += 1
		triggered = true
		if random.randi_range(1, 100) <= 8:
			highscore = score
			if check > highscore:
				highscore = check
			elif check < highscore:
				check = highscore
			exploded = true
			play("on")
			score = 0
		$Score.text = str(score)
		$Highscore.text = str(highscore)

func _on_animation_finished():
	play("off")
	exploded = false 
