# 🐧 Plataforma 2D

Jogo de plataforma 2D desenvolvido em equipe com **Godot Engine 4.7** e
**GDScript**, como projeto acadêmico da disciplina de **Desenvolvimento
de Jogos**.

O projeto reúne mecânicas de plataforma, inimigos, itens coletáveis,
sistema de vida, HUD e áudio. Seu objetivo é aplicar os conteúdos
estudados na disciplina por meio da construção colaborativa de um jogo
funcional.

## 🎮 Funcionalidades

-   **Personagem jogável:** movimentação horizontal, salto e animações.
-   **Sistema de vida:** o personagem possui vida limitada, recebe dano
    ao tocar inimigos e ao cair em áreas abaixo do cenário; ao perder
    toda a vida, ocorre a condição de morte e a cena é reiniciada.
-   **Inimigos:** inimigos do tipo Skeleton com movimentação horizontal,
    patrulhamento, detecção de paredes e bordas e colisão com o jogador.
-   **Indicador de dano:** exibição de um número flutuante que sobe e
    desaparece após o contato com um inimigo.
-   **Itens coletáveis:**
    -   Moedas, contabilizadas pelo jogador.
    -   Poção de vida, que recupera vida respeitando o limite máximo.
    -   Power-up de salto duplo, que libera temporariamente um segundo
        salto.
-   **HUD:** exibição da vida e da quantidade de moedas.
-   **Áudio:** música de fundo e efeitos sonoros associados a ações como
    pular, receber dano, coletar moedas, obter power-ups e game over.

## 🕹️ Controles

  Tecla            Ação
  ---------------- -------------------------
  ← / →            Movimentar o personagem
  Espaço / Enter   Pular

O salto duplo fica disponível temporariamente após coletar o power-up
correspondente.

## 🧰 Tecnologias e recursos

-   Godot Engine 4.7
-   GDScript
-   Pixel Art
-   `CharacterBody2D`
-   `AnimatedSprite2D`
-   `Area2D`
-   `RayCast2D`
-   `TileMapLayer`
-   `AudioStreamPlayer`

## 📁 Estrutura do projeto

``` text
plataforma_2d/
├── audio/
│   ├── background_music_sound.mp3
│   ├── coin_sound.wav
│   ├── game_over_sound.mp3
│   ├── game_start.mp3
│   ├── hit_sound.mp3
│   ├── jump_sound.mp3
│   └── power_up_sound.mp3
├── scenes/
│   ├── coin.tscn
│   ├── damage_number.tscn
│   ├── double_jump_power_up.tscn
│   ├── enemy.tscn
│   ├── forest.tscn
│   ├── health_potion.tscn
│   ├── main.tscn
│   └── player.tscn
├── scripts/
│   ├── collectible.gd
│   ├── damage_number.gd
│   ├── enemy.gd
│   ├── hud.gd
│   ├── main.gd
│   └── player.gd
├── sprites/
│   ├── 1 - Penguin/
│   ├── 2 - Fairy/
│   ├── 3 - Skeleton/
│   ├── 4 - Orange/
│   ├── coin.png
│   ├── health_potion.png
│   └── jump.png
├── titles/
│   ├── 1 - Grassland/
│   ├── 2 - Autumn Forest/
│   ├── 3 - Tropics/
│   ├── 4 - Winter World/
│   ├── 5 - Misc. universal tiles/
│   ├── decoration.tres
│   └── ground.tres
├── icon.svg
└── project.godot
```

## 🚀 Como executar

### Pré-requisito

-   Godot Engine 4.7.

### Clonar o repositório

``` bash
git clone https://github.com/muelzzkk/plataforma_2d.git
```

### Abrir o projeto

1.  Abra a Godot Engine.
2.  Na tela do Gerenciador de Projetos, selecione **Importar**.
3.  Localize o arquivo `project.godot` na pasta clonada.
4.  Importe e abra o projeto.
5.  Execute a cena principal com `F5`.

## 👥 Equipe de desenvolvimento

Projeto desenvolvido colaborativamente por:

  --------------------------------------------------------------------------------------------
  Integrante                          Perfil no GitHub
  ----------------------------------- --------------------------------------------------------
  Samuel Freitas                      [@muelzzkk](https://github.com/muelzzkk)

  Emilly Vitória                      [@EmillyDelf](https://github.com/EmillyDelf)

  John Harrison                       [@JohnHarrison-br](https://github.com/JohnHarrison-br)

  Marco Antonio                       [@MarcoZueiroBR](https://github.com/MarcoZueiroBR)
  --------------------------------------------------------------------------------------------

## 🎓 Natureza acadêmica e uso

Este projeto foi desenvolvido **exclusivamente para fins acadêmicos e
educacionais**, como atividade prática de aprendizado da equipe na
disciplina de **Desenvolvimento de Jogos**.

O trabalho tem finalidade didática: exercitar programação, lógica,
organização de cenas e scripts, implementação de mecânicas e colaboração
em equipe. Não foi desenvolvido com finalidade comercial.

Esta declaração informa o propósito do projeto, mas **não representa uma
licença formal de software**. O repositório não declara, por meio deste
README, uma licença aberta específica. A utilização de recursos de
terceiros permanece sujeita às respectivas condições e direitos de seus
autores.

## 📌 Status

**Projeto concluído.** As funcionalidades descritas neste documento
correspondem à versão final disponibilizada no repositório.

------------------------------------------------------------------------

Desenvolvido em equipe com **Godot Engine 4.7** e **GDScript**.

**Projeto acadêmico --- Disciplina de Desenvolvimento de Jogos.**
