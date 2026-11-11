# Verificação da versão Windows

Testada em 11/11/2026 com Godot 4.6, renderizador Compatibility, resolução de janela 1280 × 720 e placa NVIDIA GeForce GTX 1060 3 GB.

## Testes funcionais
Todos passaram em execução no Godot:
- Surgimento inicial de quatro aspiradores.
- Colisões do jogador com mesas e muros.
- Movimento nas quatro direções.
- Tabletada causando dano e atordoamento.
- Retorno da animação de ataque ao descanso.
- Inimigo derrotado no segundo golpe e incremento do contador.
- Dano ao jogador com intervalo de invulnerabilidade.
- Derrota ao acabar a vida.
- Vitória ao completar 50 abates.
- Aspirador contornando uma mesa para alcançar o jogador.
- Limite de doze inimigos simultâneos.
- Horda ativa sem erros durante a simulação.

## Apresentação e exportação
Menu inicial, partida e tela de vitória renderizados e conferidos por captura. Executável Windows exportado em modo release e inicializado sem erros.

## Desempenho
Amostra de cinco segundos com gráficos e doze aspiradores simultâneos: média e mínimo reportados de 60 FPS, com limite configurado em 60 FPS. Teste local e curto; o resultado pode mudar em outros computadores. A simulação automática também executou 600 passos adicionais com a horda completa sem erros.

## Escopo desta versão
Partida completa com início, objetivo, vitória, derrota e reinício. Sem trilha sonora. Caixas, equipamentos e vasos têm colisão. Os inimigos podem se sobrepor. Publicação de página, histórico de aulas e tags do repositório não fazem parte deste pacote.

## Atualização de câmera e caminhada
Confirmados no Godot 4.6: animação durante o movimento nas quatro direções, retorno ao idle, ataque, câmera ativa com zoom 2×, acompanhamento horizontal e limitação nos cantos. Capturas renderizadas conferidas. A bateria anterior de colisões, combate, objetivo e navegação passou novamente.

## Colisões de caixas e equipamentos
Verificadas em execução as 19 novas formas de colisão e sua marcação na grade de navegação. Os oito pontos de surgimento permanecem livres e conectados. Aspirador testado contornando o servidor central. A bateria de movimento, câmera, animações, ataque, vida, objetivo e horda passou novamente.

