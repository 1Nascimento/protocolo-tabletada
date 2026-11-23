# Como usei IA no Protocolo Tabletada

Usei o ChatGPT e o Codex durante boa parte da criação do jogo. A IA ajudou tanto a escrever os scripts quanto a juntar as cenas e resolver as partes que não estavam funcionando direito. Também usei a ferramenta de imagens da OpenAI para gerar os sprites e deixar a arte no mesmo estilo.

No código, a ajuda apareceu principalmente nestas partes:

- **Jogador (`jogador.gd`)**: movimentação, animações, ataque com o tablet, vida e dano.
- **Aspirador (`aspirador.gd`)**: perseguição do personagem, estados do inimigo, ataque e morte.
- **Arena (`arena.gd`)**: surgimento dos inimigos, caminho para desviar dos obstáculos, contagem de abates e telas de vitória e derrota.
- **Menu (`menu.gd`)**: botões de começar o jogo e sair.

Para facilitar a conferência, deixei um comentário de uma linha no começo de cada um desses arquivos dizendo que o código foi desenvolvido com ajuda do ChatGPT/OpenAI Codex. Não foi só uma revisão dos scripts: a participação da IA foi grande no desenvolvimento do projeto.

Também foram usados materiais e ideias das aulas, mas os scripts originais do Classroom não estão neste ZIP. Por isso não marquei nenhuma linha específica como “copiada do professor” sem ter como comparar. Se eu identificar algum trecho igual ao material da aula, preciso adicionar a referência ao lado dele.

Na parte visual, os sprites foram feitos com geração de imagens por IA. Os prompts estão guardados na pasta `documentacao/prompts/`. Para o mapa do laboratório, foi usada uma imagem de referência fornecida para o projeto, mas ainda falta confirmar a autoria original e a licença. Deixei essa pendência indicada no README, em vez de inventar um crédito.

O arquivo `README.md` também explica como abrir e jogar, além de listar a origem dos recursos.
