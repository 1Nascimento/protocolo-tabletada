# Protocolo Tabletada

Esse é meu jogo de horda feito no Godot 4.6. A ideia é sobreviver num laboratório de robótica onde vários aspiradores saíram do controle. O personagem usa um tablet para atacar e precisa derrotar 50 inimigos.

## Como jogar

- **WASD** ou **setas**: andar.
- **Espaço** ou **clique esquerdo**: atacar com o tablet.
- **R**: recomeçar depois de ganhar ou perder.

O jogador começa com 5 pontos de vida, e cada aspirador aguenta dois golpes. Tem obstáculos pelo mapa, e os inimigos tentam contorná-los para chegar até o personagem.

## Como abrir

1. Extraia o ZIP.
2. Abra o Godot 4.6 e escolha **Importar**.
3. Selecione o arquivo `project.godot` da pasta do jogo.
4. Espere carregar os recursos e aperte **F5**.

## Como organizei as pastas

- `cenas/`: menu, arena, cenário, jogador e inimigos.
- `scripts/`: os códigos GDScript.
- `recursos/sprites/`: as imagens usadas no jogo.
- `recursos/animacoes/`: as animações dos personagens.
- `documentacao/`: os detalhes do projeto, imagens e prompts usados na geração da arte.

## De onde vieram o código e a arte

Usei bastante o **ChatGPT/OpenAI Codex** para desenvolver o jogo. A ajuda não foi só com pequenas correções: também envolveu a programação do jogador, inimigos, arena e menu, além da integração das cenas. Coloquei um comentário curto com a origem no início de cada script `.gd`. Os scripts do professor no Classroom foram mencionados durante o trabalho, mas não tenho os originais aqui para comparar linha por linha e afirmar quais trechos vieram deles. Se algum trecho foi copiado diretamente da aula, essa origem deve ser acrescentada junto ao trecho depois da comparação.

### Créditos dos recursos visuais

| Recurso | Origem / autor | Link | Licença / condição de uso |
| --- | --- | --- | --- |
| Sprites do jogador (`principal_compacto.png`, `andar.png`) | Gerados com a ferramenta de imagens da **OpenAI**, a partir de prompts e referências visuais | https://openai.com/index/introducing-4o-image-generation/ | Conteúdo gerado por IA; uso sujeito aos termos aplicáveis da OpenAI (não é uma licença de banco de sprites) |
| Sprite do aspirador (`aspirador.png`) | Gerado com a ferramenta de imagens da **OpenAI** | https://openai.com/index/introducing-4o-image-generation/ | Conteúdo gerado por IA; uso sujeito aos termos aplicáveis da OpenAI |
| Objetos e ambiente (`mesa.png`, `servidor.png`, `terminal.png`, `planta.png`, `caixa.png`, `kit_medico.png`, `piso.png`, `parede.png`, `esteira.png`, `marcador.png`) | Gerados com a ferramenta de imagens da **OpenAI** | https://openai.com/index/introducing-4o-image-generation/ | Conteúdo gerado por IA; uso sujeito aos termos aplicáveis da OpenAI |
| Mapa `laboratorio.png` | Imagem de referência fornecida para o projeto; **autor original não confirmado** | **Link de origem não disponível** | **Licença não confirmada.** Confirmar a autoria e o direito de uso antes de distribuir o jogo publicamente |
| Godot Engine (motor do jogo) | Godot Engine contributors | https://godotengine.org/license/ | MIT |

Não encontrei no projeto arquivos independentes de música, efeitos sonoros ou fontes de terceiros para creditar. Os arquivos PNG que ficam em `documentacao/capturas/` são capturas usadas para mostrar o jogo, não um pacote de sprites externo.

**Sobre a arte do laboratório:** não coloquei uma licença inventada. A referência foi fornecida durante o desenvolvimento, mas isso, por si só, não prova quem fez a imagem nem dá permissão de redistribuição. Se for uma imagem sua, basta corrigir o crédito e informar isso; se for de outra pessoa, é necessário adicionar o autor, o link e a licença real.

Os prompts utilizados para gerar vários sprites estão em `documentacao/prompts/`.

## O que foi feito com IA

Expliquei o uso da IA de forma mais detalhada em `documentacao/DECLARACAO_USO_IA.md`. Mantive também os arquivos de documentação do projeto, para mostrar como os personagens, o cenário e os testes foram organizados.
