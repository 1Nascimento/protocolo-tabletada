# Personagem principal

Folha transparente com 20 poses, organizada em cinco colunas e quatro linhas. As linhas mostram frente, esquerda, direita e costas. As duas primeiras colunas formam o descanso, jogando no tablet; as três seguintes mostram preparação, tabletada e recuperação.

A cena cenas/personagens/jogador.tscn usa recursos/animacoes/jogador.tres. O movimento segue WASD ou setas. Espaço ou clique esquerdo executam a tabletada, bloqueando o movimento até o fim do golpe. A direção é definida pelo último movimento. O ataque causa dano aos aspiradores à frente e é bloqueado pelas mesas e muros.

Idle: dois frames a 3 fps. Tabletada: três frames a 8 fps. O movimento usa quatro frames por direção a 9 fps, na folha andar.png. Filtro Nearest.

Animações, retorno ao descanso e dano verificados em execução no Godot 4.6.
Origem da arte: ferramenta de imagens da OpenAI. Código: assistência de OpenAI Codex. Prompt em prompts_personagem.md.

## Câmera
Camera2D como filha do jogador, zoom 2× e suavização de velocidade 7. Limites: x de 0 a 1672, y de 0 a 941. A interface permanece fixa na tela.
Os recortes de todas as animações usam a mesma base dos pés, com sombra de contato.
