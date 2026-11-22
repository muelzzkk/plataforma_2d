extends Node2D

@onready var background_music: AudioStreamPlayer = $BackgroundMusic


func _ready() -> void:
	var music := background_music.stream as AudioStreamMP3
	music.loop = true
	background_music.play()


func _on_item_collected(
	item_type: Collectible.ItemType, _value: int, _player: Player
) -> void:
	match item_type:
		Collectible.ItemType.COIN:
			$CoinSound.play()
		Collectible.ItemType.HEAL, Collectible.ItemType.DOUBLE_JUMP:
			$PowerUpSound.play()


func _on_player_died() -> void:
	background_music.stop()
	$StartSound.stop()
