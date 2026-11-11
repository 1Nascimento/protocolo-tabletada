# Protocolo Tabletada — projeto Godot

## Como abrir
1. Extraia todo o ZIP para uma pasta do computador.
2. No gerenciador do Godot 4.6, clique em **Importar**.
3. Selecione o arquivo **project.godot**, que está na raiz da pasta extraída.
4. Aguarde a importação dos sprites e pressione **F5**.

O arquivo project.godot é o projeto editável. As pastas abaixo precisam permanecer junto dele. Use o Godot 4.6, versão em que o projeto foi validado; ele não é compatível com Godot 3.

## Pastas
- **cenas/menu/**: menu inicial.
- **cenas/jogo/**: partida principal e interface.
- **cenas/cenario/**: laboratório com mesas e muros sólidos.
- **cenas/personagens/**: protagonista.
- **cenas/inimigos/**: aspirador.
- **scripts/**: código separado em personagens, inimigos, jogo e interface.
- **recursos/animacoes/**: animações dos personagens.
- **recursos/sprites/**: imagens organizadas por função.
- **documentacao/prompts/**: prompts dos recursos visuais.
- **documentacao/capturas/**: imagens da partida.
- **documentacao/**: descrição dos recursos e verificação.

## Jogo
Tema: laboratório de robótica com aspiradores descontrolados.
Modo: horda vista de cima. Tipo: Abate, derrotar 50 inimigos.
WASD ou setas movem e orientam o personagem. Espaço ou clique esquerdo dão uma tabletada. Cada aspirador aguenta dois golpes. A vida do jogador é cinco. R reinicia depois da vitória ou derrota.

## Créditos
Código com assistência de OpenAI Codex. Sprites gerados com a ferramenta de imagens da OpenAI. O mapa foi fornecido como referência pelo responsável pelo projeto; autoria original não informada. Godot Engine: licença MIT.

## Câmera e caminhada
A câmera acompanha o personagem com suavização, zoom 2× e limites nas bordas do mapa. O movimento usa uma animação de quatro passos por direção; parado, ele continua jogando no tablet. Os pés foram alinhados entre caminhada, descanso e ataque.
## Colisões dos objetos
O servidor central, onze caixas de armazenamento, o terminal, o kit médico e cinco vasos agora são sólidos. A navegação lê as formas físicas do cenário em uma grade de 16 pixels, para os aspiradores contornarem os mesmos obstáculos do jogador. A tabletada também é bloqueada por esses objetos.
