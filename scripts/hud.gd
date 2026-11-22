extends CanvasLayer
@onready var vida_label: Label = $VidaLabel
@onready var moedas_label: Label = $MoedasLabel
@onready var jogador: Player = $"../Player"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	vida_label.text = "VIDA: " + str(jogador.vida)
	moedas_label.text = "MOEDAS: " + str(jogador.moedas)
