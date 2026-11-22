# 🐧 Plataforma 2D

Projeto de um jogo de plataforma 2D desenvolvido na **Godot Engine**, utilizando GDScript e recursos de pixel art.

O jogo possui um personagem controlável, cenários construídos com TileMap e uma estrutura preparada para a implementação de novas mecânicas e fases.

## 🎮 Tecnologias utilizadas

- Godot Engine 4.7
- GDScript
- Pixel Art
- CharacterBody2D
- AnimatedSprite2D
- Area2D
- RayCast2D
- TileMapLayer

## 📁 Estrutura do projeto

```text
plataforma_2d-main/
│
├── scenes/
│   ├── main.tscn
│   ├── forest.tscn
│   ├── player.tscn
│   ├── enemy.tscn
│   └── damage_number.tscn
│
├── scripts/
│   ├── player.gd
│   ├── enemy.gd
│   └── damage_number.gd
│
├── sprites/
│   ├── 1 - Penguin/
│   ├── 2 - Fairy/
│   ├── 3 - Skeleton/
│   └── ...
│
├── titles/
│   ├── ground.tres
│   └── decoration.tres
│
├── docs/
│   └── INTEGRACAO_INIMIGOS.md
│
├── project.godot
└── README.md
```

## 🕹️ Controles

| Tecla | Ação |
|---|---|
| ← | Movimentar para a esquerda |
| → | Movimentar para a direita |
| Espaço / Enter | Pular |

Os controles utilizam as ações padrão do Input Map da Godot (`ui_left`, `ui_right` e `ui_accept`).

## 👾 Sistema de inimigos

Foi implementado um inimigo do tipo Skeleton, utilizando sprites que já estavam disponíveis nos recursos originais do projeto.

### Funcionalidades

- Movimentação horizontal automática.
- Patrulhamento com limites configuráveis.
- Detecção de paredes e ausência de chão.
- Animação de caminhada.
- Detecção de contato com o jogador.
- Comunicação de eventos de dano por meio de Signals.

### Indicador visual de dano

Quando o jogador entra em contato com um inimigo, é criado um indicador numérico que apresenta a quantidade de dano recebido.

O indicador possui:
- Texto numérico vermelho.
- Movimento vertical suave.
- Animação de desaparecimento.
- Remoção automática após a animação.

### Organização técnica

O sistema utiliza cenas independentes e reutilizáveis:

- `enemy.tscn`: representa o inimigo.
- `enemy.gd`: controla movimentação, patrulha e detecção de contato.
- `damage_number.tscn`: representa o indicador de dano.
- `damage_number.gd`: controla a animação do indicador.

Os inimigos são instanciados na cena principal, permitindo reutilização em outras fases.

## 🔗 Integração com o sistema de vida

O inimigo disponibiliza o sinal:

```gdscript
signal damage_requested(target: Node, amount: int)
```

Esse sinal comunica o personagem atingido e a quantidade de dano solicitada.

A redução efetiva da vida deverá ser conectada ao sistema de vida desenvolvido separadamente.

Essa abordagem mantém a responsabilidade do inimigo independente da implementação de vida e morte do jogador.

## 🚀 Como executar o projeto

1. Instale a Godot Engine 4.7.
2. Clone este repositório.
3. Abra a Godot Engine.
4. Importe o projeto selecionando o arquivo `project.godot`.
5. Aguarde a importação dos recursos.
6. Execute o projeto pressionando `F5`.

### Clonar o repositório

```bash
git clone URL_DO_REPOSITORIO
```

## 🛠️ Desenvolvimento

O projeto está organizado em cenas e scripts independentes, buscando facilitar a manutenção, reutilização de componentes e implementação de novas funcionalidades.

As alterações devem respeitar a separação de responsabilidades entre os integrantes da equipe.

## 📌 Status do desenvolvimento

- [x] Estrutura inicial do jogo.
- [x] Personagem jogável.
- [x] Animações do personagem.
- [x] Cena de inimigo Skeleton.
- [x] Movimentação e patrulhamento dos inimigos.
- [x] Detecção de contato com o jogador.
- [x] Indicador visual de dano.
- [x] Comunicação do evento de dano por Signal.
- [x] Integração com o sistema de vida.
- [x] Implementação de itens coletáveis.
- [x] Implementação do HUD.
- [x] Implementação de áudio.

---

**Projeto acadêmico — Desenvolvimento de Jogos 2D**

Desenvolvido em equipe utilizando Godot Engine e GDScript.
