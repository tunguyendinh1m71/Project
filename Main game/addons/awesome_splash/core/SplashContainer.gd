## You can download demo splash screen here
## https://github.com/duongvituan/godot-awesome-splash
## Import a demo AweSplashScreen you like to your project.
## Drag and drop it to SplashContainer.
tool
extends "res://addons/awesome_splash/core/BaseSplashContainer.gd"

var Next_scene = preload("res://Menu/MainMenu.tscn")

func _ready():
	if not Engine.editor_hint:
		connect("finished", self, "_on_finished_splash_screen")
		play()


# Set true if you want click to skip screen
func _splash_screen_can_be_skipped_when_clicked_screen() -> bool:
	return true


# Todo: move to other screen here:
func _on_finished_splash_screen():
	get_parent().add_child(Next_scene.instance())
	print("_on_finished_splash_screen")
	queue_free()
