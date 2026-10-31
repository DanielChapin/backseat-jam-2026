class_name ExitButton
extends Button

@onready var timer = $Timer

@export var default_text: String = "Exit"
@export var confirmation_message: String = "You sure?"
@export var confirmation_timeout: float = 3.0:
	set(val):
		confirmation_timeout = val
		if timer:
			timer.wait_time = confirmation_timeout

var awaiting_confirmation: bool:
	set(val):
		awaiting_confirmation = val
		if awaiting_confirmation:
			text = confirmation_message
			timer.start()
		else:
			text = default_text
			timer.stop()

func _ready() -> void:
	text = default_text
	timer.wait_time = confirmation_timeout

func _on_pressed() -> void:
	if awaiting_confirmation:
		get_tree().quit()
	else:
		awaiting_confirmation = true

func _on_timer_timeout() -> void:
	awaiting_confirmation = false
