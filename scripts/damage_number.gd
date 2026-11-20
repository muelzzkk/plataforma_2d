
extends Node2D

@onready var label: Label = $Label


## Define o valor que será exibido.
func set_damage(amount: int) -> void:
    label.text = "-%d" % amount


func _ready() -> void:

    # Cria uma animação simultânea.
    var tween := create_tween().set_parallel(true)

    # Faz o número subir.
    tween.tween_property(
        self,
        "position:y",
        position.y - 18.0,
        0.55
    )

    # Faz o número desaparecer.
    tween.tween_property(
        self,
        "modulate:a",
        0.0,
        0.55
    )

    # Remove o objeto quando a animação termina.
    tween.finished.connect(queue_free)
